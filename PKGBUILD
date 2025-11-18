# Maintainer: dllud <dllud riseup net>
# Contributor: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: Marcel Mehlmann <marcel@mzumquadrat.de>

pkgname='ttdl'
pkgver=4.15.0
pkgrel=1
pkgdesc='Terminal ToDo List, a CLI tool to manage todo lists in todo.txt format.'
url='https://github.com/VladimirMarkelov/ttdl'
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install='ttdl.install'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
b2sums=('dec3d1652e337ae88d9bd01759b4c138e3b94cc6eb904fc81ddc79e3161a1b4db32004ac1efc67330c0b2166ce12763924e6197f6c46425eeeeb368074c498b6')
options=(!lto)

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release --all-features
}

check() {
  cd "${pkgname}-${pkgver}"
  cargo test --frozen --all-features
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 target/release/ttdl "${pkgdir}/usr/bin/ttdl"
  install -Dm644 ttdl.toml "${pkgdir}/etc/ttdl.toml"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
