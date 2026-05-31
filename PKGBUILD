# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Michael Cortese <mcortese1406@gmail.com>

_pkgauthor=matthart1983
_pkgname=syswatch
_cratename=${_pkgname}
_appname=${_pkgname}
pkgname=${_cratename}
pkgdesc="Single-host, read-only system diagnostics TUI — twelve tabs covering CPU, memory, disks, processes, GPU, power, services, network, plus a Timeline scrubber and an Insights anomaly engine"

pkgver=0.7.0
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
sha256sums=('1c8a2957499a07f2646f7aedc9e3d00f5ef3da8ff27cee2042848d11a65b4de7')

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

	install -Dm644 "LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
