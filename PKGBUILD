#Maintainer: chrhasse <hasse.christopher at gmail dot com>
_pkgname=deadlock-api-ingest
pkgname="${_pkgname}-git"
pkgver=0.2.9.e3e69d0
pkgrel=1
pkgdesc="Client for uploading match data to deadlock-api"
arch=('x86_64')
url="https://github.com/deadlock-api/deadlock-api-ingest"
license=('MIT')
depends=('libpcap')
makedepends=('git' 'cargo')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+https://github.com/deadlock-api/deadlock-api-ingest.git"
  "deadlock-api-ingest.service")
sha512sums=('SKIP'
            'e4d90ffab8efe2231033a8fa19ad29602059c395ba216dd9a209a0f732760c094f82d68e57da0ae75acec7cd0f8f9745002346f52c67c55be12da5008284ec7d')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --abbrev=0 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${_pkgname}"
  CFLAGS+=" -ffat-lto-objects"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${_pkgname}"
  export RUSTUP_TOOLCHAIN=stable
  cargo test --frozen --release
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm 644 "../deadlock-api-ingest.service" "${pkgdir}/usr/lib/systemd/user/deadlock-api-ingest.service"
}

