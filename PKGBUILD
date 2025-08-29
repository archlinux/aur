# Maintainer: Wiktor W. <wykwit@disroot.org>
# Contributor: Abdur-Rahman Mansoor <armansoor at posteo dot net>

pkgname='rustpython'
_pkgname='RustPython'
pkgver=0.4.0+44
_pkgver='2025-08-25-main-44'
pkgrel=2
pkgdesc='A Python Interpreter written in Rust'
arch=('x86_64' 'i686')
url='https://github.com/RustPython/RustPython'
license=('MIT')
depends=('gcc-libs' 'glibc' 'libffi' 'openssl' 'xz')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${_pkgver}.tar.gz")
sha256sums=('2a923fe97710eb2f7cdb86941d0f42b6a233f7d51aaa5ef4f4aee17c845a6b22')

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

  # compiling python libraries
  export RUSTPYTHONPATH='./Lib'
  ./target/release/${pkgname} -m compileall -f -x '/test' \
    -d "${_rustpythonpath}" "${RUSTPYTHONPATH}"
}

package() {
  cd "${_pkgname}-${_pkgver}"

  install -Dm755 "./target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 ./LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 ./README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  mkdir -p "${pkgdir}${_rustpythonpath}"
  cp -r ./Lib/* "${pkgdir}${_rustpythonpath}"
  rm -r "${pkgdir}${_rustpythonpath}/test"
}

