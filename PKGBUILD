# Maintainer: Abdur-Rahman Mansoor <mansoorar at proton dot me>

pkgname='rustpython'
pkgver=0.3.0
pkgrel=1
pkgdesc='A Python Interpreter written in Rust'
arch=('x86_64' 'i686')
url='https://github.com/RustPython/RustPython'
makedepends=('rust')
license=('MIT')
source=(
	"${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
)
conflicts=("${pkgname}")
provides=("${pkgname}")
b2sums=('1f6f6c10a40feec5f6dc1ecb4a83cebb4b565b798c0bcaa539c4cd6cae38542dfd6abba3f3dc46f74d03f73ca45a8ecd500654adca93c13d985afa34d3afe043')
_rustpythonpath="/usr/lib/${pkgname}${pkgver}"

build() {
	cd "${srcdir}/RustPython-${pkgver}"
	BUILDTIME_RUSTPYTHONPATH="${_rustpythonpath}" cargo build --release --locked
}

check() {
	cd "${srcdir}/RustPython-${pkgver}"
	cargo test --release --locked
}

package() {
	cd "${srcdir}/RustPython-${pkgver}"
	install -Dm755 ./target/release/rustpython -t "${pkgdir}/usr/bin"
	install -Dm644 ./LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 ./README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
	[[ ! -d "${pkgdir}${_rustpythonpath}" ]] && mkdir -p "${pkgdir}${_rustpythonpath}"
	cp -r ./Lib/* "${pkgdir}${_rustpythonpath}"
}
	
