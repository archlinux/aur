# Maintainer: Nikola Milinković <nikmil@gmail.com>

# Set to 'y' to enable Numix-like icons for Octopi notifier
_numixicons=

pkgname=octopi-git
_pkgname=octopi
pkgver=0.8.1.r1166.144c3f2
pkgrel=1
epoch=1
pkgdesc="A powerful Pacman frontend using Qt5 libs"
arch=('i686' 'x86_64')
url="https://github.com/aarnt/octopi"
license=('GPL2')
install=$pkgname.install
makedepends=('git' 'qt5-base')
depends=('qt5-quickcontrols' 'pacman' 'pkgfile' 'knotifications' 'alpm_octopi_utils' 'xterm')
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
  _jc=$((${_cpucount:-1}))

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
   cd ${srcdir}/$_gitname
   make INSTALL_ROOT=${pkgdir} install

   cd notifier/pacmanhelper
   make INSTALL_ROOT=${pkgdir} install
   cd ../..

   cd notifier/octopi-notifier
   make INSTALL_ROOT=${pkgdir} install
   cd ../..

   cd repoeditor
   make INSTALL_ROOT=${pkgdir} install
   cd ..

   cd cachecleaner
   make INSTALL_ROOT=${pkgdir} install
}
