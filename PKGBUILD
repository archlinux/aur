# Maintainer: dllud <dllud riseup net>
# Contributor: 3Jl0y_PYCCKUi <3jl0y_pycckui@riseup.net>
# Contributor: Marcel Mehlmann <marcel@mzumquadrat.de>

pkgname='ttdl'
pkgver=4.12.0
pkgrel=1
pkgdesc='Terminal ToDo List, a CLI tool to manage todo lists in todo.txt format.'
url='https://github.com/VladimirMarkelov/ttdl'
arch=('i686' 'pentium4' 'x86_64' 'armv7h' 'aarch64')
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
install='ttdl.install'
source=("$pkgname-$pkgver.tar.gz::${url}/archive/v$pkgver.tar.gz")
b2sums=('5761998f6e9774fbbe939b4fb3a114cc436a2943e4c9082e68435659f9fce6375b332b021e22d842ba9ab9449a3ff732d8eb99b5e37406c61f8cd199379b9f86')
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
