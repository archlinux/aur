# Maintainer: Adrian Perez <aperez@igalia.com>
pkgname='tinyssh'
pkgver='20140501.experimental'
pkgrel='4'
pkgdesc='Small SSH server using NaCl / TweetNaCl'
url='http://tinyssh.org'
arch=('x86_64' 'i686' 'arm')
license=('Public Domain')
install='tinyssh.install'
source=("http://mojzis.com/software/${pkgname}/${pkgname}-${pkgver//./}.tar.bz2"
	tinyssh@.socket tinyssh@.service tinysshgenkeys.service)
sha1sums=('8e1f729be5764ac0b02234343c93c9271c7dae96'
          'f4143b92b0fc3f368ab770598dd303204b1a1315'
          '74f12721d55be0ea29bc9108ad0a83ae0095cb79'
          'b5846cd2962f6a898537453e03cc089027ddad57')

build () {
	cd "${srcdir}/${pkgname}-${pkgver//./}"
	make
}

package () {
	cd "${srcdir}/${pkgname}-${pkgver//./}"
	make install DESTDIR="${pkgdir}"

	install -m 755 -d "${pkgdir}/usr/lib/systemd/system"
	install -m 644 -t "${pkgdir}/usr/lib/systemd/system" \
		"${srcdir}/tinysshgenkeys.service" \
		"${srcdir}/tinyssh@.service" \
		"${srcdir}/tinyssh@.socket"

	# We include our own systemd units, remove the daemontools scripts
	rm -rf "${pkgdir}/etc/tinyssh"/*

	# ...and the tinyssh-inetd tool
	rm -f "${pkgdir}/usr/sbin/tinysshd-inetd"

	# The systemd units send logging to the journal (or syslog)
	rm -rf "${pkgdir}/var"
}
