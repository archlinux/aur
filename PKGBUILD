# Maintainer: Wiktor W. <wykwit@disroot.org>
# Contributor: Abdur-Rahman Mansoor <armansoor at posteo dot net>

pkgname='rustpython'
_pkgname='RustPython'
pkgver=0.5.0
pkgrel=1
pkgdesc='A Python Interpreter written in Rust'
arch=('x86_64' 'i686')
url='https://github.com/RustPython/RustPython'
license=('MIT')
depends=('gcc-libs' 'glibc' 'libffi' 'openssl' 'xz')
makedepends=('cargo')
options=(!lto)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6fa2bfd6d3a6c0ecb2aae216552ba24ad263546198c8a7b0c03c8111b6389d9c')

_rustpythonpath="/usr/lib/${pkgname}-${pkgver}"

prepare() {
  cd "${_pkgname}-${pkgver}"

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${_pkgname}-${pkgver}"

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
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "./target/release/${pkgname}" -t "${pkgdir}/usr/bin"
  install -Dm644 ./LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 ./README.md -t "${pkgdir}/usr/share/doc/${pkgname}"

  mkdir -p "${pkgdir}${_rustpythonpath}"
  cp -r ./Lib/* "${pkgdir}${_rustpythonpath}"
  rm -r "${pkgdir}${_rustpythonpath}/test"
}

