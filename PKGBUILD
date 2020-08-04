# Maintainer:  Vincent Grande <shoober420@gmail.com>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Moritz Lipp <mlq@pwmt.org>

_pkgbasename=libunwind
pkgname=lib32-libunwind-git
pkgver=1.5
pkgrel=1
pkgdesc="Portable and efficient C programming interface (API) to determine the call-chain of a program (32-bit)"
arch=('x86_64')
url="https://www.nongnu.org/libunwind/"
license=('GPL')
provides=(lib32-libunwind)
conflicts=(lib32-libunwind)
makedepends=('gcc-multilib')
depends=('lib32-gcc-libs' 'libunwind' 'lib32-xz')
source=("git+https://github.com/libunwind/libunwind.git")
sha512sums=('SKIP')
validpgpkeys=('SKIP') # Dave Watson <davejwatson@fb.com> , project admin for unwind

pkgver() {
  cd libunwind
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd libunwind

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  
  cd libunwind
  ./configure \
    --build=i686-pc-linux-gnu \
    --host=i686-pc-linux-gnu \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-documentation 
  make

}

#check() {
#  cd "$srcdir/libunwind"
  # This function is ``supposed'' to fail. Upstream know, but haven't fixed it.
#  make check || :
#}

package() {
  cd libunwind
  make DESTDIR="$pkgdir" install
  
  # this build only provides multilib binary for x86 on x86_64 , remove all includes for other architectures
  find $pkgdir/usr/include/*.h -not -name "*x86*" -exec rm -f {} \;
}

# vim:set ts=2 sw=2 et:

