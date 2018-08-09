# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=xde-panel
cpanname=XDE-Panel
pkgver=0.01.7
pkgrel=4
pkgdesc="PerlPanel wrapper for the X Desktop Environment"
groups=('xde')
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('git')
optdepends=('xde-ctools: for XDE provided menus'
	    'xde-menu: for XDE applications menu')
url="https://github.com/bbidulock/xde-panel"
source=("$pkgname::git+https://github.com/bbidulock/xde-panel.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags|sed -e 's,^[a-zA-Z_]*,,;s,-g.*,,;s,-,.,g'
}

build() {
  cd $pkgname
  export -n PERL_MM_OPT PERL5LIB PERL_LOCAL_LIB_ROOT
  PERL_MM_USE_DEFAULT=1 \
  PERL_AUTOINSTALL='--skipdeps' \
  perl Makefile.PL INSTALLDIRS=vendor INSTALLVENDORSCRIPT=/usr/bin
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  find "$pkgdir" -name '.packlist' -o -name '*.pod' -delete
  rm -fr "$pkgdir"/usr/lib
#  find "$pkgdir" -depth -type d -exec rmdir --ignore-fail-on-non-empty '{}' \;
#  find "$pkgdir" -type d -empty -delete
#  find "$pkgdir" -type d -empty |while read f; do echo "WARNING: $f is empty!"; done
}


