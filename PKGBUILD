# Maintainer: Nikola Milinković <nikmil@gmail.com>

# Set to 'y' to enable Numix-like icons for Octopi notifier
_numixicons=

pkgname=octopi-git
_pkgname=octopi
pkgver=0.7.0.28.g3906d74
pkgrel=1
epoch=1
pkgdesc="A powerful Pacman frontend using Qt5 libs"
arch=('i686' 'x86_64')
url="https://github.com/aarnt/octopi"
license=('GPL2')
install=$pkgname.install
makedepends=('git' 'qt5-base')
depends=('qt5-quickcontrols' 'libnotify')
optdepends=('kdesu: for KDE'
            'gksu: for XFCE, Gnome, LXDE, Cinnamon'
            'gnome-keyring: for password management'
            'gist: for SysInfo report'
	    'yaourt: for AUR support'
	    'pacaur: for AUR support'
            'octopi-notifier: for notifications'
            'pkgfile: to view uninstalled pkg contents in ArchLinux'
	    'xfce4-notifyd: for notifications in XFCE'
	    'pacmanlogviewer: to view pacman log files')
provides=('octopi' 'octopi-notifier' 'octopi-repoeditor'
	  'octopi-cachecleaner' 'octopi-pacmanhelper')
conflicts=('octopi' 'octopi-notifier' 'octopi-repoeditor'
	   'octopi-cachecleaner' 'octopi-pacmanhelper' 'oktopi-git')
_gitroot="git+https://github.com/aarnt/octopi.git"
_gitname="octopi"
source=("$_gitname::$_gitroot"
        octopi_green_numix.png
        octopi_red_numix.png
        octopi_yellow_numix.png
        winicon.patch)
md5sums=('SKIP'
         'e74aecc0a53fc0ea5d631df36f87bae3'
         '0bb05ef48589ac17b612256d8269f186'
         '0b933fe68011964a6e02e071f73d6868'
         '84388e82f3088ccbca0b5392f864ea90')

pkgver() {
  cd ${srcdir}/$_gitname
  git describe --tags | sed 's/-/./g' | cut -c2-
}

prepare() {
  cd ${srcdir}/$_gitname
  if [ -n "$_numixicons" ]; then
      patch -Np1 -i ${srcdir}/winicon.patch
      cp -f ${srcdir}/octopi_green_numix.png ${srcdir}/$_gitname/resources/images/octopi_green.png
      cp -f ${srcdir}/octopi_red_numix.png ${srcdir}/$_gitname/resources/images/octopi_red.png
      cp -f ${srcdir}/octopi_yellow_numix.png ${srcdir}/$_gitname/resources/images/octopi_yellow.png
  fi
}

build() {
  _cpucount=$(grep -c processor /proc/cpuinfo 2>/dev/null)
  _jc=$((${cpucount:-1}))
   
  cd "$srcdir/$_gitname"
  qmake-qt5 octopi.pro
  make -j $_jc

  cd "${srcdir}/$_gitname/notifier/pacmanhelper"
  msg "Building pacmanhelper..."
  qmake-qt5 pacmanhelper.pro
  make -j $_jc

  cd "${srcdir}/$_gitname/notifier/octopi-notifier"
  msg "Building octopi-notifier..."
  qmake-qt5 octopi-notifier.pro
  make -j $_jc

  cd "${srcdir}/$_gitname/repoeditor"
  msg "Building octopi-repoeditor..."
  qmake-qt5 octopi-repoeditor.pro
  make -j $_jc

  cd "${srcdir}/$_gitname/cachecleaner"
  msg "Building octopi-cachecleaner..."
  qmake-qt5 octopi-cachecleaner.pro
  make -j $_jc
}

package() {
   #Octopi main files
   install -D -m755 ${srcdir}/$_gitname/bin/$_pkgname ${pkgdir}/usr/bin/$_pkgname
   install -D -m644 ${srcdir}/$_gitname/$_pkgname.desktop ${pkgdir}/usr/share/applications/$_pkgname.desktop
   install -D -m644 ${srcdir}/$_gitname/resources/images/${_pkgname}_green.png ${pkgdir}/usr/share/icons/$_pkgname.png
   install -D -m644 ${srcdir}/$_gitname/resources/images/${_pkgname}_green.png ${pkgdir}/usr/share/icons/gnome/32x32/apps/$_pkgname.png
   install -D -m644 ${srcdir}/$_gitname/resources/images/${_pkgname}_red.png ${pkgdir}/usr/share/icons/${_pkgname}_red.png
   install -D -m644 ${srcdir}/$_gitname/resources/images/${_pkgname}_yellow.png ${pkgdir}/usr/share/icons/${_pkgname}_yellow.png

   #speedup files
   install -D -m755 ${srcdir}/$_gitname/speedup/speedup-octopi.sh ${pkgdir}/usr/bin/speedup-octopi.sh
   install -D -m644 ${srcdir}/$_gitname/speedup/${_pkgname}.service ${pkgdir}/etc/systemd/system/${_pkgname}.service

   #Pacmaneditor files
   install -D -m755 ${srcdir}/$_gitname/repoeditor/bin/octopi-repoeditor ${pkgdir}/usr/bin/octopi-repoeditor

   #Cachecleaner files
   install -D -m755 ${srcdir}/$_gitname/cachecleaner/bin/octopi-cachecleaner ${pkgdir}/usr/bin/octopi-cachecleaner
   install -D -m644 ${srcdir}/$_gitname/cachecleaner/octopi-cachecleaner.desktop ${pkgdir}/usr/share/applications/octopi-cachecleaner.desktop

   #Pacmanhelper service files
   install -D -m755 ${srcdir}/$_gitname/notifier/bin/pacmanhelper ${pkgdir}/usr/lib/octopi/pacmanhelper

   install -D -m644 ${srcdir}/$_gitname/notifier/pacmanhelper/polkit/org.octopi.pacman.policy ${pkgdir}/usr/share/polkit-1/actions/org.octopi.pacman.policy
   install -D -m644 ${srcdir}/$_gitname/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.conf ${pkgdir}/etc/dbus-1/system.d/org.octopi.pacmanhelper.conf
   install -D -m644 ${srcdir}/$_gitname/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.xml ${pkgdir}/usr/share/dbus-1/interfaces/org.octopi.pacmanhelper.xml
   install -D -m644 ${srcdir}/$_gitname/notifier/pacmanhelper/polkit/org.octopi.pacmanhelper.service ${pkgdir}/usr/share/dbus-1/system-services/org.octopi.pacmanhelper.service

   #Octopi-notifier file
   install -D -m755 ${srcdir}/$_gitname/notifier/bin/octopi-notifier ${pkgdir}/usr/bin/octopi-notifier
   install -D -m644 ${srcdir}/$_gitname/octopi-notifier.desktop ${pkgdir}/etc/xdg/autostart/octopi-notifier.desktop

   #Octopi-repoeditor file
   install -D -m755 ${srcdir}/$_gitname/repoeditor/bin/octopi-repoeditor ${pkgdir}/usr/bin/octopi-repoeditor

   #Octopi-cachecleaner file
   install -D -m755 ${srcdir}/$_gitname/cachecleaner/bin/octopi-cachecleaner ${pkgdir}/usr/bin/octopi-cachecleaner
   install -D -m644 ${srcdir}/$_gitname/cachecleaner/octopi-cachecleaner.desktop ${pkgdir}/usr/share/applications/octopi-cachecleaner.desktop
}
