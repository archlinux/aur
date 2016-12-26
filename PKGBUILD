# Maintainer: Michael DeGuzis 
# <mdeguzis@gmail.com> Git package 
# to stay up to date always If 
# there is not update to the AUR 
# package, remember to pass --devel 
# to your AUR helper (common flag).

pkgname=devscripts-git 
_gitname=devscripts 
pkgver=2.16.13.r2.gbce34b8d 
pkgrel=1 pkgdesc="Scripts to make the life of a Debian Package maintainer easier (git-latest)" 
arch=('any') 
url="https://anonscm.debian.org/git/collab-maint/devscripts.git" 
license=('GPL2')
depends=('dpkg' 'wget' 'sed' 'perl' 'debianutils' 
	 'debhelper' 'perl-timedate') 
optdepends=('sensible-utils: for sensible alternative selection') 
makedepends=('git' 'po4a' 'perl-timedate' 'perl-libwww' 'docbook-xsl' 
	     'perl-file-desktopentry' 'perl-file-basedir' 'perl-git-wrapper' 
	     'perl-list-compare' 'perl-parse-debcontrol' 'python-setuptools') 
conflicts=('devscripts') 
provides=('devscripts') 
options=('!makeflags') 
source=('git+https://anonscm.debian.org/git/collab-maint/devscripts.git'
	'fixes.patch') 
install='devscripts-git.install' 
md5sums=('SKIP'
         '110857b0eb4a9dbf57a8b562d992ab33') 

pkgver() {

  cd "$_gitname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'

}

build() {

  cd $srcdir/$_gitname
  patch -p0 -i ../fixes.patch
  make

}

package() {

  mkdir -p $pkgdir/etc/bash_completion.d
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/lib/devscripts
  mkdir -p $pkgdir/usr/share/devscripts

  cd $srcdir/$_gitname
  make DESTDIR=$pkgdir install

  # remove conflicting file provided by bash-completion in the community repo
  msg "Removing conflicting file already provided by package 'bash-completion'"
  rm -v $pkgdir/usr/share/bash-completion/completions/bts

}
