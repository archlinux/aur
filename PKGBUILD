# Maintainer:  Rod Kay               <charlie5 on #ada at freenode.net>

pkgname=gnatmem
pkgver=2020
pkgrel=1
pkgdesc="Monitors dynamic allocation and deallocation activity in a Ada program."

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0')

depends=('gcc-ada')
makedepends=('gprbuild' 'dejagnu')

source=('https://community.download.adacore.com/v1/77354fedca0441f882e17b6a73ac5631bff26237?filename=gnatmem-2020-20200429-19911-src.tar.gz'
        'PKGBUILD-binutils')

sha1sums=('77354fedca0441f882e17b6a73ac5631bff26237'
          'f1a3a988cf97a5e5f8ec51d1b0fb0f1410ab8e5a')

_pkg_src_dir="gnatmem-2020-20200429-19911-src"


prepare()
{
  # We need a built binutils for the gnatmem build, so build it.
  #
  mkdir "$srcdir/binutils"
  mv "$srcdir/PKGBUILD-binutils" "$srcdir/binutils"

  cd "$srcdir/binutils"
  makepkg -p "PKGBUILD-binutils" -C --skippgpcheck --noarchive 

  # Force '-lz' linker flag.
  #
  sed -i 's/@LIBZ@/-lz/'  $srcdir/$_pkg_src_dir/gnatmem.gpr.in
}


build()
{
  cd "$srcdir/$_pkg_src_dir"
  ./configure --with-binutils-buildtree=$srcdir/binutils/src/binutils-build \
              --with-binutils-sources=$srcdir/binutils/src/binutils-gdb
  make
}


package()
{
  cd "$srcdir/$_pkg_src_dir"
  mkdir -p "$pkgdir/usr/bin"
  cp obj/gnatmem "$pkgdir/usr/bin"

  # Clean up.
  rm -fr "$srcdir/binutils"
}
