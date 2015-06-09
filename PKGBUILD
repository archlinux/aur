# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=rebol-git
pkgver=r348.22b126b
pkgrel=1
pkgdesc="A cross-platform data exchange language and a multi-paradigm dynamic programming language"
arch=('i686' 'x86_64')
url=http://www.rebol.com/r3/alpha-intro.html
license=('Apache')
groups=('devel')
makedepends=('git')
provides=('rebol')
#_r3_i686_binary_url=http://www.rebol.com/r3/downloads/r3-a111-4-4.tar.gz
if [ "$CARCH" = "x86_64" ]; then
  # lib32-glibc for running the (i686) r3 binary
  # makedepends=(${makedepends[@]} 'lib32-glibc')
  source=('rebol::git+https://github.com/earl/r3.git#branch=64b-for-mainline'
    'r3-make::http://rebolsource.net/downloads/experimental/r3-linux-x64-g22b126b')
  _osid=0.4.40
elif [ "$CARCH" = "i686" ]; then
  source=('rebol::git+https://github.com/rebol/rebol.git'
    'r3-make::http://rebolsource.net/downloads/linux-x86/r3-g25033f8'
  )
  _osid=0.4.4
fi
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir"/rebol
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
#  cd "$startdir"
#  [ ! -f r3 ] && wget $_r3_i686_binary_url -O r3.tgz && tar xvfz r3.tgz
  cd "$srcdir"/rebol/make
  [ ! -x r3-make ] && install -m755 "$srcdir"/r3-make .
  make make OS_ID=$_osid
  make prep 
  make
}

package() {
  cd "$srcdir"/rebol
  install -Dm755 make/r3 "$pkgdir/usr/bin/r3"
}

# vim:set ts=2 sw=2 et:

