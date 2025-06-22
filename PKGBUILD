# Maintainer: Matthew Tran <0e4ef622 at gmail.com>
# Contributor: Pavel Pletenev <cpp.create at gmail dot com>
pkgname=vnlog
pkgver=1.40
pkgrel=1
pkgdesc="Tools to manipulate whitespace-separated ASCII logs"
arch=('x86_64')
url="https://github.com/dkogan/vnlog"
license=('LGPL-2.1-or-later')
depends=('perl'
         'glibc'
         'mawk'
         'perl-text-table'
         'perl-list-moreutils')
makedepends=('mrbuild' 'make')
optdepends=('python' 'python-numpy')
provides=('vnlog')
source=("https://github.com/dkogan/vnlog/archive/v${pkgver}.tar.gz")
sha256sums=('86d85f35ec0c71ad099d0cb01621ba9969b0709419c65b65057cd2194f9be613')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  make all doc
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
  mkdir "$pkgdir/usr/share/perl5/vendor_perl"
  mv "$pkgdir/usr/share/perl5/Vnlog" "$pkgdir/usr/share/perl5/vendor_perl"

  install -Dm644 README.org "$pkgdir/usr/share/doc/vnlog/README.org"
  install -Dm644 Changes "$pkgdir/usr/share/doc/vnlog/Changes"

  mkdir -p "$pkgdir/usr/share/zsh/site-functions"
  mkdir -p "$pkgdir/usr/share/bash-completion/completions"
  cp completions/zsh/* "$pkgdir/usr/share/zsh/site-functions"
  cp completions/bash/* "$pkgdir/usr/share/bash-completion/completions"
}
