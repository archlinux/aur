# Maintainer: Rod Kay <rodakay5 at gmail dot com>

pkgname=ada-libfswatch
pkgver=20221116
pkgrel=2
pkgdesc='An Ada binding to the libfswatch library in the fswatch project'

url='https://github.com/AdaCore/ada_libfswatch'
arch=('x86_64')
license=('GPL3' 'custom')

depends=('fswatch' 'gnatcoll-core')
makedepends=('gprbuild')

_git_hash=00fb794cd61f9f86e00151e8380886d361dba102

source=("$pkgname-$pkgver.tar.gz::$url/archive/$_git_hash.tar.gz"
	'0001-Use-system-libfswatch-install.patch'
	'0002-Build-dynamic-library.patch'
	'0003-Makefile-allow-passing-custom-flags-to-gprbuild.patch'
)
sha256sums=('1fdaa48f5d16b5225e848d7c2e8f3961cfbacb6a412efc3e5898d541df411e9a'
            'a1947e1d8b0f0449d196d422d0a2fd038fd8aa6e0abdd533cf71dbece901492b'
            '904c986f2cb67744f8799ec7770f73f3f893713d0ccc5f4c552d8d9a3cc9dae8'
            '53dc07cbb68b3ddfdb3133b0c2edb9878818fcba54d2f1dbc70b8821cf42d1cf')

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
