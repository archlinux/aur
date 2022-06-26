# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lapce-git
pkgbase=lapce
pkgver=v0.1.2.r86.g49f4721
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor (Git version)"
arch=('x86_64')
url="https://lapce.dev"
license=('Apache')
provide=("lapce=$pkgver")
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon' 'fontconfig')
makedepends=('rust' 'python' 'cmake')
options=('!lto')
source=("$pkgbase::git+https://github.com/lapce/lapce.git"
		"$pkgbase.desktop"
		"$pkgbase.png")
sha512sums=('SKIP'
            '9baf5db032b748a48242deda53334785bf3b028710379ba11869b86291b95c2cde888d45d5feea9ac32af07e1b7f50d114433ec25af0d24161a4b9d814669e8b'
            'b1b42a03abf683a1439086bfdcf67ff8e5d77a85a08957c8d208e291dbbcb027365095ce85b70d1fa25418dbf76f8e84219a08a466b7d39b5335c98cabcc8a15')

pkgver() {
  cd "$pkgbase"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgbase"

  # download dependencies
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd "$pkgbase"

  cargo build --frozen --release
}

package() {
    find "$pkgbase/target/release" \
    -maxdepth 1 \
    -executable \
    -type f \
    -exec install -Dm0755 -t "$pkgdir/usr/bin/" {} +

  	install -Dvm644 $pkgbase.png \
  		"$pkgdir/usr/share/icons/hicolor/scalable/apps/Lapce.png"
  	install -Dvm644 $pkgbase.desktop \
    	"$pkgdir/usr/share/applications/$pkgbase.desktop"
}
