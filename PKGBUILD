# Maintainer: Dmitri Kourennyi <dkour at mykolab dot com>
# Contributor: Eric Schulte <[firstname] dot [lastname] at gmx dot com>
pkgname=feedgnuplot
pkgver=1.62
pkgrel=2
pkgdesc="Tool to plot realtime and stored data from the commandline, using gnuplot."
arch=('any')
url="https://github.com/dkogan/feedgnuplot"
license=('GPL')
depends=('perl' 'gnuplot' 'perl-list-moreutils' 'perl-string-shellquote')
provides=('feedgnuplot')
source=("https://github.com/dkogan/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=("3bbc5c45aa23437c952daf669f312505af89f18144cd6318369de45058898b863ac9e1cfd82f9f4695b5c608f1416b7ab97b51db836d3b08b85cbbff85d29269")

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
