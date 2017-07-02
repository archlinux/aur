# Maintainer: Anthony Ruhier <anthony.ruhier@gmail.com>
# Many thanks to Justin Dray, maintainer of sickrage, for his PKGBUILD used as
# a base for this one.

_name=headphones
pkgname=${_name}-git
pkgver=0.5.18.r88.g8e1cd31
pkgrel=1
pkgdesc="Headphones is an automated music downloader for NZB and Torrent, written in Python. It supports SABnzbd, NZBget, Transmission, µTorrent and Blackhole."
arch=('any')
_url="github.com/rembo10/${_name}"
url="https://${_url}"
license=('GPL3')
depends=('python2')
optdepends=('sabnzbd: NZB downloader'
            'python2-notify: desktop notifications'
						'unrar: automatic decompression'
						'git: pull new versions from git')
conflicts=("${_name}")
replaces=("${_name}")
options=('!strip')
install="${_name}.install"
source=("git://${_url}.git"
        "${_name}-system.service"
        "${_name}-user.service"
				"${_name}.tmpfile")
sha256sums=('SKIP'
            '14f00904135940e00a6af5742116d950be07248a578c2562373413155f768d01'
            '22d2a8da5cc8da149ddac086e52c0e30b51671644e039d435f853cf383f15317'
            'b8f7030f570e7707eb9c0f41c382e37d54244e7885c795a9f31788efdd45914e')

pkgver() {
	cd "$srcdir"/${_name}
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
	mkdir -p "${pkgdir}/opt/${_name}"
	chmod 775 "${pkgdir}/opt/${_name}"
	cp -r ${_name}/* "$pkgdir/opt/${_name}"

	install -D -m644 ${_name}-system.service "$pkgdir/usr/lib/systemd/system/${_name}.service"
	install -D -m644 ${_name}-user.service "$pkgdir/usr/lib/systemd/user/${_name}.service"
	install -D -m644 ${_name}.tmpfile "$pkgdir/usr/lib/tmpfiles.d/${_name}.conf"

	find "$pkgdir" -type d -name '.git' -exec rm -r '{}' +
}

# vim: set ts=2 sw=2 ft=sh noet:
