# Maintainer: xgjmibzr <xgjmibzr@gmail.com>

pkgname=httm-bin
pkgver=0.21.0
pkgrel=1
pkgdesc="Prints the size, date and locations of available unique versions (deduplicated by modify time and size) of files residing on ZFS or BTRFS snapshots. (binary .deb)"
arch=('x86_64')
url="https://github.com/kimono-koans/httm"
license=('MPL-2.0')
provides=('httm')
conflicts=('httm' 'httm-git')
options=('!strip' '!emptydirs')
source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/httm_${pkgver}_amd64.deb")
sha512sums=('109896fd424081df93a8d0294aee0d18ff1a75800f262ae0a829865700e33e6799cf02227773ca2904ec6c330bdee9f45dbe145877852f21bf7f26c8a42a7b31')

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
	install -Dm644 "${srcdir}/usr/share/doc/${_name}/README" "${pkgdir}/usr/share/doc/${_name}/README"

	# install LICENSE
	install -Dm644 "${srcdir}/usr/share/doc/httm/copyright" "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
