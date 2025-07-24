# Maintainer:  Rod Kay              <rodakay5 at gmail.com>
# Contributor: Sietse van der Molen <sietse@vdmolen.eu>

pkgname=florist
pkgdesc='An open-source implementation of IEEE Standard 1003.5b-1996, the POSIX Ada binding.'
pkgver=2025
pkgrel=1

arch=(i686 x86_64)
url=https://github.com/Blady-Com/florist
license=(GPL3)

depends=(gcc-ada)
options=(staticlibs !strip)

source=(git+https://github.com/Blady-Com/florist.git
        posix-signals.patch
        posix-implementation.patch
        posix-supplement_to_ada_io.patch
        posix-unsafe_process_primitives.patch
        remove_redundant_parentheses_from-posix-signals.adb.patch)
        
sha256sums=(SKIP
            c8cdc201ce444dd9bcdaf4ed790ce6ce3cfabe922d5e804edc3356cf28b3e1f2
            daefcebb30f49f437562c63b1957891963fbf832448892f4c73ae575735a972c
            0d3366e14e12df13f68c12122eb896cc1be21590f897dda52e212805b529185b
            9750ff2db04afd7d9394101f286206bc0b62085e3bad93de44804a47fad14c72
            SKIP)


prepare()
{
  cd $srcdir/$pkgname

  patch -Np0 -i ../posix-signals.patch
  patch -Np0 -i ../posix-implementation.patch
  patch -Np0 -i ../posix-supplement_to_ada_io.patch
  patch -Np0 -i ../posix-unsafe_process_primitives.patch
  patch -Np0 -i ../remove_redundant_parentheses_from-posix-signals.adb.patch
}


build() 
{
  cd $srcdir/$pkgname

  ./configure --prefix=$pkgdir/usr --with-build-type=Production
  
  PROCESSORS=$(nproc) \
  make
  
#  make rm-doc     # Requires gnatdoc.
}


package() 
{
  cd $srcdir/$pkgname

  make DESTDIR="$pkgdir/" install
}