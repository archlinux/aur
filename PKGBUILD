# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: Mick Elliot <micke at sfu dot ca>

pkgname=ncbi-toolkit
pkgver=9.0.0
_pkgver=${pkgver//./_}
pkgrel=1
pkgdesc="Applications, scripts and C++ libraries for the analysis of biological data"
arch=('i686' 'x86_64')
url="http://www.ncbi.nlm.nih.gov/books/NBK7160/"
license=('custom')
depends=('python2' 'pcre' 'sqlite' 'lzo2' 'libtiff' 'giflib' 'libxpm' 'libmysqlclient' 'libpng' 'gnutls' 'libxml2' 'libxslt')
optdepends=('fltk' 'wxgtk' 'db48' 'fcgi')
makedepends=('autoconf')
provides=('blast+-bin')
conflicts=('blast+-bin')
source=("ftp://ftp.ncbi.nlm.nih.gov/toolbox/ncbi_tools++/ARCHIVE/$_pkgver/ncbi_cxx--$_pkgver.tar.gz" "LICENSE")
md5sums=('46cbd232e024690ae617d1c44f3380b4'
         '344b3873e649094cf2dbaac7b55cafbc')

build()
{
  # for details see http://www.ncbi.nlm.nih.gov/books/NBK7167/#ch_config.Configuring_with_UNI
  # flags that do not work: --with-dll --with-bdb
  FLAGS="--without-debug --with-bin-release --with-bincopy --with-static \
    --with-optimization --with-autodep --with-mt --prefix=$pkgdir/usr \
    --libdir=$pkgdir/usr/lib --with-build-root=$srcdir/build \
    --without-bdb --without-internal --with-optimization"
  if [ $CARCH = "x86_64" ]; then
    FLAGS="$FLAGS --with-64"
  fi

  cd "$srcdir/ncbi_cxx--$_pkgver"
  ./configure $FLAGS

  find src/sra/sdk -name "*.c" -exec sed -i "/curl\/types.h/d" {} \;

  make
}

package() {
  cd "$srcdir/ncbi_cxx--$_pkgver"

  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/license"
  mv "$srcdir/build/lib/ncbi" "$pkgdir/usr/lib/" # make install error otherwise
  make install
}

