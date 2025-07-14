# Maintainer: Wiktor W. <wykwit@disroot.org>
# Contributor: Abdur-Rahman Mansoor <armansoor at posteo dot net>

pkgname='rustpython'
_pkgname='RustPython'
pkgver=0.4.0+38
_pkgver='2025-07-14-main-38'
pkgrel=1
pkgdesc='A Python Interpreter written in Rust'
arch=('x86_64' 'i686')
url='https://github.com/RustPython/RustPython'
license=('MIT')
depends=('gcc-libs' 'glibc' 'libffi' 'openssl' 'xz')
makedepends=('cargo' 'rust')
provides=('rustpython')
conflicts=('rustpython')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('1918616d8f305100653813e6df43dd5f6f2076a11db5b1594d3868c30b7d78cf')

_rustpythonpath="/usr/lib/${pkgname}-${_pkgver}"

prepare() {
  cd "${_pkgname}-${_pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${_pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  export OPENSSL_INCLUDE_DIR='/usr/include/'
  export OPENSSL_LIB_DIR='/usr/lib/'
  export BUILDTIME_RUSTPYTHONPATH="${_rustpythonpath}"
  cargo build --release --frozen --features jit,ssl
}

package() {
  cd "${_pkgname}-${_pkgver}"

  install -Dm755 "./target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 ./LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 ./README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  mkdir -p "${pkgdir}${_rustpythonpath}"
  cp -r ./Lib/* "${pkgdir}${_rustpythonpath}"
}

