# Maintainer : sgar swhaat at github
# Contributor : Angel_Caido <geussepe at gmail dot com>
# Contributor : Sam Stuewe <halosghost at archlinux dot info>

pkgname=(epoptes epoptes-client)
pkgbase=epoptes-client
pkgver=20.01
pkgrel=1
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
}

package_epoptes()
{
	depends=(gobject-introspection
		gtk3		
		libfaketime
		librsvg
		notification-daemon
		iperf
		iproute2
		openssl
		python
		python-pyopenssl
		openssl
		pygtk
		python-dbus
		python-gobject
		python-cairo
		python-netifaces
		python-pyopenssl
		python-service-identity
		python-twisted
		socat
		tigervnc
		xterm
		x11vnc)
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
	depends=(bsdmainutils
		iperf
		iproute2
		librsvg
		procps-ng
		python
		screen
		iperf
		pygtk
		socat
		x11vnc
		tigervnc
		x11vnc
		openssl
		xterm
		ethtool)
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

	rm -r "${pkgdir}/usr/bin" "${pkgdir}/usr/lib/python3.8"

	mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"

	_rmdirs="applications doc epoptes icons locale ltsp man/man1"	
	for rmdir  in $(echo $_rmdirs)
	do
		rm -r "${pkgdir}/usr/share/${rmdir}"
	done
}
