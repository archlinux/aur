# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=texinfo-git
pkgver=6.7.r9202
pkgrel=1
epoch=1
pkgdesc="GNU documentation system for on-line information and printed output"
arch=('i686' 'x86_64')
url="http://www.gnu.org/software/texinfo/"
license=('GPL')
groups=('base' 'base-devel')
depends=('coreutils')
makedepends=('git' 'help2man')
provides=('texinfo' 'texinfo-js')
conflicts=('texinfo' 'texinfo-js')
source=("$pkgname::git://git.savannah.gnu.org/texinfo.git" "git://git.sv.gnu.org/gnulib"
	texinfo-install.hook::https://git.archlinux.org/svntogit/packages.git/plain/trunk/texinfo-install.hook?h=packages/texinfo
	texinfo-remove.hook::https://git.archlinux.org/svntogit/packages.git/plain/trunk/texinfo-remove.hook?h=packages/texinfo)
sha256sums=('SKIP'
            'SKIP'
            '66ab7eab5ecdd7757081a743f94e6f4d2e783b61db5024344450748bf1bf8eb9'
            '7300f03ac56e32564fb508b0dd07839d2428a422dcf13fd3246863f7ccb1965e')
options=('libtool')

pkgver() {
  cd $pkgname
  printf "%s.r%s" \
    $(awk -F\[ '/AC_INIT/ {print $3}' configure.ac |cut -c 1-3) $(git rev-list --count HEAD)
}

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.gnulib.url gnulib
  git submodule update
 # cp "$srcdir"/gnulib/lib/windows-mutex.c gnulib/lib
}

build() {
  cd $pkgname
  ./autogen.sh || true
  sed -i '5904,5916d' configure
  ./configure --prefix=/usr --libexecdir=/usr/lib
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
