# Maintainer: Matthew Tran <0e4ef622 at gmail.com>
# Contributor: Pavel Pletenev <cpp.create at gmail dot com>
pkgname=vnlog
pkgver=1.36
pkgrel=3
pkgdesc="Tools to manipulate whitespace-separated ASCII logs"
arch=('x86_64')
url="https://github.com/dkogan/vnlog"
license=('LGPL-2.1-or-later')
depends=('perl' 'python' 'glibc')
makedepends=('mrbuild' 'make')
optdepends=('python-numpy')
provides=('vnlog')
source=("https://github.com/dkogan/vnlog/archive/v${pkgver}.tar.gz")
sha256sums=('7adb33443b8b21a8fa733c98700c55086f8b8d7fa9a6e0decef605fe4d82edb8')

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
