# Contributor: Andreas Boehler <andy dot boehler at gmx dot at> 
# Maintainer: Olivier Mehani <shtrom-aur@ssji.net>

pkgname=mbm-gpsd-git
pkgver=20121031
pkgrel=2
pkgdesc="GPS support files for Ericsson F3507g that provide an easy interface to gpsd"
arch=('i686' 'x86_64')
url="http://mbm.sourceforge.net/"
license=('GPL')
groups=()
depends=('networkmanager' 'network-manager-applet' 'intltool' 'gtk-doc' 'libnl1')
makedepends=('git')
optdepends=()
provides=('mbm-gpsd')
conflicts=()
replaces=()
backup=()
options=()
install=
source=(0001-Remove-call-to-g_type_init.patch)
noextract=()
md5sums=('b95c87ed13611f3903ed9bc5e504b947')
_gitname=mbm-gpsd
_gitroot=git://mbm.git.sourceforge.net/gitroot/mbm/${_gitname}/


build() {
  msg "Connecting to sourceforge.net git server...."
  rm  -rf $startdir/src/$_gitname-build
  if [[ -d $_gitname ]]; then
  cd $_gitname || return 1
  git pull origin || return 1
  else
  git clone $_gitroot $_gitname || return 1
  fi
  msg " checkout done."
  cd $srcdir || return 1
  cp -r $_gitname $_gitname-build
  cd $_gitname-build || return 1
  patch -p1 < $srcdir/0001-Remove-call-to-g_type_init.patch
  unset CFLAGS
  unset CXXFLAGS
  ./autogen.sh  --prefix=/usr --sysconfdir=/etc --localstatedir=/var || return 1
  make CFLAGS="-Wno-error" || return 1
}

package() {
  make DESTDIR=$pkgdir install || return 1
  mv $pkgdir/usr/sbin/* $pkgdir/usr/bin/
  rmdir $pkgdir/usr/sbin/
  rm -rf $srcdir/$_gitname-build


}
