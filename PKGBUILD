# Maintainer: italoghost <eduprodive at posteo dot me>

pkgname=freetube-electron-git
_pkgname=FreeTube
pkgver=0.23.12.beta.r9332.6628c3e
pkgrel=1
pkgdesc='A private YouTube client - built from latest git, with the default electron.'
arch=('x86_64')
url="https://freetubeapp.io"
license=('AGPL-3.0-or-later')
makedepends=('git' 'yarn')
provides=("${pkgname%-electron-git}")
conflicts=("${pkgname%-electron-git}")
source=(git+https://github.com/FreeTubeApp/FreeTube
       freetube.desktop)
sha256sums=("SKIP" 
            "496fc67b30fa66e8eff1e551121e5bb7ae0253bfb804b3a902d4e7bd3cdcbc26")

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.r%s.%s" "$(git tag --sort=committerdate | tail -1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname/_scripts/build.mjs"
}

build() {
  cd $_pkgname
  yarn install
  yarn run build
}

package() {
  install -d "${pkgdir}/usr/lib/freetube"
  install -d "${pkgdir}/usr/bin"

  # copying libs
  cp -R "./$_pkgname/build/linux-unpacked/." "${pkgdir}/usr/lib/freetube/"

  # executable
  ln -s "/usr/lib/freetube/$_pkgname" "${pkgdir}/usr/bin/freetube"
  
  # license
  install -Dm644 "./$_pkgname/LICENSE" "${pkgdir}/usr/share/licenses/freetube/LICENSE"

  # icon
  install -Dm644 "./$_pkgname/_icons/icon.svg" "${pkgdir}/usr/share/pixmaps/freetube.svg"
  
  # desktop file
  install -Dm644 "./freetube.desktop" "${pkgdir}/usr/share/applications/freetube.desktop"
}
