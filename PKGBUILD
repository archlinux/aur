# Maintainer: severaltranscats <severaltranscats at cleo dot nyc>
# Contributor: <d3sox at protonmail dot com>

pkgname=opentubex
_pkgname=OpenTubeX
pkgver=0.25.4
_pkgver="$pkgver-beta"
pkgrel=2
pkgdesc='A fork of the open source desktop YouTube player FreeTube with additional features'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/OpenTubeX/OpenTubeX"
license=('AGPL-3.0-or-later')
depends=('electron41')
makedepends=('git' 'npm' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v${pkgver}-beta.tar.gz"
        opentubex.desktop
        opentubex.sh)
sha256sums=('483b422127d572ea94d1d91e2bddea7dac9d4a1a91cacef730e6d6cf130dea1c'
            '63154cb6dd377c8d70714bb858405f95d88a849815d86bf7cf1b6b344cc54b5d'
            '0f70946cec21a754755120e37c7f7d69e48c1c87a9c0d6e5f71363b1cafaf4cb')



prepare() {
  sed -i "5i electronDist: '/usr/lib/electron41'," "$srcdir/$_pkgname-$_pkgver/_scripts/ebuilder.config.mjs"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname-$_pkgver/_scripts/build.mjs"
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  pnpm install --frozen-lockfile
  pnpm build
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/opentubex}
  cp -R "./$_pkgname-$_pkgver/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./opentubex.sh" "$pkgdir/usr/bin/opentubex"
  
  cd "$_pkgname-$_pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/opentubex.svg"
  cd ..
  install -Dm644 "opentubex.desktop" "$pkgdir/usr/share/applications/opentubex.desktop"
}

