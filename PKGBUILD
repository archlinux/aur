# Maintainer: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# vim:set ts=2 sw=2 et ft=sh tw=100: expandtab

_author=F/FA/FAYLAND
_perlmod=Padre-Plugin-ViewInBrowser
pkgname=perl-padre-plugin-viewinbrowser
pkgver=0.07
pkgrel=2
pkgdesc='Padre::Plugin::ViewInBrowser - view selected doc in default browser for Padre'
arch=('any')
url="http://search.cpan.org/~fayland/Padre-Plugin-ViewInBrowser/"
license=('GPL' 'PerlArtistic')
groups=()
depends=(
perl-padre
)
makedepends=(perl)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://search.cpan.org/CPAN/authors/id/$_author/$_perlmod-$pkgver.tar.gz")
noextract=()

build(){
  cd "$srcdir/$_perlmod-$pkgver"
  _padre_version=$(LC_ALL=C pacman -Qi perl-padre 2>/dev/null | grep '^Version' | awk '{print $3}' | cut -d- -f1)
  if [ -z "$_padre_version" ]; then
    _padre_version=0.96
  fi
  sed -e "s/0.26/$_padre_version/" -i lib/Padre/Plugin/ViewInBrowser.pm

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}
check(){
  cd "$srcdir/$_perlmod-$pkgver"
  make test
}
package(){
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
md5sums=('e8509f979f94712ecfec702bce2c1e96')
