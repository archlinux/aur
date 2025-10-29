#Maintainer: chrhasse <hasse.christopher at gmail dot com>
_pkgname=deadlock-api-ingest
pkgname="${_pkgname}-git"
pkgver=0.1.187.5bc2879
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
            '7b8e5ab4cb002134533095f2fd7c07c392efdaa01ec6c60ed180b7331c58c322466f327716c48dcb8068ac9df605e5937f80770d048f486f2906cdb20f47193e')

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
  install -Dm 644 "../deadlock-api-ingest.service" "${pkgdir}/etc/systemd/system/deadlock-api-ingest.service"
}

