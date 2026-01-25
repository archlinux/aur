# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=opentubex-git
_pkgname=OpenTubeX
pkgver=r9857.a7495b0d
pkgrel=2
pkgdesc='A fork of the open source desktop YouTube player FreeTube with additional features'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/OpenTubeX/OpenTubeX"
license=('AGPL-3.0-or-later')
depends=('electron40')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'npm' 'yarn')
source=("git+$url"
        opentubex.desktop
        opentubex.sh)
sha256sums=('SKIP'
            '63154cb6dd377c8d70714bb858405f95d88a849815d86bf7cf1b6b344cc54b5d'
            'a335db16c3ec6dd6ac5e529019b4fe55d9848ae9f450f3cfd4b66d06ec6d53f8')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i "5i electronDist: '/usr/lib/electron40'," "$srcdir/$_pkgname/_scripts/ebuilder.config.mjs"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname/_scripts/build.mjs"
}

build() {
  cd "$srcdir/$_pkgname"
  yarn install --frozen-lockfile
  yarn build
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/opentubex-git}
  cp -R "./$_pkgname/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./opentubex.sh" "$pkgdir/usr/bin/opentubex"
  
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/opentubex.svg"
  cd ..
  install -Dm644 "opentubex.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
