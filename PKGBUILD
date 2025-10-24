# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=rustfs
pkgver=1.0.0_alpha.65
_console_ver=0.0.10
pkgrel=1
pkgdesc="High-performance distributed object storage for MinIO alternative."
url='https://rustfs.com/en/'
arch=('x86_64')
license=('Apache-2.0')
depends=(
	'glibc'
	'gcc-libs'
	'bzip2'
)
makedepends=(
	'cargo'
	'pnpm'
)
options=(!lto)
source=(
	"${pkgname}-${pkgver//_/-}.tar.gz::https://github.com/rustfs/rustfs/archive/refs/tags/${pkgver//_/-}.tar.gz"
	"console-${_console_ver}.tar.gz::https://github.com/rustfs/console/archive/refs/tags/v${_console_ver}.tar.gz"
)
sha256sums=(
	'f6e2deba38e2ce21311e90c90e2f1a3dc7610ba97f6c1c1d717fd0c47d5d1c2d'
	'fcb0e8d2adb78341b5a812aeb54c8de19871689b59ed46973ce2530245f70c48'
)

prepare() {
	cd ${pkgname}-${pkgver//_/-}

	RUSTC_BOOTSTRAP=1 cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	# build embedded console assets
	cd console-${_console_ver}

	# `NUXT_TELEMETRY_DISABLED=1` ignores the Nuxt.js starting question
	# pnpm-lock.yaml exists, but pnpm failed to build. The following options fixes it.
	NUXT_TELEMETRY_DISABLED=1 pnpm i --shamefully-hoist --dangerously-allow-all-builds
	pnpm generate
	cp -r .output/public/* ${srcdir}/${pkgname}-${pkgver//_/-}/rustfs/static/

	# build rustfs
	cd ${srcdir}/${pkgname}-${pkgver//_/-}

	RUSTC_BOOTSTRAP=1 cargo build --frozen --release
}

package() {
	cd ${pkgname}-${pkgver//_/-}

	install -Dm 755 -t "${pkgdir}/usr/bin" target/release/rustfs
}
