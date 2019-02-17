# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texinfo-git
pkgver=6.6r11.g2ae3ae3e5a
pkgrel=1
pkgdesc="GNU documentation system for on-line information and printed output"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/texinfo/"
license=('GPL')
groups=('base' 'base-devel')
depends=('coreutils')
makedepends=('git' 'help2man')
provides=('texinfo' 'texinfo-js')
conflicts=('texinfo' 'texinfo-js')
source=("$pkgname::git://git.savannah.gnu.org/texinfo.git"
	texinfo-install.hook::https://git.archlinux.org/svntogit/packages.git/plain/trunk/texinfo-install.hook?h=packages/texinfo
	texinfo-remove.hook::https://git.archlinux.org/svntogit/packages.git/plain/trunk/texinfo-remove.hook?h=packages/texinfo)
sha256sums=('SKIP'
            '66ab7eab5ecdd7757081a743f94e6f4d2e783b61db5024344450748bf1bf8eb9'
            '7300f03ac56e32564fb508b0dd07839d2428a422dcf13fd3246863f7ccb1965e')
options=('libtool')

pkgver() {
  cd $pkgname
  git describe --tags | cut -c9- | sed 's+-+r+'|tr - .
}

build() {
  export LANG=C
  cd $pkgname
  ./autogen.sh 
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make
  cd js
  aclocal -I gnulib/m4
  automake --add-missing
  autoreconf -f
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  cd js
  make DESTDIR="$pkgdir/" install
  install -dm755 "$pkgdir"/usr/share/libalpm/hooks/
  cd "$srcdir"
  install -m644 texinfo-{install,remove}.hook \
	  "$pkgdir"/usr/share/libalpm/hooks/
}
