# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=ada-libfswatch
pkgver=20210818
pkgrel=2
pkgdesc='An Ada binding to the libfswatch library in the fswatch project'

url='https://github.com/AdaCore/ada_libfswatch'
arch=('x86_64')
license=('GPL3' 'custom')

depends=('fswatch' 'gnatcoll-core')
makedepends=('git' 'gcc-ada' 'gprbuild')

_git_hash=94c0a5f137b88113a791a148b60e5e7d019d6fa1

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_git_hash.tar.gz"
	'0001-Use-system-libfswatch-install.patch'
	'0002-Build-dynamic-library.patch'
	'0003-Makefile-allow-passing-custom-flags-to-gprbuild.patch'
)
sha1sums=('9b49fbd1953ed56858305dc15c4ab72ef38f5387'
          'f79efd5b3d7599d1653c2a5b335e1b0184e4c59f'
          '526a664c25b08f77dbb61e469b8ca61db8a334ce'
          '02ec74e84d3396cb2e494a7518bf3e86e93b32c6')


prepare()
{
   cd "$srcdir/ada_libfswatch-$_git_hash"

   patch -p1 < "$srcdir/0001-Use-system-libfswatch-install.patch"
   patch -p1 < "$srcdir/0002-Build-dynamic-library.patch"
   patch -p1 < "$srcdir/0003-Makefile-allow-passing-custom-flags-to-gprbuild.patch"
}

build()
{
   cd "$srcdir/ada_libfswatch-$_git_hash"

   ADA_FLAGS="$CFLAGS"
   ADA_FLAGS="${ADA_FLAGS//-Wformat}"
   ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

   make GPRBUILD_FLAGS="-vh -R -cargs $ADA_FLAGS -largs $LDFLAGS -gargs"
}

package()
{
   cd "$srcdir/ada_libfswatch-$_git_hash"

   OS=unix make install DESTDIR="$pkgdir/usr"

   # 'gprinstall' installs a soft link for '/usr/lib/libfswatch.so' 
   # which is already owned by fswatch, so remove it.
   rm "$pkgdir/usr/lib/libfswatch.so"

   # Install the license.
   install -D -m644     \
      "COPYING3"        \
      "$pkgdir/usr/share/licenses/ada-libfswatch/COPYING3"

   # Install the custom license.
   install -D -m644     \
      "COPYING.RUNTIME" \
      "$pkgdir/usr/share/licenses/ada-libfswatch/COPYING.RUNTIME"
}
