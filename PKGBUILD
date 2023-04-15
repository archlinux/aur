pkgname=xview
_pkgname=XView
pkgver=3.2p1.4_25.22
_pkgver=${pkgver//_/-}
_ver=${pkgver: 0: 7}
pkgrel=1
pkgdesc="an OPEN LOOK Toolkit for X Window Files"
arch=('i686')
url="https://sourceforge.net/projects/xview"
license=('BSD')
depends=('boost-libs' 'libtirpc' 'lib32-flex' 'lib32-libxpm')
makedepends=('boost' 'unzip' 'imake')
conflicts=()
source=("xview-${_pkgver}.src.rpm::https://sourceforge.net/projects/xview/files/xview/RHEL8/xview-${_pkgver}/xview-${_pkgver}.el8.src.rpm/download"
	"2023-04-16.diff")
sha256sums=('4a2d82b1870a3fc45477042ddfbbe0809965af324b368d269b8fd2e16ff2d546'
            'be3f728f21d2ca8f7bd72093b8e9242ed8c4fef3c4dc8d9fb8d970c95cb6c92d')
prepare() {
  cd $srcdir/
  mkdir -p $srcdir/$pkgname-$_ver
  unzip $(ls *.zip) -d $srcdir/$pkgname-$_ver
  cd  $srcdir/$pkgname-$_ver/$_pkgname
  # patch build
  patch -p1 < $srcdir/2023-04-16.diff
  # patch lib
  sed -i -e 's|extern int|extern ssize_t|' -e 's|char *\*buf;|void *buf;|' -e 's|int *nbytes;|size_t nbytes;|' lib/libxview/notify/ndet_read.c
  sed -i "s@union wait@int@g" lib/libxview/notify/ndisd_wait.c lib/libxview/notify/notify.h lib/libxview/notify/nintn_wait.c  lib/libxview/ttysw/tty.c clients/olvwm-4.1/olwm.c clients/olvwm-4.5/olwm.c clients/olwm/olwm.c contrib/examples/notifier/ntfy_pipe.c
  sed -i "s@Xv_private_data CONST char@Xv_private_data extern CONST char@g" lib/libxview/misc/i18n_impl.h
  sed -i "s@int             ttysw_waiting_for_pty_input;@extern int ttysw_waiting_for_pty_input;@g" lib/libxview/ttysw/tty_modes.c
  sed -i "s@cfree@free@g" lib/libxview/filter/filter.c lib/libxview/ttysw/cim_size.c
  # patch clients
  sed -i "s@#include <regexp.h>@//#include <regexp.h>@g" clients/olvwm-4.5/virtual.c clients/olvwm-4.1/virtual.c
}
build() {
  cd "$pkgname-$_ver"/$_pkgname 
  OPENWINHOME=$pkgdir/usr bash Build-LinuxXView.bash.amd64 libs clients # contrib olvwm
}

package() {
  cd "$pkgname-$_ver"/$_pkgname 
  X11DIR=$srcdir/$pkgname OPENWINHOME=$pkgdir/usr  bash Build-LinuxXView.bash.amd64 instlibs instclients # instcontrib instolvwm 
for pkg in xgettext msgfmt
do
  mv $pkgdir/usr/bin/$pkg $pkgdir/usr/bin/$_pkgname-$pkg
  mv $pkgdir/usr/man/man1/$pkg.1 $pkgdir/usr/man/man1/$_pkgname-$pkg.1 
done
}
