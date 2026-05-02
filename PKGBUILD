# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

pkgname="magisk-elf-cleaner"
pkgver=30.7
pkgrel=1
pkgdesc="Utility to remove unused ELF sections causing warnings"
arch=(
  'x86_64'
)
_url="https://github.com/topjohnwu/Magisk"
url="${_url}/tree/master/tools/elf-cleaner"
license=(
  'GPL-3.0-only'
)
depends=(
  'glibc'
  'libgcc'
)
makedepends=(
  'cargo'
)
_pkgsrc="${_url##*/}-${pkgver}"
source=(
  "${_url}/archive/refs/tags/v${pkgver}/${_pkgsrc}.tar.gz"
)
b2sums=('dcf7655ac54033caca2df446c06845e759c8ee88f2c47cbc1e292d00135ddd6820646db6733c9ee439bd1eb6c56fb65eb449ca92280b45d33cb8122eb07ac598')

_source() {
  export CARGO_HOME="${srcdir}/.cargo"
  export CARGO_TARGET_DIR=target
  export RUSTUP_TOOLCHAIN=stable
}

prepare() {
  _source

  cd "${srcdir}/${_pkgsrc}/tools/elf-cleaner"
  cargo fetch --locked --target host-tuple
}

build() {
  _source

  cd "${srcdir}/${_pkgsrc}/tools/elf-cleaner"
  cargo build --frozen --release --all-features
}

check() {
  _source

  cd "${srcdir}/${_pkgsrc}/tools/elf-cleaner"
  cargo test --frozen --all-features
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  install -vDm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cd "tools/elf-cleaner"
  install -vDm755 "target/release/elf-cleaner" "${pkgdir}/usr/bin/${pkgname}"
}
