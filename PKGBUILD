# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=freetube-git
_pkgname=FreeTube
_electron=electron42
pkgver=0.25.1.beta.r10494.04b42f1
pkgrel=1
pkgdesc='An open source desktop YouTube player built with privacy in mind - built from git source tree.'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://freetubeapp.io"
license=('AGPL-3.0-or-later')
depends=($_electron)
makedepends=('git' 'pnpm')
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
  sed -i "5i electronDist: '/usr/lib/$_electron'," "$srcdir/$_pkgname/_scripts/ebuilder.config.mjs"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname/_scripts/build.mjs"
  sed -i "s/_electron_/$_electron/" "$srcdir/freetube.sh"
  sed -i "6i strictDepBuilds: false" "$srcdir/$_pkgname/pnpm-workspace.yaml"
  sed -i "6i minimumReleaseAge: 0" "$srcdir/$_pkgname/pnpm-workspace.yaml"
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
