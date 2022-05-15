# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=lapce-git
pkgbase=lapce-git
pkgver=r1320.90d8dbe
pkgrel=1
pkgdesc="Lightning-fast and Powerful Code Editor (Git version)"
arch=('x86_64')
url="https://lapce.dev"
license=('Apache')
provides=(lapce lapce-git)
conflicts=(lapce lapce-git lapce-bin)
depends=('gcc-libs' 'libxcb' 'expat' 'freetype2' 'libxkbcommon' 'fontconfig')
makedepends=('rust' 'python' 'cmake')
options=('!lto')
source=("lapce-git::git+https://github.com/lapce/lapce.git"
		"$pkgname.desktop"
		"lapce.png")
sha512sums=('SKIP'
            'a5bbe975da32437ca0578567eef51821dd39ad7f4fad955f1589b4f2a74187b5640e9e05594e943bd9bca593cbd6957b6fb1ff69bceed9270530de5d93a70511'
            'b1b42a03abf683a1439086bfdcf67ff8e5d77a85a08957c8d208e291dbbcb027365095ce85b70d1fa25418dbf76f8e84219a08a466b7d39b5335c98cabcc8a15')

pkgver() {
  cd "$pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

  	install -Dvm644 lapce.png \
  		"$pkgdir/usr/share/icons/hicolor/scalable/apps/Lapce.png"
  	install -Dvm644 $pkgname.desktop \
    	"$pkgdir/usr/share/applications/$pkgname.desktop"
}
