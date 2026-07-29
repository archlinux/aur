# Maintainer: severaltranscats <severaltranscats at cleo dot nyc>
# Contributor: <d3sox at protonmail dot com>

pkgname=opentubex
_pkgname=OpenTubeX
_ghurl="https://github.com/OpenTubeX/OpenTubeX"
pkgver=0.30.0
_pkgver="$pkgver-beta"
pkgrel=1
pkgdesc='A fork of the open source desktop YouTube player FreeTube with additional features'
arch=('any')
url="https://opentubex.org"
license=('AGPL-3.0-or-later')
depends=('electron43')
makedepends=('git' 'npm' 'pnpm')
source=("$pkgname-$pkgver.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}-beta.tar.gz"
        opentubex.desktop
        opentubex.sh)
sha256sums=('d0feb8e5ab2329d2442394ff1a964d6eb4bacde44f2d9736189843ceaff22723'
            '63154cb6dd377c8d70714bb858405f95d88a849815d86bf7cf1b6b344cc54b5d'
            'ed9c3c54f5604389cac2e53df7f917ce6952a870abc409464e5b8ba590ca3d07')

prepare() {
  sed -i "5i electronDist: '/usr/lib/electron43'," "$srcdir/$_pkgname-$_pkgver/_scripts/ebuilder.config.mjs"
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
