# Maintainer: Lone_Wolf <lonewolf at xs4all dot nl>
# Contributor: Moritz Lipp <mlq@pwmt.org>

_pkgbasename=libunwind
pkgname=lib32-libunwind
pkgver=1.2
pkgrel=1
pkgdesc="Portable and efficient C programming interface (API) to determine the call-chain of a program, multilib version"
arch=('x86_64')
url="http://www.nongnu.org/libunwind/"
license=('GPL')
depends=('libunwind' 'lib32-xz' 'gcc-multilib')
validpgpkeys=('1675C8DA2EF907FB116EB709EC52B396E6874AF2') # Dave Watson <davejwatson@fb.com> , project admin for unwind
source=(http://download.savannah.gnu.org/releases/$_pkgbasename/$_pkgbasename-$pkgver.tar.gz{,.sig})
md5sums=('eefcb5d7f78fdc8f1ed172a26ea4202f'
         'SKIP')
sha512sums=('985d0817944e3cafd99aaa5642862d878972e0851f7954289247e808c9319f399ca29342395f0571cb6568a1104a82bd92d585936f2ca888dda37ac796fde0d4'
            'SKIP')

build() {
  cd $_pkgbasename-$pkgver
  
  export CC="gcc -m32"
  export CXX="g++ -m32"
  
  ./configure \
    --build=i686-pc-linux-gnu \
    --host=i686-pc-linux-gnu \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --disable-documentation 
    # man pages are already included in libunwind package
  make

}

check() {
  cd "$srcdir/$_pkgbasename-$pkgver"
  make check || return 0
}

package_lib32-libunwind() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir/" install
  
  # this build only provides multilib binary for x86 on x86_64 , remove all includes for other architectures
  find $pkgdir/usr/include/*.h -not -name "*x86*" -exec rm -f {} \;
}

# vim:set ts=2 sw=2 et:
