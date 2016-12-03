# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dominik Picheta <morfeusz8@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>

pkgname=nim-git
pkgver=20161201
pkgrel=1
pkgdesc="Compiled, garbage-collected systems programming language which has an excellent productivity/performance ratio"
arch=('i686' 'x86_64')
makedepends=('git' 'texlive-bin' 'texlive-core')
groups=('nim')
url="https://github.com/nim-lang/Nim"
license=('MIT')
options=('!emptydirs')
source=(${pkgname%-git}::git+https://github.com/nim-lang/Nim
        git+https://github.com/nim-lang/csources)
sha256sums=('SKIP' 'SKIP')
provides=('nim')
conflicts=('nim')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Copying csources...'
  git clone --local "$srcdir/csources"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building csources...'
  pushd csources
  sh build.sh
  popd

  msg2 'Building...'
  ./bin/nim c koch
  ./koch boot -d:release -d:useGnuReadline

  msg2 'Building PDF documentation...'
  ./koch pdf

  msg2 'Building libnimrtl...'
  pushd lib
  ../bin/nim c --app:lib -d:createNimRtl -d:release nimrtl.nim
  popd

  msg2 'Building nimgrep...'
  cd tools
  ../bin/nim c -d:release nimgrep.nim
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  ./koch install "$pkgdir"

  install -dm 755 \
    "$pkgdir/etc" \
    "$pkgdir/usr/bin" \
    "$pkgdir/usr/lib/nim" \
    "$pkgdir/usr/share/doc/nim"

  cd "$pkgdir/nim"
  mv lib/* "$pkgdir/usr/lib/nim/"
  mv config/* "$pkgdir/etc/"
  cp -dpr --no-preserve=ownership "$srcdir/${pkgname%-git}/lib/packages" \
    "$pkgdir/usr/lib/nim/"
  mv bin/* "$pkgdir/usr/bin/"

  cd "$srcdir/${pkgname%-git}"

  msg2 'Installing license...'
  install -Dm 644 copying.txt -t "$pkgdir/usr/share/licenses/nim"

  msg2 'Installing documentation...'
  rm -rf "$pkgdir/nim"
  mv examples web "$pkgdir/usr/share/doc/nim"
  mv doc/* "$pkgdir/usr/share/doc/nim"

  msg2 'Installing libnimrtl...'
  install -Dm 644 lib/libnimrtl.so -t "$pkgdir/usr/lib"

  msg2 'Installing nimgrep...'
  install -Dm 755 tools/nimgrep -t "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
