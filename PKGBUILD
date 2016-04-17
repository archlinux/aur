# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=octopi
pkgname=('octopi' 'octopi-notifier' 'octopi-repoeditor' 'octopi-cachecleaner')
pkgver=0.8.1
pkgrel=3
pkgdesc="a powerful Pacman frontend using Qt libs"
arch=('i686' 'x86_64')
url="http://octopiproject.wordpress.com"
license=('GPL2')
install=$pkgname.install
makedepends=('qt5-declarative')
source=("https://github.com/aarnt/${pkgname}/archive/v${pkgver}.tar.gz"
	'octopi-repoeditor.desktop'
	'enable-kstatus.patch')
sha256sums=('e01c6d959e5663797771b95b47951e3ad11a9abbc7cbb009f1f835404c5ff43e'
            '131f16745df685430db55e54ede6da66aed9b02ca00d6d873a002b2a3e1c90ef'
            '288dd58a8aa98ef5ad901aec600d0a3c36fa81b60d51385bceeadec0c1aa7b01')

prepare() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

  
	patch -p0 < ../enable-kstatus.patch
}            
            
build() {
	cd "${srcdir}/${pkgbase}-${pkgver}"

	qmake-qt5 octopi.pro
	make

	cd "${srcdir}/${pkgbase}-${pkgver}/notifier/pacmanhelper"
	msg "Building pacmanhelper..."
	qmake-qt5 pacmanhelper.pro
	make

	cd "${srcdir}/${pkgbase}-${pkgver}/notifier/octopi-notifier"
	msg "Building octopi-notifier..."
	qmake-qt5 octopi-notifier.pro
	make
  
	cd "${srcdir}/${pkgbase}-${pkgver}/repoeditor"
	msg "Building octopi-repoeditor..."
	qmake-qt5 octopi-repoeditor.pro
	make

	cd "${srcdir}/${pkgbase}-${pkgver}/cachecleaner"
	msg "Building octopi-cachecleaner..."
	qmake-qt5 octopi-cachecleaner.pro
	make
}

package_octopi() {
	pkgdesc="A powerful Pacman frontend using Qt5 libs"
	install=octopi.install
	depends=('qt5-declarative')
	optdepends=('xterm: for AUR support'
				'kdesu: for KDE'
		    'gksu: for XFCE, Gnome, LXDE, Cinnamon'
				'lxqt-sudo: for LXQT'
		    'gnome-keyring: for password management'
		    'gist: for SysInfo report'
		    'pacaur: for AUR support'
		    'yaourt: for AUR support'
		    'octopi-repoeditor: for editing functions'
		    'octopi-cachecleaner: for cleaning functions'
		    'octopi-notifier: for notifications'
		    'octopi-notifier-kde4: for notifications on kde'
		    'pacmanlogviewer: to view pacman log files')
	conflicts=('octopi-git')

	cd "${srcdir}/${pkgbase}-${pkgver}"
 
	install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/resources/images/${pkgname}_green.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/resources/images/${pkgname}_green.png" "${pkgdir}/usr/share/icons/gnome/32x32/apps/${pkgname}.png"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/resources/images/${pkgname}_red.png" "${pkgdir}/usr/share/icons/${pkgname}_red.png"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/resources/images/${pkgname}_yellow.png" "${pkgdir}/usr/share/icons/${pkgname}_yellow.png"
  
	#Pacmanhelper service files
	install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/notifier/bin/pacmanhelper" "${pkgdir}/usr/lib/octopi/pacmanhelper"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/notifier/pacmanhelper/polkit/org.octopi.pacman.policy" "${pkgdir}/usr/share/polkit-1/actions/org.octopi.pacman.policy"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.conf" "${pkgdir}/etc/dbus-1/system.d/org.octopi.pacmanhelper.conf"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.xml" "${pkgdir}/usr/share/dbus-1/interfaces/org.octopi.pacmanhelper.xml"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.service" "${pkgdir}/usr/share/dbus-1/system-services/org.octopi.pacmanhelper.service"

	#speedup files
	install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/speedup/speedup-octopi.sh" "${pkgdir}/usr/bin/speedup-octopi.sh"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/speedup/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

package_octopi-notifier() {
	pkgdesc="Notifier for Octopi"
	depends=('octopi' 'libnotify' 'knotifications')
	optdepends=('xfce4-notifyd: for notifications in XFCE')
	install=octopi.install
	conflicts=('octopi-notifier-qt4' 'octopi-notifier-kde' 'octopi-notifier-kde4')

	#Octopi-notifier files
	install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/notifier/bin/octopi-notifier" "${pkgdir}/usr/bin/octopi-notifier"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/octopi-notifier.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/octopi-notifier.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
}

package_octopi-repoeditor() {
	pkgdesc="Pacman repo editor for Octopi"
	install=octopi.install
	depends=('qt5-base')

	#Octopi-repoeditor files
	install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/repoeditor/bin/octopi-repoeditor" "${pkgdir}/usr/bin/octopi-repoeditor"
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/resources/images/${pkgbase}_red.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

package_octopi-cachecleaner() {
	pkgdesc="Cachecleaner for Octopi"
	depends=('qt5-base')

	#Octopi-cachecleaner files
	install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/cachecleaner/bin/octopi-cachecleaner" "${pkgdir}/usr/bin/octopi-cachecleaner"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/cachecleaner/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}

# vim: set ts=2 sw=2 ft=sh noet:
