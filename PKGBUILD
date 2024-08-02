# Contributor: PkmX <pkmx.tw@gmail.com>

pkgname=spidermonkey-git
_gitname=gecko-dev
pkgver=130.0a1+20240803.1+gd92a07556499
pkgrel=1
pkgdesc="Mozilla's JavaScript engine used in Firefox"
arch=('i686' 'x86_64')
url='https://developer.mozilla.org/en-US/docs/Mozilla/Projects/SpiderMonkey'
license=('MPL-2.0')
depends=('gcc-libs' 'sh' 'zlib')
makedepends=('cargo' 'git' 'python3')
provides=('spidermonkey')
conflicts=('spidermonkey')
source=("$_gitname::git+https://github.com/mozilla/gecko-dev.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  #stolen from firefox-hg
  local version=$(< browser/config/version_display.txt)
  local date=$(date +%Y%m%d) # Without TZ=UTC, to match systemd timer
  local counter=1
  local rev=$(git rev-parse --short HEAD)

  local last_rev=${pkgver##*+g} tmp=${pkgver#*+}
  tmp=${tmp%+*}
  local last_date=${tmp%.*} last_counter=${tmp#*.}
  if [[ $date == $last_date ]]; then
    if [[ $rev == $last_rev ]]; then
      counter=$last_counter
    else
      counter=$((last_counter + 1))
    fi
  fi

  echo $version+$date.$counter+g$rev
}

build() {
  cd "$_gitname/js/src"
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
