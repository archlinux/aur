# Contributor: Thomas Krug <t.krug@elektronenpumpe.de>

pkgname=gerbv-git
_pkgname=gerbv
pkgver=r1544.b5f1eac
pkgrel=1
pkgdesc="An open source Gerber file (RS-274X only) viewer"
url="http://gerbv.geda-project.org/"
license=('GPL')
arch=('x86_64')
depends=('gtk2' 'dconf')
optdepends=('cairo: for better graphics')
makedepends=('cvs' 'gettext' 'git')
provides=('gerbv')
conflicts=('gerbv')
source=("$_pkgname"::'git://git.geda-project.org/gerbv.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build ()
{
  cd "$srcdir/$_pkgname"
  CFLAGS+=' -fcommon' # https://wiki.gentoo.org/wiki/Gcc_10_porting_notes/fno_common
  ./autogen.sh
  sed -i 's|am_aux_dir=`cd $ac_aux_dir|am_aux_dir=`cd $srcdir|' configure
  ./configure --prefix=/usr \
              --disable-update-desktop-database 
  make 
}

package()
{
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir" install 
}

