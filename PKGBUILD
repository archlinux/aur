# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michael Cortese <mcortese1406@gmail.com>

_pkgauthor=matthart1983
_pkgname=logwatch
_cratename=${_pkgname}-tui
_appname=${_pkgname}
pkgname=${_cratename}
pkgdesc="Single-host, read-only log introspection TUI - twelve tabs covering live tail, sources, novel-pattern detection, errors, services, kernel ring, audit, timeline scrubber, and an Insights anomaly engine"

pkgver=0.1.0
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
sha256sums=('79e2ffea398cf2578c3069a109a57e31a8f957a3dd28545aad2d118c01999b40')

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

	install -Dm644 "CHANGELOG.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
	install -Dm644 "README.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"

	# install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
