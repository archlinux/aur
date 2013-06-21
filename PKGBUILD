# Contributor: Will Chappell <wtchappell@gmail.com>
# Contributor: denton <e9203.00 gmail com>
pkgname=cope-git
_realname=cope
pkgver=20110901
pkgrel=1
pkgdesc='A colourful wrapper for terminal programs'
url=http://stuff.cytzol.org/cope/
arch=(any)
license=('GPL' 'PerlArtistic')
depends=("perl>=5.1" 'perl-class-inspector' 'perl-env-path' 'perl-file-sharedir'
         'perl-io-stty' 'perl-io-tty' 'perl-list-moreutils' 'perl-params-util'
         'perl-regexp-common')
makedepends=(git)
install=$pkgname.install

_gitroot=https://github.com/trapd00r/${_realname}.git
_gitname=$_realname

build() {
  cd $srcdir
  
  # Git
  msg 'Connecting to GIT server....'

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull origin
    msg 'The local files are updated.'
  else
    git clone $_gitroot
  fi

  msg 'GIT checkout done or server timeout'
  msg 'Starting make...'

  rm -rf $srcdir/$_gitname-build
  git clone $srcdir/$_gitname $srcdir/$_gitname-build
  cd $srcdir/$_gitname-build

  # Make
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR=$pkgdir || return 1

  # Install the 'cope_path' command for use in bash startup scripts.
  mkdir -p $pkgdir/usr/bin
  install -C cope_path.pl $pkgdir/usr/bin/cope_path

  # Clean
  find $pkgdir -name perllocal.pod -delete
  find $pkgdir -name .packlist -delete
}
