# Maintainer: dllud <dllud riseup net>
# Contributor: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: Marcel Mehlmann <marcel@mzumquadrat.de>

pkgname='ttdl'
pkgver=4.23.0
pkgrel=1
pkgdesc='Terminal ToDo List, a CLI tool to manage todo lists in todo.txt format.'
url='https://github.com/VladimirMarkelov/ttdl'
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install='ttdl.install'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
b2sums=('e0d086ee7c946a27e511b29a0fd1c04e8806f2b2c2728e4fecb376915cec5b07e85af59e14110c76f5ad611db300db52fc30df9a1711ee7f4e5bece7aabdecde')
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
