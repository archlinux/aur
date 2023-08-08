# Maintainer : sgar swhaat at github
# Contributor : Angel_Caido <geussepe at gmail dot com>
# Contributor : Sam Stuewe <halosghost at archlinux dot info>

pkgname=(epoptes epoptes-client)
pkgbase=epoptes-client
pkgver=23.01
pkgrel=2
pkgdesc='An opensource computer lab management and monitoring tool'
makedepends=(git python-distutils-extra)
url='https://github.com/Epoptes/epoptes'
license=(GPL3)
arch=(any)
source=("git+https://github.com/Epoptes/epoptes.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare()
{
	cd "${srcdir}/epoptes"
	python setup.py clean
	python setup.py config
	# modify service to launch on updated twisted
	sed -i 's/twistd3/twistd/' debian/epoptes.service
}

package_epoptes()
{
	depends=(gobject-introspection
		gtk3
		iperf
		iproute2
		libfaketime
		libnotify
		librsvg
		notification-daemon
		openssl
		python-cairo
		python-dbus
		python-gobject
		python-netifaces
		python-pyopenssl
		python-service-identity
		python-twisted
		socat
		tigervnc
		x11vnc
		xterm)
	optdepends=('xfce4-notifyd: XFCE notification support')
	install=epoptes.install
	
	cd "${srcdir}/epoptes"
	python setup.py install --root="${pkgdir}/" --optimize=1

	install -m644 -D "${srcdir}/epoptes/debian/${pkgname}.service" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -m644 -D "${srcdir}/epoptes/debian/${pkgname}.default" \
		"${pkgdir}/etc/default/${pkgname}"
	install -m644 -D "${srcdir}/epoptes/debian/copyright" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	rm -r "${pkgdir}/usr/sbin" "${pkgdir}/etc/xdg"

	mkdir "${pkgdir}/etc/epoptes"

	_rmdirs="epoptes-client man/man8"
	for rmdir  in $(echo $_rmdirs)
	do
		rm -r "${pkgdir}/usr/share/${rmdir}"
	done
}

package_epoptes-client()
{
	depends=(ethtool
		iperf
		iproute2
		libnotify
		librsvg
		openssl
		procps-ng
		python-twisted
		python-gobject
		python-cairo
		screen
		socat
		tigervnc
		x11vnc
		xterm)
	optdepends=('xfce4-notifyd: XFCE notification support'
		'cups: printing support'
		'sane: scanners support')

	cd "${srcdir}/epoptes"
	python setup.py install --root="${pkgdir}/" --optimize=1
	
	install -m644 -D "${srcdir}/epoptes/debian/${pkgname}.service" \
		"${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
	install -m644 -D "${srcdir}/epoptes/debian/${pkgname}.default" \
		"${pkgdir}/etc/default/${pkgname}"
	install -m644 -D "${srcdir}/epoptes/debian/copyright" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	rm -r "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/python3.11"

	mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"

	_rmdirs="applications doc epoptes icons locale ltsp man/man1"	
	for rmdir  in $(echo $_rmdirs)
	do
		rm -r "${pkgdir}/usr/share/${rmdir}"
	done
}
