# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=httm-git
pkgver=r2342.4027be8
pkgrel=1
pkgdesc="Prints the size, date and locations of available unique versions (deduplicated by modify time and size) of files residing on ZFS, BTRFS, or NILFS snapshots."
arch=('x86_64')
url="https://github.com/kimono-koans/httm"
license=('MPL-2.0')
provides=('httm')
conflicts=('httm' 'httm-bin')
options=('!strip' '!emptydirs')
depends=('gcc-libs')
optdepends=('btrfs-progs: BTRFS support'
	    'zfs-utils: ZFS support'
            'nilfs-utils: NILFS2 support')
makedepends=('cargo' 'git')
source=("git+https://github.com/kimono-koans/httm.git")
sha512sums=('SKIP')

pkgver()
{
	cd "$srcdir/httm"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build(){
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	# use cargo to build from a tagged release
	cd "${srcdir}/httm"
	cargo install --root ${srcdir} --git $url
}

package(){
	# install executable
	install -Dm755 "${srcdir}/bin/httm" "${pkgdir}/usr/bin/httm"

	# install helper scripts
        install -Dm755 "${srcdir}/httm/scripts/bowie.bash" "${pkgdir}/usr/bin/bowie"
        install -Dm755 "${srcdir}/httm/scripts/nicotine.bash" "${pkgdir}/usr/bin/nicotine"

        [[ -z "$(
                command -v zfs
                exit 0
        )" ]] || install -Dm755 "${srcdir}/httm/scripts/ounce.bash" "${pkgdir}/usr/bin/ounce"

        [[ -n "$(
                command -v zfs
                exit 0
        )" ]] || echo "zfs not in path, helper script 'ounce' not installed"

	# install man page
	install -Dm644 "${srcdir}/httm/httm.1" "${pkgdir}/usr/share/man/man1/httm.1"

	# install README.md
	install -Dm644 "${srcdir}/httm/README.md" "${pkgdir}/usr/share/doc/httm/README.md"

	# install LICENSE
	install -Dm644 "${srcdir}/httm/LICENSE" "${pkgdir}/usr/share/licenses/httm/LICENSE"
}
