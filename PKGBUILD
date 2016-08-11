# Maintainer: PkmX <pkmx.tw@gmail.com>

pkgname=spidermonkey-git
_gitname=gecko-dev
pkgver=51.0a1.r45e888f
pkgrel=1
pkgdesc="Mozilla's JavaScript engine used in Firefox"
arch=('i686' 'x86_64')
url='https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey'
license=('MPL')
depends=('zlib')
makedepends=('git' 'clang' 'autoconf2.13' 'python2')
provides=('spidermonkey')
conflicts=('spidermonkey')
source=("$_gitname::git+https://github.com/mozilla/gecko-dev.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf '%s.r%s' $(python2 python/mozbuild/mozbuild/milestone.py --topsrcdir .) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname/js/src"
  autoconf-2.13
  mkdir -p build_OPT.OBJ
  cd build_OPT.OBJ
  # configure fails with hardened clang, reset CPPFLAGS
  CC=clang CXX=clang++ CPPFLAGS= ../configure --prefix=/usr
  make
}

package() {
  cd "$_gitname/js/src/build_OPT.OBJ"
  make DESTDIR="$pkgdir" install
  # Resolve symlinks so they don't point to $srcdir
  for l in $(find "$pkgdir/usr/include/" -type l); do
    cp --remove-destination $(readlink $l) $l
  done
  install -D ../../../LICENSE "$pkgdir/usr/share/licenses/spidermonkey-git/LICENSE"
}

# vim:set ts=2 sw=2 et:
