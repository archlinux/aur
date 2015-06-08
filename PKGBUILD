# Maintainer: Jameson Pugh <imntreal@gmail.com>

pkgbase=octopi
pkgname=('octopi' 'octopi-notifier' 'octopi-repoeditor' 'octopi-cachecleaner')
pkgver=0.7.0
pkgrel=3
arch=('i686' 'x86_64')
url="https://github.com/aarnt/octopi"
license=('GPL2')
makedepends=('qt5-declarative' 'qt4' 'knotifications' 'libnotify')
source=("https://github.com/aarnt/${pkgname}/archive/v${pkgver}.tar.gz"
				'octopi-repoeditor.desktop')
sha256sums=('03d15458ebe482e5a9a00e7a3db5676a53886c754b13a7c56e36d75b73f2d496'
            '131f16745df685430db55e54ede6da66aed9b02ca00d6d873a002b2a3e1c90ef')

build() {
  _cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  _jc=$((${_cpucount:-1}))
   
  cd "${srcdir}/${pkgbase}-${pkgver}"

  qmake-qt5 octopi.pro
  make -j $_jc

  cd "${srcdir}/${pkgbase}-${pkgver}/notifier/pacmanhelper"
  msg "Building pacmanhelper..."
  qmake-qt5 pacmanhelper.pro
  make -j $_jc

  cd "${srcdir}/${pkgbase}-${pkgver}/notifier/octopi-notifier"
  msg "Building octopi-notifier..."
  qmake-qt5 octopi-notifier.pro
  make -j $_jc

  cd "${srcdir}/${pkgbase}-${pkgver}/repoeditor"
  msg "Building octopi-repoeditor..."
  qmake-qt5 octopi-repoeditor.pro
  make -j $_jc

  cd "${srcdir}/${pkgbase}-${pkgver}/cachecleaner"
  msg "Building octopi-cachecleaner..."
  qmake-qt5 octopi-cachecleaner.pro
  make -j $_jc
}

package_octopi() {
	pkgdesc="A powerful Pacman frontend using Qt5 libs"
  install="octopi.install"
  depends=('qt5-base' 'qt5-declarative' 'xterm')
  optdepends=('kdesu: for KDE'
              'gksu: for XFCE, Gnome, LXDE, Cinnamon'
              'gnome-keyring: for password management'
              'gist: for SysInfo report'
              'pacaur: for AUR support'
              'yaourt: for AUR support'
              'octopi-repoeditor: for editing functions'
              'octopi-cachecleaner: for cleaning functions'
              'octopi-notifier: for notifications'
              'octopi-notifier-qt4: for notifications'
							'pacmanlogviewer: to view pacman log files')
	conflicts=('oktopi-git')

  cd "${srcdir}/${pkgbase}-${pkgver}"
 
	install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/resources/images/${pkgname}_green.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/resources/images/${pkgname}_green.png" "${pkgdir}/usr/share/icons/gnome/32x32/apps/${pkgname}.png"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/resources/images/${pkgname}_red.png" "${pkgdir}/usr/share/icons/${pkgname}_red.png"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/resources/images/${pkgname}_yellow.png" "${pkgdir}/usr/share/icons/${pkgname}_yellow.png"
  
  #Pacmanhelper service files
  install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/notifier/bin/pacmanhelper" "${pkgdir}/usr/lib/octopi/pacmanhelper"

	#speedup files
	install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/speedup/speedup-octopi.sh" "${pkgdir}/usr/bin/speedup-octopi.sh"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/speedup/${pkgname}.service" "${pkgdir}/etc/systemd/system/${pkgname}.service"

  install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/notifier/pacmanhelper/polkit/org.octopi.pacman.policy" "${pkgdir}/usr/share/polkit-1/actions/org.octopi.pacman.policy"
  install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.conf" "${pkgdir}/etc/dbus-1/system.d/org.octopi.pacmanhelper.conf"
  install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.xml" "${pkgdir}/usr/share/dbus-1/interfaces/org.octopi.pacmanhelper.xml"
  install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.service" "${pkgdir}/usr/share/dbus-1/system-services/org.octopi.pacmanhelper.service"
}

package_octopi-notifier() {
  pkgdesc="Notifier for Octopi"
  depends=('octopi' 'libnotify')
  optdepends=('xfce4-notifyd: for notifications in XFCE')
  install=octopi.install
	conflicts='octopi-notifier-qt4'
	replaces='octopi-notifier-qt4'

  #Octopi-notifier file
  install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/notifier/bin/octopi-notifier" "${pkgdir}/usr/bin/octopi-notifier"
  install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/octopi-notifier.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/octopi-notifier.desktop" "${pkgdir}/etc/xdg/autostart/octopi-notifier.desktop"
}

package_octopi-repoeditor() {
  pkgdesc="Pacman repo editor for Octopi"
  install=octopi.install

  install -D -m755 "${srcdir}/${pkgbase}-${pkgver}/repoeditor/bin/octopi-repoeditor" "${pkgdir}/usr/bin/octopi-repoeditor"
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -D -m644 "${srcdir}/${pkgbase}-${pkgver}/resources/images/${pkgbase}_red.png" "${pkgdir}/usr/share/icons/${pkgname}.png"
}

package_octopi-cachecleaner() {
   pkgdesc="Cachecleaner for Octopi"

   #Octopi-cachecleaner file
   install -D -m755 ${srcdir}/${pkgbase}-${pkgver}/cachecleaner/bin/octopi-cachecleaner ${pkgdir}/usr/bin/octopi-cachecleaner
   install -D -m644 ${srcdir}/${pkgbase}-${pkgver}/cachecleaner/$pkgname.desktop ${pkgdir}/usr/share/applications/$pkgname.desktop
}

# vim: set ts=2 sw=2 ft=sh noet:
