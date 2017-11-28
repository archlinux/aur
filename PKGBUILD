# Contributor: jospehgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=fribidi
pkgname=lib32-${_pkgname}
pkgver=0.19.7
pkgrel=2
pkgdesc="A Free Implementation of the Unicode Bidirectional Algorithm (32 bit)"
arch=('x86_64')
license=('LGPL')
url="http://fribidi.org"
depends=('lib32-glib2' "${_pkgname}")
source=("https://github.com/fribidi/fribidi/archive/${pkgver}.tar.gz")
md5sums=('dbe2f2bf3ba0307d75885b21d6cceb2c')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed -i 's|$CONFIGUREFLAGS $DASHDASHFLAGS $EXTRA_CONFIGUREFLAGS|$CONFIGUREFLAGS $EXTRA_CONFIGUREFLAGS|g' bootstrap
}

build() {
export CC='gcc -m32'
# -march=i686'
export CXX='g++ -m32'
# -march=i686'
export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
#export CFLAGS="-march=i386"
  
cd ${_pkgname}-${pkgver}
NOCONFIGURE=1 autoreconf -i
./configure --prefix=/usr --libdir=/usr/lib32
#sed -i 's/host_cpu\=\"\${host\%\%-\*}\"/host_cpu\="i386"/' configure
make
}

package() {
make -C ${_pkgname}-${pkgver} DESTDIR="${pkgdir}" install

# Force putting things in /usr/lib32
cd ${pkgdir}/usr/local/
rm -rf {bin,include,share}
mkdir ${pkgdir}/usr/lib32
mv lib lib32
mv lib32 ../
cd ..
rm -rf local

#Fix the fribidi.pc
cd lib32/pkgconfig
sed -i 's|prefix=/usr/local|prefix=/usr/|g' fribidi.pc
sed -i 's|libdir=${exec_prefix}/lib|libdir=/usr/lib32|g' fribidi.pc

}
