# Maintainer: Kim Scarborough <kim@scarborough.kim>
pkgname=deluge1
pkgver=1.3.15
pkgrel=1
pkgdesc='A BitTorrent client with multiple interfaces in a client/server model (legacy 1.3.x version)'
arch=('any')
url="http://deluge-torrent.org/"
license=('GPL3')
makedepends=('intltool'
	'libtorrent-rasterbar'
	'python2-chardet'
	'python2-pyopenssl'
	'python2-twisted'
	'python2-xdg')
depends=('python2'
	'desktop-file-utils'
	'hicolor-icon-theme')
optdepends=('python2-service-identity'
	'pygtk: required for GTK client'
	'xdg-utils: required for GTK client'
	'python2-notify: optional for GTK client'
	'python2-pygame: optional for GTK client'
	'python2-libappindicator: optional for GTK client'
	'python2-mako: required for web client')
provides=('deluge')
conflicts=('deluge'
	'deluge-git'
	'deluge-stable-git')
backup=('etc/conf.d/deluged')
# ftp.osuosl.org is supposedly the source, but the mirrors have this in a different place than the master.
# Using the master's URL until they figure it out.
source=('https://ftp-osl.osuosl.org/pub/deluge/source/1.3/deluge-1.3.15.tar.xz'
	deluged.service
	deluged.environment
	deluge-web.service)
sha256sums=('a96405140e3cbc569e6e056165e289a5e9ec66e036c327f3912c73d049ccf92c'
	'74f05cf43eae69f8ee8d257443ecdc0b0bbcc82cfb1bdb926ffe0a191164d699'
	'70f5e700570e5286f785a4bd23c23d39ae72c5662d76da9354ace46e8f6e28fd'
	'5d434c265d69773942134c143598fa2aa413989097cc30c007310801270f8b87')

build() {
	cd "${srcdir}/deluge-${pkgver}"
	python2 setup.py build
}

package() {
	cd "${srcdir}/deluge-${pkgver}"
	python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
	cd "${srcdir}"
	install -Dm0644 deluged.service "${pkgdir}/usr/lib/systemd/system/deluged.service"
	install -m0644 deluge-web.service "${pkgdir}/usr/lib/systemd/system/"
	install -Dm0644 deluged.environment "${pkgdir}/etc/conf.d/deluged"

	echo 'u deluge - "Deluge BitTorrent daemon" /srv/deluge' |
		install -Dm644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/deluge.conf"
	echo 'd /srv/deluge 0770 deluge deluge' |
	      install -Dm644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/$pkgname.conf"

	# Remove unneeded file to keep namcap from thinking we need Python 3
	rm "${pkgdir}/usr/lib/python2.7/site-packages/deluge/ui/Win32IconImagePlugin.py"
}
