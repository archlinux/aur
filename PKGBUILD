# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=opentubex-git
_pkgname=OpenTubeX
pkgver=r10363.30ed336c4
pkgrel=1
pkgdesc='A fork of the open source desktop YouTube player FreeTube with additional features'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/OpenTubeX/OpenTubeX"
license=('AGPL-3.0-or-later')
depends=('electron41')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'npm' 'pnpm')
source=("git+$url"
        opentubex.desktop
        opentubex.sh)
sha256sums=('SKIP'
            '63154cb6dd377c8d70714bb858405f95d88a849815d86bf7cf1b6b344cc54b5d'
            '7befbce3975b3d687271a769b97f7da2c3f8df47b0541940d4fc915c465ed6b4')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i "5i electronDist: '/usr/lib/electron41'," "$srcdir/$_pkgname/_scripts/ebuilder.config.mjs"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname/_scripts/build.mjs"
}

build() {
  cd "$srcdir/$_pkgname"
  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/opentubex-git}
  cp -R "./$_pkgname/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./opentubex.sh" "$pkgdir/usr/bin/opentubex"
  
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/opentubex.svg"
  cd ..
  install -Dm644 "opentubex.desktop" "$pkgdir/usr/share/applications/opentubex.desktop"
}
