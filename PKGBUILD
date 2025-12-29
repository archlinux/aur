# Maintainer: Dmitri Kourennyi <dkour at mykolab dot com>
# Contributor: Eric Schulte <[firstname] dot [lastname] at gmx dot com>
pkgname=feedgnuplot
pkgver=1.63
pkgrel=1
pkgdesc="Tool to plot realtime and stored data from the commandline, using gnuplot."
arch=('any')
url="https://github.com/dkogan/feedgnuplot"
license=('GPL')
depends=('perl' 'gnuplot' 'perl-list-moreutils' 'perl-string-shellquote')
provides=('feedgnuplot')
source=("https://github.com/dkogan/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=("78f3a4cb14fde2b5a8a380f6a1706b3cd6bd9f3f2f763f6b001b607481e2cbe8456b17f325e2898c9ca8c5c6b4638621950da4dda07bdba308cae1ca0cbaeb2f")

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
