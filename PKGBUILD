# Maintainer:  Rod Kay               <charlie5 on #ada at freenode.net>

pkgname=gnatmem
pkgver=2019
pkgrel=1
pkgdesc="Monitors dynamic allocation and deallocation activity in a Ada program."

arch=('i686' 'x86_64')
url="https://libre.adacore.com/"
license=('GPL V3.0')

depends=('gcc-ada')
makedepends=('gprbuild' 'dejagnu')

source=('http://mirrors.cdn.adacore.com/art/5cdf8e1431e87a8f1d425089'
        'PKGBUILD-binutils')

sha1sums=('0c5410d6d86230d52f91e9a04991a5c42b958ea8'
          'eb3289b710e71fc1be47f195dfb8e3a055f30190')

_pkg_src_dir="gnatmem-2019-20190429-19745-src"


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
              --with-binutils-sources=$srcdir/binutils/src/binutils-2.32
  make
}


package()
{
  cd "$srcdir/$_pkg_src_dir"
  mkdir -p "$pkgdir/usr/bin"
  cp obj/gnatmem "$pkgdir/usr/bin"

  # Clean up.
  rm -fr "$srcdir/binutils/src"
  rm -fr "$srcdir/binutils/pkg"
  rm "$srcdir/binutils/binutils-2.32.tar.xz"
  rm "$srcdir/binutils/binutils-2.32.tar.xz.sig"
}
