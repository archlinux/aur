# Maintainer: Shohei Maruyama <cheat.sc.linux@outlook.com>

pkgname=rustfs
pkgver=1.0.0_alpha.70
_console_ver=0.0.11
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
	'9a8a96d28898d0459abf2b35f61c48476d25dd55207a9ab428f3742e8a5e5313'
	'ac07e57a781bdc7b406a877acceab759234cada5a3b9716e8092c9b5dc1b4e1b'
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
