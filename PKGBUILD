# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=matthart1983
_pkgname=essh
_cratename=${_pkgname}
_appname=${_pkgname}
pkgname=${_cratename}
pkgdesc="Enhanced SSH client with TUI — manage connections, keys, and sessions"

pkgver=0.2.7
pkgrel=1
_pkgvername=${pkgver}

arch=('x86_64' 'aarch64')
_barch=('x86_64' 'aarch64')

url="https://github.com/${_pkgauthor}/${_pkgname}"

license=('MIT')

makedepends=('rust' 'cargo' 'nasm')
depends=('glibc' 'libgcc')

provides=("${_appname}")

options=('!lto' '!strip')

source=("${_pkgname}-${_pkgvername}.crate::https://crates.io/api/v1/crates/${_cratename}/${_pkgvername}/download")
sha256sums=('d91fb43282fdc33d128f1862e8a11408f38968ad2748588bf457a4ba79468f50')

prepare() {
  cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "${CARCH}-unknown-linux-gnu"
}

build() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	export CARGO_TARGET_DIR=target
	cargo build --frozen --release
}

package() {
	cd ${srcdir}/${_cratename}-${_pkgvername} || exit 1

	install -Dm755 "target/release/${_appname}" "${pkgdir}/usr/bin/${_appname}"

	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "SPEC.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
