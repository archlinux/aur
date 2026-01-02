# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=opentubex-git
_pkgname=OpenTubeX
pkgver=r9693.1f80aa18
pkgrel=2
pkgdesc='A fork of the open source desktop YouTube player FreeTube with additional features'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/D3SOX/OpenTubeX"
license=('AGPL-3.0-or-later')
depends=('electron39')
makedepends=('git' 'npm' 'yarn')
source=("git+$url"
        opentubex.desktop
        opentubex.sh)
sha256sums=('SKIP'
            '63154cb6dd377c8d70714bb858405f95d88a849815d86bf7cf1b6b344cc54b5d'
            '308ed89c0b0efb2c5cd8aa7751a7a7bbdfdd6061a8fa9313111905d332e2c772')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  sed -i "5i electronDist: '/usr/lib/electron39'," "$srcdir/$_pkgname/_scripts/ebuilder.config.mjs"
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
