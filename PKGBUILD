# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=jellyfish-pythonbound
pkgver=2.3.0
pkgrel=2
pkgdesc="A tool for fast, memory-efficient counting of k-mers in DNA"
arch=('i686' 'x86_64')
url="https://github.com/gmarcais/Jellyfish"
license=('GPL3')
depends=('gcc-libs' 'swig' 'python' 'htslib')
checkdepends=('time')
makedepends=('autoconf' 'yaggo')
provides=('jellyfish')
source=(git+https://github.com/gmarcais/Jellyfish.git#commit=32d0cbaefb
)
sha256sums=('SKIP')


build() {
  cd "${srcdir}"/"Jellyfish"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  autoupdate
  autoreconf -i
  ./configure --prefix=/usr  --enable-ruby-binding \
     --enable-python-binding --enable-perl-binding \
     --enable-swig \
     --disable-rpath
   make
}


package() {
  cd "${srcdir}"/"Jellyfish"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make  DESTDIR=$pkgdir install
  _perl_vendor=$(perl -V:vendorarch | cut -d"'" -f2 )
  _perl_version=$(perl -v | grep -oE "v([0-9.]+)" |grep -oE "[0-9.]+")
  mkdir -p ${pkgdir}${_perl_vendor}
  cd ${pkgdir}/usr/lib/perl/${_perl_version}
  mv * ${pkgdir}${_perl_vendor}
  rm -rf ${pkgdir}/usr/lib/perl/
}
