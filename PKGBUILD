# Maintainer: Dmitri Kourennyi <dkour at mykolab dot com>
# Contributor: Eric Schulte <[firstname] dot [lastname] at gmx dot com>
pkgname=feedgnuplot
pkgver=1.64
pkgrel=1
pkgdesc="Tool to plot realtime and stored data from the commandline, using gnuplot."
arch=('any')
url="https://github.com/dkogan/feedgnuplot"
license=('GPL')
depends=('perl' 'gnuplot' 'perl-list-moreutils' 'perl-string-shellquote')
provides=('feedgnuplot')
source=("https://github.com/dkogan/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=("69eecb8191880da96046d982ec0a96c82da940363c15ffe840fea8b7a11255ca685cf1140f2e3030069c90ea67f08822c3095408f0e10fe83796756eeab224a2")

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
