# Maintainer: Michael Schubert <mschu.dev at gmail>

pkgname=autodock-vina
pkgver=1.1.2
_pkgver=${pkgver//./_}
pkgrel=2
arch=('i686' 'x86_64')
license=('Apache 2.0')
pkgdesc="A tool for drug discovery, molecular docking and virtual screening"
url="http://vina.scripps.edu/"
depends=('boost-libs')
makedepends=('boost')
source=("http://vina.scripps.edu/download/autodock_vina_$_pkgver.tgz")
md5sums=('b467b71ee77dd155b65b1c5364e4220f')

build() {
  cd "$srcdir/autodock_vina_$_pkgver"
  find src -name "*.cpp" -exec sed -i \
    "s/.native_file_string()/.string()/g;s/, boost::filesystem::native//" {} \;
  sed -i 's:${BOOST_LIB_VERSION}::g' build/makefile_common
   
  cd "build/linux/release"
  sed -i "s:/local::g;s:-static::g" Makefile
  make
}

package() {
  cd "$srcdir/autodock_vina_$_pkgver/build/linux/release"

  install -Dm755 vina "$pkgdir/usr/bin/vina"
  install -Dm755 vina_split "$pkgdir/usr/bin/vina_split"
}

