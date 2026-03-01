pkgname=periscope
pkgver=1.3.1
pkgrel=1
pkgdesc='Nintendo Switch input display client'
url='https://codeberg.org/periwinkle/periscope'
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/periwinkle/periscope/archive/$pkgver.tar.gz"
"https://codeberg.org/periwinkle/periscope/releases/download/$pkgver/skin.zip"
)
arch=('x86_64')
license=('GPL-3.0-or-later')
makedepends=('cargo')
depends=()
sha256sums=('e62f865eaa4e1ffe6cf94e694111ec4a92b73916663c687fcdbd38e80da044ce'
            '4af6b2523959f8a74fa2977d6839e9d7c9a38cc7e14e011aa83d7443fd0e61fa')
install='skin.install'

prepare() {
  cd "$pkgname/desktop"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's|host: ||p')"
}

build() {
  cd "$srcdir/$pkgname/desktop"
  cargo build --frozen --release --target-dir target
}

package() {
  cd "$srcdir"
  install -Dm755 "${pkgname}/desktop/target/release/periscope" "${pkgdir}/usr/bin/periscope"
  install -d "${pkgdir}/usr/share/periscope/"
  cp -r "${srcdir}"/skin/default/ "${pkgdir}/usr/share/periscope/example-skin/"
  install -Dm644 "${srcdir}"/skin/LICENSE "${pkgdir}/usr/share/periscope/example-skin/LICENSE"
}
