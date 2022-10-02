# Maintainer: FabioLolix
# Maintainer: squitch

pkgname=tess-git
pkgver=0.6.2.r0.gf382a7d
pkgrel=1
epoch=1
pkgdesc="Hackable, simple, rapid and beautiful terminal for the new era"
arch=(x86_64)
url="https://github.com/SquitchYT/Tess"
license=(MPL2)
depends=(gtk3 nss)
makedepends=(git npm cmake nodejs-lts-gallium)
source=("git+https://github.com/SquitchYT/Tess.git")
sha256sums=('SKIP')

pkgver() {
  cd "Tess"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "Tess"
  install -D "build/ressources/desktop/tess.desktop" "${pkgdir}/usr/share/applications/Tess.desktop"
  install -D "build/ressources/desktop/open-tess-here.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/tesshere.desktop"
  install -D "build/ressources/desktop/open-app-in-tess.desktop" "${pkgdir}/usr/share/kservices5/ServiceMenus/appintess.desktop"
  install -D "build/ressources/icon/icon.png" "${pkgdir}/usr/share/pixmaps/tess.png"
  mkdir -p "${pkgdir}/usr/share/man"
  cp -r -f build/ressources/man/ "${pkgdir}/usr/share/man/"

  if type "$kbuildsycoca5" > /dev/null; then
    kbuildsycoca5
  fi

  cd cli
  cmake . -B build
  make -C build
  strip build/tess-cli
  install -Dm755 build/tess-cli -t "${pkgdir}/usr/bin/"

  npm install
  npm run build

  mkdir -p "${pkgdir}/usr/lib/tess"
  cd ../dist/linux-unpacked
  cp -r -f * "${pkgdir}/usr/lib/tess/"
  ln -s "/usr/lib/tess/tess" "${pkgdir}/usr/bin/tess"
}
