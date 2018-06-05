# Maintainer: kikadf <kikadf.01@gmail.com>
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgbase=octopi
pkgname=('octopi' 'octopi-pacmanhelper' 'octopi-notifier-qt5' 'octopi-notifier-frameworks' 'octopi-repoeditor' 'octopi-cachecleaner')
pkgver=0.8.5
pkgrel=4
# This is the release package so the below _gitcommit variable should (usually) be commented out.
_gitcommit="1c07b57afadec2e08a8899724c98602dd7227cfb"
pkgdesc="A powerful Pacman frontend using Qt libs"
arch=('i686' 'x86_64')
url="http://octopiproject.wordpress.com"
license=('GPL2')
makedepends=('qt5-declarative' 'pacman-contrib' 'git' 'knotifications' 'alpm_octopi_utils' 'qtermwidget')
if [ "${_gitcommit}" != "" ]; then
	source=("octopi-${pkgver}-${pkgrel}.tar.gz::https://github.com/aarnt/octopi/archive/${_gitcommit}.tar.gz"
	'octopi-repoeditor.desktop')
else
  source=("https://github.com/aarnt/${pkgname}/archive/v${pkgver}.tar.gz"
	'octopi-repoeditor.desktop')
fi
sha256sums=('d6941a182d691d47305b338aac2f1e3c4bd164c7e686cf4fc01a02bc2e816dfe'
            '131f16745df685430db55e54ede6da66aed9b02ca00d6d873a002b2a3e1c90ef')

prepare() {
  if [ "${_gitcommit}" != "" ]; then
    cd "${srcdir}/${pkgbase}-${_gitcommit}"
  else
	  cd "${srcdir}/${pkgbase}-${pkgver}"
  fi
  
	# sed version
  sed -i -e "s|0.9.0 (dev)|${pkgver}-${pkgrel}|g" src/strconstants.h

  cp -r notifier notifier-qt5
  cp -r notifier notifier-frameworks
	sed -i 's|#DEFINES += KSTATUS|DEFINES += KSTATUS|' notifier-frameworks/octopi-notifier/octopi-notifier.pro
}            
           
build() {
	if [ "${_gitcommit}" != "" ]; then
    cd "${srcdir}/${pkgbase}-${_gitcommit}"
	else
  	cd "${srcdir}/${pkgbase}-${pkgver}"
	fi

	msg "Building octopi..."
	qmake-qt5 octopi.pro
	make

	cd notifier/pacmanhelper
	msg "Building pacmanhelper..."
	qmake-qt5 pacmanhelper.pro
	make

	cd ../../notifier-qt5/octopi-notifier
	msg "Building octopi-notifier-qt5..."
	qmake-qt5 octopi-notifier.pro
	make
  
	cd ../../notifier-frameworks/octopi-notifier
	msg "Building octopi-notifier-frameworks..."
	qmake-qt5 octopi-notifier.pro
	make
  
	cd ../../repoeditor
	msg "Building octopi-repoeditor..."
	qmake-qt5 octopi-repoeditor.pro
	make

	cd ../cachecleaner
	msg "Building octopi-cachecleaner..."
	qmake-qt5 octopi-cachecleaner.pro
	make
}

package_octopi() {
	pkgdesc="A powerful Pacman frontend using Qt5 libs"
	depends=('qt5-declarative' 'alpm_octopi_utils' 'qtermwidget')
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
		    'octopi-notifier-qt5: for notifications'
		    'octopi-notifier-frameworks: for notifications'
		    'pacmanlogviewer: to view pacman log files')
	conflicts=('octopi-git')

	if [ "${_gitcommit}" != "" ]; then
    cd "${srcdir}/${pkgbase}-${_gitcommit}"
	else
		cd "${srcdir}/${pkgbase}-${pkgver}"
	fi
 
	install -D -m755 "bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "resources/images/${pkgname}_green.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
	install -D -m644 "resources/images/${pkgname}_green.png" "${pkgdir}/usr/share/icons/gnome/32x32/apps/${pkgname}.png"
	install -D -m644 "resources/images/${pkgname}_red.png" "${pkgdir}/usr/share/icons/${pkgname}_red.png"
	install -D -m644 "resources/images/${pkgname}_yellow.png" "${pkgdir}/usr/share/icons/${pkgname}_yellow.png"
  
	#speedup files
	install -D -m755 "speedup/speedup-octopi.sh" "${pkgdir}/usr/bin/speedup-octopi.sh"
	install -D -m644 "speedup/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
}

package_octopi-pacmanhelper() {
	pkgdesc="Pacman helper for Octopi notifier"
  depends=('qt5-base')
	
  if [ "${_gitcommit}" != "" ]; then
    cd "${srcdir}/${pkgbase}-${_gitcommit}"
  else
    cd "${srcdir}/${pkgbase}-${pkgver}"
  fi
	
  install -Dm755 "notifier/bin/pacmanhelper" "${pkgdir}/usr/lib/octopi/pacmanhelper"
	install -Dm644 "notifier/pacmanhelper/polkit/org.octopi.pacman.policy" "${pkgdir}/usr/share/polkit-1/actions/org.octopi.pacman.policy"
	install -Dm644 "notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.conf" "${pkgdir}/etc/dbus-1/system.d/org.octopi.pacmanhelper.conf"
	install -Dm644 "notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.xml" "${pkgdir}/usr/share/dbus-1/interfaces/org.octopi.pacmanhelper.xml"
	install -Dm644 "notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.service" "${pkgdir}/usr/share/dbus-1/system-services/org.octopi.pacmanhelper.service"
}

package_octopi-notifier-qt5() {
	pkgdesc="Notifier for Octopi using Qt5 libs"
	depends=('octopi-pacmanhelper' 'libnotify' 'qt5-base')
	optdepends=('xfce4-notifyd: for notifications in XFCE')
	conflicts=('octopi-notifier' 'octopi-notifier-qt4' 'octopi-notifier-frameworks')
	provides=('octopi-notifier')
	replaces=('octopi-notifier-qt4')
	
	if [ "${_gitcommit}" != "" ]; then
		cd "${srcdir}/${pkgbase}-${_gitcommit}"
	else
		cd "${srcdir}/${pkgbase}-${pkgver}"
	fi
	
	#Octopi-notifier files
	install -D -m755 "notifier-qt5/bin/octopi-notifier" "${pkgdir}/usr/bin/octopi-notifier"
	install -D -m644 "notifier-qt5/octopi-notifier/octopi-notifier.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "notifier-qt5/octopi-notifier/octopi-notifier.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
}

package_octopi-notifier-frameworks() {
	pkgdesc="Notifier for Octopi with Knotifications support"
	depends=('octopi-pacmanhelper' 'libnotify' 'knotifications')
	optdepends=('xfce4-notifyd: for notifications in XFCE')
	conflicts=('octopi-notifier' 'octopi-notifier-qt4' 'octopi-notifier-qt5')
	provides=('octopi-notifier')
	replaces=('octopi-notifier')
	
	if [ "${_gitcommit}" != "" ]; then
		cd "${srcdir}/${pkgbase}-${_gitcommit}"
	else
		cd "${srcdir}/${pkgbase}-${pkgver}"
	fi
	
	#Octopi-notifier files
	install -D -m755 "notifier-frameworks/bin/octopi-notifier" "${pkgdir}/usr/bin/octopi-notifier"
	install -D -m644 "notifier-frameworks/octopi-notifier/octopi-notifier.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "notifier-frameworks/octopi-notifier/octopi-notifier.desktop" "${pkgdir}/etc/xdg/autostart/${pkgname}.desktop"
}

package_octopi-repoeditor() {
	pkgdesc="Pacman repo editor for Octopi"
	depends=('qt5-base')
	
	if [ "${_gitcommit}" != "" ]; then
  	cd "${srcdir}/${pkgbase}-${_gitcommit}"
	else
	  cd "${srcdir}/${pkgbase}-${pkgver}"
	fi
	
	#Octopi-repoeditor files
	install -D -m755 "repoeditor/bin/octopi-repoeditor" "${pkgdir}/usr/bin/octopi-repoeditor"
	install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "resources/images/${pkgbase}_red.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

package_octopi-cachecleaner() {
	pkgdesc="Cachecleaner for Octopi"
	depends=('qt5-base')
	
	if [ "${_gitcommit}" != "" ]; then
	  cd "${srcdir}/${pkgbase}-${_gitcommit}"
	else
		cd "${srcdir}/${pkgbase}-${pkgver}"
	fi
	
	#Octopi-cachecleaner files
	install -D -m755 "cachecleaner/bin/octopi-cachecleaner" "${pkgdir}/usr/bin/octopi-cachecleaner"
	install -D -m644 "cachecleaner/$pkgname.desktop" "${pkgdir}/usr/share/applications/$pkgname.desktop"
}

# vim: set ts=2 sw=2 ft=sh noet:
