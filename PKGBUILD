# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='tinyssh'
pkgver='20140501.experimental'
pkgrel='2'
pkgdesc='Small SSH server using NaCl / TweetNaCl'
url='http://tinyssh.org'
arch=('x86_64' 'i686' 'arm')
license=('Public Domain')
install='tinyssh.install'
source=("http://mojzis.com/software/${pkgname}/${pkgname}-${pkgver//./}.tar.bz2"
	tinyssh@.socket tinyssh@.service)
sha1sums=('8e1f729be5764ac0b02234343c93c9271c7dae96'
          '539e23ab2d3edcb550ae34f1030b9b61c9079e7f'
					'e4dac17a44e4ce386fc62d741dc3671da41843ca')

build () {
	cd "${srcdir}/${pkgname}-${pkgver//./}"
	make
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver//./}"
	make install DESTDIR="${pkgdir}"

	install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
	install -m 644 -t "${pkgdir}/usr/lib/systemd/system" \
		"${srcdir}/tinyssh@.service" \
		"${srcdir}/tinyssh@.socket"

	# We include our own systemd units, remove the daemontools scripts
	rm -rf "${pkgdir}/etc/tinyssh"

	# ...and the tinyssh-inetd tool
	rm -f "${pkgdir}/usr/sbin/tinysshd-inetd"

	# The systemd units send logging to the journal (or syslog)
	rm -rf "${pkgdir}/var"
}
