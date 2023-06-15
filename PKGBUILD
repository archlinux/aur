# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=httm
pkgver=0.28.4
pkgrel=1
pkgdesc="Prints the size, date and locations of available unique versions (deduplicated by modify time and size) of files residing on ZFS or BTRFS snapshots."
arch=('x86_64')
url="https://github.com/kimono-koans/httm"
license=('MPL-2.0')
conflicts=('httm-bin' 'httm-git')
options=('!strip' '!emptydirs')
#install='httm.install'
depends=('gcc-libs')
optdepends=('btrfs-progs: BTRFS support'
            'zfs-utils: ZFS support'
            'nilfs-utils: NILFS2 support')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('b1a631df097afef29a05884c662fa1e791c194cd46b4c22501d6e3a738ee9a6979c6964207377893732f1bdf2fb0c530b6a2a51c0dd3c96314db052b3e6e8268')

prepare() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build(){
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# use cargo to build from a tagged release
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --frozen --release --all-features
}

package(){
	# install executable
	install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# install man page
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

	# install README.md
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# install LICENSE
	install -Dm644 "${srcdir}/${pkgname}-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
