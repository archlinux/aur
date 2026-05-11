# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=freetube-git
_pkgname=FreeTube
pkgver=0.24.0.beta.r10160.b55e623
pkgrel=2
pkgdesc='An open source desktop YouTube player built with privacy in mind - built from git source tree.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://freetubeapp.io"
license=('AGPL-3.0-or-later')
depends=('electron42')
makedepends=('git' 'npm' 'pnpm')
provides=('freetube')
conflicts=('freetube')
source=(git+https://github.com/FreeTubeApp/FreeTube
        freetube.desktop
        freetube.sh)
sha256sums=(SKIP SKIP SKIP)

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.r%s.%s" "$(git tag --sort=committerdate | tail -1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  sed -i "5i electronDist: '/usr/lib/electron41'," "$srcdir/$_pkgname/_scripts/ebuilder.config.mjs"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname/_scripts/build.mjs"
}

build() {
  cd "$srcdir/$_pkgname"
  pnpm install
  pnpm run build
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
