# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=ncbi-toolkit
pkgver=21.0.0
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="Applications, scripts and C++ libraries for the analysis of biological data"
arch=('i686' 'x86_64')
url="https://ncbi.github.io/cxx-toolkit/"
license=('custom')
depends=('python2' 'pcre' 'sqlite' 'lzo' 'libtiff' 'giflib' 'libxpm' 'libmariadbclient' 'libpng' 'gnutls' 'libxml2' 'libxslt')
optdepends=('fltk' 'wxgtk' 'fcgi')
makedepends=('autoconf')
provides=('blast+-bin')
conflicts=('blast+-bin')
source=("ftp://ftp.ncbi.nlm.nih.gov/toolbox/ncbi_tools++/ARCHIVE/2018/Apr_2_2018/ncbi_cxx--$_pkgver.tar.gz" "LICENSE")
sha256sums=('48cc3ae24ca63d1ab1be148e7525e8c5b9f4eaa5eb36d172800784b640a84a4f'
            '78bbf3f310ff43f1b5f711e7221d51da1e6f055831bd6c6941e0650bf1261df2')

build() {
  # for details see https://ncbi.github.io/cxx-toolkit/pages/ch_config#ch_config.UNIX
  FLAGS="--without-debug --with-bin-release --with-dll --without-static \
    --with-optimization --with-autodep --with-mt --prefix=/usr \
    --with-build-root=$srcdir/build --without-bdb --without-internal"
  if [ $CARCH = "x86_64" ]; then
    FLAGS="$FLAGS --with-64"
  fi

  cd "$srcdir/ncbi_cxx--$_pkgver"
  rm -f "$srcdir"/build/inc/ncbiconf_unix.h # in case of previous build
  ./configure $FLAGS
  make
}

package() {
  cd "$srcdir/ncbi_cxx--$_pkgver"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
  make prefix="$pkgdir"/usr libdir="$pkgdir"/usr/lib install
  find "$pkgdir"/usr/bin -name "*test*" -delete
}
