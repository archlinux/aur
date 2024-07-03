# Maintainer: username227 <gfrank227 [at] gmail [dot] com>

_pkgname=nhex
pkgname=${_pkgname}-git
pkgver=r300.8022e1f
pkgrel=2
pkgdesc="A next-generation IRC client inspired by HexChat"
arch=(x86_64)
url="https://github.com/nhexirc/nhex"
license=('MIT' 'MPL-2.0')
depends=('gcc-libs' 'libsoup' 'webkit2gtk')
makedepends=('npm' 'git' 'rust' 'nodejs')
provides=("$_pkgname")
conflicts=('nhex-bin' 'nhex')
source=('git+https://github.com/nhexirc/nhex'
	'nhex.desktop')
sha256sums=('SKIP'
            '23d57b49f521c3a238ce86baf08a3f862de1b1c19e08cc68ec6c96112c42d766')
options=('!lto')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
cd $srcdir/nhex/packages/client
npm install
npm run tauri build -- -b
}

package() {
install -Dm755 $srcdir/nhex/packages/client/src-tauri/target/release/nhex -t $pkgdir/usr/bin
install -Dm755 $srcdir/nhex/packages/client/public/nhex.png -t $pkgdir/usr/share/pixmaps
install -Dm755 $srcdir/nhex.desktop -t $pkgdir/usr/share/applications
}
