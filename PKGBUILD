# Maintainer: Ordoban <dirk.langer@vvovgonik.de>

pkgname=bioperl-run-git
_pkgname=bioperl-run
pkgver=20161220
pkgrel=1
pkgdesc='Wrapper modules around many common bioinformatics applications and tools.'
arch=('any')
license=('GPL' 'PerlArtistic')
url='http://www.bioperl.org/wiki/Run_package'
depends=('perl' 'perl-io-string' 'bioperl-live-git')
makedepends=('perl-data-stag' 'git')
options=(!emptydirs)

_gitroot='git://github.com/bioperl/bioperl-run.git'
_gitname='bioperl-run'

build() {
  msg 'Getting sources...'
  if [ -d $_gitname ]; then
    cd $_gitname
    git pull origin
  else
    git clone $_gitroot
    cd $_gitname
  fi
  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  # non-interactive, uses defaults
  perl Build.PL < /dev/null

  ./Build
}

package() {
  cd "$srcdir/${_pkgname}"

  ./Build install                                   \
    --install_base /usr                             \
    --install_path lib=/usr/share/perl5/vendor_perl \
    --install_path bindoc=/usr/share/man/man1       \
    --install_path libdoc=/usr/share/man/man3       \
    --destdir "$pkgdir"

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name 'perllocal.pod' -delete
  find "$pkgdir" -name '.packlist' -delete
}
