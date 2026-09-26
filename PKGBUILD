# Maintainer: CosmicHeron <dev cosmicheron com>

_bin='ziso'
_pkgbase="${_bin}_compressor_rust"
pkgname="${_pkgbase}-git"
pkgdesc='A rust written ziso compressor with multipple threads support'
url='https://github.com/Danixu/ziso_compressor_rust'
license=('Apache-2.0')
pkgver='r36.3498568'
pkgrel='1'
arch=('x86_64' 'aarch64')
provides=("$_bin")
conflicts=("$_bin")
depends=('glibc' 'libgcc')
makedepends=('cargo')
source=("${_pkgbase}::git+${url}.git")
b2sums=('SKIP')
options=('!lto')

pkgver() {
	cd "$_pkgbase"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd "$_pkgbase"
	cargo fetch --locked
}

build() {
	cd "$_pkgbase" || exit
	cargo build --frozen --release
}

package() {
	cd "${srcdir}/${_pkgbase}" || exit
	install -Dm755 -t "${pkgdir}/usr/bin" "target/release/${_bin}"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" 'LICENSE'
}
