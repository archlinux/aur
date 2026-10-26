# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=httm
pkgver=0.51.1
pkgrel=1
pkgdesc="Prints the size, date and locations of available unique versions (deduplicated by modify time and size) of files residing on ZFS, BTRFS, or NILFS snapshots."
arch=('x86_64')
url="https://github.com/kimono-koans/httm"
license=('MPL-2.0')
conflicts=('httm-bin' 'httm-git')
options=('!strip' '!emptydirs' '!lto')
#install='httm.install'
depends=('gcc-libs')
optdepends=('btrfs-progs: BTRFS support'
            'zfs-utils: ZFS support'
            'nilfs-utils: NILFS2 support')
makedepends=('cargo')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('9b659b10b4bba89a86bdbcc77532271fa578a39cd0df935a2addf889f2f38fa3fb8d6e6d763e4c7ac61205cdc752d32dea4a7b16ea2c5a21c37f27483f115a5f')

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
	
        # install helper scripts
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}/scripts/bowie.bash" "${pkgdir}/usr/bin/bowie"
        install -Dm755 "${srcdir}/${pkgname}-${pkgver}/scripts/nicotine.bash" "${pkgdir}/usr/bin/httm-nicotine"

        [[ -z "$(
                command -v zfs
                exit 0
        )" ]] || install -Dm755 "${srcdir}/${pkgname}-${pkgver}/scripts/ounce.bash" "${pkgdir}/usr/bin/ounce"

        [[ -n "$(
                command -v zfs
                exit 0
        )" ]] || echo "zfs not in path, helper script 'ounce' not installed"


	# install man page
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"

	# install README.md
	install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# install LICENSE
	install -Dm644 "${srcdir}/${pkgname}-$pkgver/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
