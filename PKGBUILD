# Maintainer: Ordoban <dirk.langer@vvovgonik.de>
# Contributor: Abhishek Dasgupta <abhidg@gmail.com>
# Contributor: damir <damir@archlinux.org>

pkgname=bioperl-live-git
_pkgname=bioperl-live
pkgver=20161203
pkgrel=1
pkgdesc='Perl modules for bioinformatics applications.'
arch=('any')
license=('GPL' 'PerlArtistic')
url='http://www.bioperl.org'
depends=('perl' 'perl-io-string')
makedepends=('perl-data-stag' 'git')
options=('!emptydirs')

_gitroot=git://github.com/bioperl/bioperl-live.git
_gitname=bioperl-live

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

  # remove .pl extensions from binaries
  cd "$pkgdir/usr/bin"
  for b in *; do
    mv $b $(basename $b .pl)
    if [ -e "$pkgdir/usr/share/man/man1/$b.1p" ]; then
      mv "$pkgdir/usr/share/man/man1/$b.1p" "$pkgdir/usr/share/man/man1/$(basename $b .pl).1p"
    fi
  done

  # remove perllocal.pod and .packlist
  find "$pkgdir" -name 'perllocal.pod' -delete
  find "$pkgdir" -name '.packlist' -delete
}
