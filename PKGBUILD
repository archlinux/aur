# Maintainer: Nikola Milinković <nikmil@gmail.com>

# Set to 'y' to enable Numix-like icons for Octopi notifier
_numixicons=

pkgname=octopi-git
_pkgname=octopi
pkgver=0.8.0.r1008.e6fdecb
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
	octopi_transparent_numix.png
        winicon.patch)
md5sums=('SKIP'
         '722f6b5f44661a1c97070b7775311fed'
         '96e3d342c19515b752b10322737f249f'
         'a0e53f3ee4bd1830a46cc305b720200b'
         'c71b9f9d80333d359f5a11e22446c5d0'
         '84388e82f3088ccbca0b5392f864ea90')

pkgver() {
  cd ${srcdir}/$_gitname
  printf "0.8.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${srcdir}/$_gitname
  if [ -n "$_numixicons" ]; then
      patch -Np1 -i ${srcdir}/winicon.patch
      cp -f ${srcdir}/octopi_green_numix.png ${srcdir}/$_gitname/resources/images/octopi_green.png
      cp -f ${srcdir}/octopi_red_numix.png ${srcdir}/$_gitname/resources/images/octopi_red.png
      cp -f ${srcdir}/octopi_yellow_numix.png ${srcdir}/$_gitname/resources/images/octopi_yellow.png
      cp -f ${srcdir}/octopi_transparent_numix.png ${srcdir}/$_gitname/resources/images/octopi_transparent.png
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
