# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=httm-bin
pkgver=0.49.2
pkgrel=1
pkgdesc="Prints the size, date and locations of available unique versions (deduplicated by modify time and size) of files residing on ZFS, BTRFS, or NILFS snapshots. (binary .deb)"
arch=('x86_64')
url="https://github.com/kimono-koans/httm"
license=('MPL-2.0')
provides=('httm')
conflicts=('httm' 'httm-git')
optdepends=('btrfs-progs: BTRFS support'
            'zfs-utils: ZFS support'
            'nilfs-utils: NILFS2 support')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/httm_${pkgver}-1_amd64.deb")
sha512sums=('cb7ad4918f97fca9846f2e4d9946050a4144ab62b4898fcaeee672fa6358fc95203288aa21a59403ef3560f278d20a5a002859c056fa5d6ee78429f928dd8bd3')

prepare() {
	tar -xf data.tar.xz
	gzip -df usr/share/man/man1/httm.1.gz
}

package(){
	_name=${pkgname//[-bin]/}

	# install executable
	install -Dm755 "${srcdir}/usr/bin/${_name}" "${pkgdir}/usr/bin/${_name}"

	# install helper scripts
	install -Dm755 "${srcdir}/usr/bin/bowie" "${pkgdir}/usr/bin/bowie"
	install -Dm755 "${srcdir}/usr/bin/nicotine" "${pkgdir}/usr/bin/nicotine"

	[[ -z "$(
		command -v zfs
		exit 0
	)" ]] || install -Dm755 "${srcdir}/usr/bin/ounce" "${pkgdir}/usr/bin/ounce"

	[[ -n "$(
                command -v zfs
                exit 0
        )" ]] || echo "zfs not in path, helper script 'ounce' not installed"

	# install man page
	install -Dm644 "${srcdir}/usr/share/man/man1/${_name}.1" "${pkgdir}/usr/share/man/man1/${_name}.1"

	# install README.md
	install -Dm644 "${srcdir}/usr/share/doc/${_name}/README.md" "${pkgdir}/usr/share/doc/${_name}/README"

	# install LICENSE
	install -Dm644 "${srcdir}/usr/share/doc/httm/copyright" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
