# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=freetube-git
_pkgname=FreeTube
pkgver=0.13.1.beta.r1175.g330086e8
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind - built from git source tree.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://freetubeapp.io"
license=('AGPL3')
depends=('gtk3' 'nss' 'electron16')
makedepends=('git' 'npm' 'nodejs' 'yarn')
provides=('freetube')
conflicts=('freetube')
source=(git+https://github.com/FreeTubeApp/FreeTube
        package-only-necessary.diff
        freetube.desktop
        freetube.sh)
sha256sums=(SKIP SKIP SKIP SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch "$srcdir/$_pkgname/_scripts/build.js" < package-only-necessary.diff
}

build() {
  cd "$srcdir/$_pkgname"
  yarn --cache-folder "${srcdir}/yarn-cache" install
  npm --cache "${srcdir}/npm-cache" run build
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/freetube-git}
  cp -R "./$_pkgname/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./freetube.sh" "$pkgdir/usr/bin/freetube"
  
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/freetube.svg"
  cd ..
  install -Dm644 "freetube.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
