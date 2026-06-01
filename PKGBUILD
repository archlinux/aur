# Maintiner: Lukas Fink <lukas.fink1@gmail.com>
# Contributor: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Martin Schmölzer <mschmoelzer@gmail.com>

_target=pdp11-aout
pkgname=$_target-binutils
pkgver=2.43
pkgrel=1
pkgdesc='A set of programs to assemble and manipulate binary and object files for the pdp11 a.out target'
arch=(x86_64)
url='https://www.gnu.org/software/binutils/'
license=(GPL)
depends=(zlib libelf)
source=(https://ftp.gnu.org/gnu/binutils/binutils-$pkgver.tar.bz2{,.sig})
sha1sums=('9b0b465bf52fdbb677bd67ba64424842e297ebcd'
          'SKIP')
sha256sums=('fed3c3077f0df7a4a1aa47b080b8c53277593ccbb4e5e78b73ffb4e3f265e750'
            'SKIP')
validpgpkeys=('3A24BC1E8FB409FA9F14371813FCEF89DD9E3C4F') # Nick Clifton (Chief Binutils Maintainer) <nickc@redhat.com>

build() {
  cd binutils-$pkgver

  ./configure --target=$_target \
              --with-sysroot=/usr/$_target \
              --prefix=/usr \
              --enable-multilib \
              --enable-interwork \
              --with-gnu-as \
              --with-gnu-ld \
              --disable-nls \
              --enable-ld=default \
              --enable-gold \
              --enable-plugins \
              --enable-deterministic-archives

  make
}

check() {
  cd binutils-$pkgver

  # unset LDFLAGS as testsuite makes assumptions about which ones are active
  # do not abort on errors - manually check log files
  make LDFLAGS="" -k check || true
}

package() {
  cd binutils-$pkgver

  make DESTDIR="$pkgdir" install

  # Remove conflicting file
  rm "$pkgdir"/usr/lib/bfd-plugins/libdep.so

  # Remove info documents that conflict with host version
  rm -r "$pkgdir"/usr/share/info
}
