# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=texinfo-svn
pkgver=7671
pkgrel=1
pkgdesc="GNU documentation system for on-line information and printed output"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/texinfo/"
license=('GPL')
groups=('base' 'base-devel')
depends=('coreutils')
makedepends=('subversion' 'help2man')
provides=('texinfo')
conflicts=('texinfo')
source=("texinfo::svn://svn.sv.gnu.org/texinfo/trunk"
	texinfo-install.hook
        texinfo-remove.hook)
md5sums=('SKIP'
         '9a98fb162650ff3065f9a4ebec22db36'
         '5590fb3ef9ec309c98f5a4d85eca49da')
options=('!makeflags' 'libtool')
_svnmod=texinfo

pkgver() {
  cd "$srcdir"/"${_svnmod}"
  local ver="$(svnversion)"
  printf "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir"/"${_svnmod}"
  ./autogen.sh 
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
}

package() {
  cd "$srcdir"/"${_svnmod}"
  make DESTDIR="$pkgdir/" install
  install -dm755 "$pkgdir"/usr/share/libalpm/hooks/
  cd "$srcdir"
  install -m644 texinfo-{install,remove}.hook \
	  "$pkgdir"/usr/share/libalpm/hooks/
}
