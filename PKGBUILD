# Contributor: Will Chappell <wtchappell@gmail.com>
# Contributor: denton <e9203.00 gmail com>
pkgname=cope-git
_pkgname=cope
pkgver=147.64038ce
pkgrel=1
pkgdesc='A colourful wrapper for terminal programs'
url=http://stuff.cytzol.org/cope/
arch=(any)
license=('GPL' 'PerlArtistic')
depends=("perl>=5.1" 'perl-class-inspector' 'perl-env-path' 'perl-file-sharedir'
         'perl-io-stty' 'perl-io-tty' 'perl-list-moreutils' 'perl-params-util'
         'perl-regexp-common')
makedepends=('git')
install=$pkgname.install

source=("$_pkgname::git://github.com/lotrfan/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}


build() {
  cd "${srcdir}/${_pkgname}"

  # Make
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}"

  make install DESTDIR=$pkgdir || return 1

  # Install the 'cope_path' command for use in bash startup scripts.
  mkdir -p $pkgdir/usr/bin
  install -C cope_path.pl $pkgdir/usr/bin/cope_path

  # Clean
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}

