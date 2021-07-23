# Maintainer: Dmitri Kourennyi <dkour at mykolab dot com>
# Contributor: Eric Schulte <[firstname] dot [lastname] at gmx dot com>
pkgname=feedgnuplot
pkgver=1.59
pkgrel=1
pkgdesc="Tool to plot realtime and stored data from the commandline, using gnuplot."
arch=('any')
url="https://github.com/dkogan/feedgnuplot"
license=('GPL')
depends=('perl' 'gnuplot' 'perl-list-moreutils' 'perl-string-shellquote')
provides=('feedgnuplot')
source=("https://github.com/dkogan/feedgnuplot/archive/v${pkgver}.tar.gz")
b2sums=("54d7b0e570af22a5853b21f05de984802302827b675c590612edbbe8449649e01e9d9c14f320fb4f97a1ad6cc957f3e06892e6941b2af15cfd0d48005997ea02")

build() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps

  /usr/bin/perl Makefile.PL
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}" || exit

  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT

  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"

  # Copy shell completions
  install -D --mode=644 --target-directory="$pkgdir/usr/share/bash-completion/completions/" completions/bash/feedgnuplot
  install -D --mode=644 --target-directory="$pkgdir/usr/share/zsh/site-functions/" completions/zsh/_feedgnuplot

  # Copy guide
  install --directory "$pkgdir/usr/share/doc/feedgnuplot"
  cp --recursive guide "$pkgdir/usr/share/doc/feedgnuplot/"

  # Copy License
  install -D --mode=644 --target-directory="$pkgdir/usr/share/licenses/feedgnuplot/" LICENSE
}
