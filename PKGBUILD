# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dominik Picheta <morfeusz8@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: Zion Nimchuk <zionnimchuk@gmail.com>

pkgbase=nim-git
pkgname=('nim-git' 'nimble-git' 'nimsuggest-git')
pkgver=20170124
pkgrel=1
arch=('i686' 'x86_64')
groups=('nim')
makedepends=('git' 'texlive-bin' 'texlive-core' 'texlive-fontsextra')
source=(git+https://github.com/nim-lang/Nim
        git+https://github.com/nim-lang/csources
        git+https://github.com/nim-lang/nimble
        git+https://github.com/nim-lang/nimsuggest)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/Nim"
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd "$srcdir/Nim"

  msg2 'Cloning csources...'
  git clone --local "$srcdir/csources"
}

build() {
  cd "$srcdir/Nim"

  msg2 'Building csources...'
  pushd csources
  sh build.sh
  popd

  msg2 'Building Nim...'
  ./bin/nim c -d:release koch
  ./koch boot -d:release -d:nativeStacktrace -d:useGnuReadline

  msg2 'Building Nim PDF documentation...'
  ./koch pdf

  msg2 'Building Nimble...'
  ./koch nimble

  msg2 'Building nimgrep and nimsuggest...'
  ./koch tools

  msg2 'Building libnimrtl...'
  pushd lib
  ../bin/nim c --app:lib -d:createNimRtl -d:release nimrtl.nim
  popd
}

package_nim-git() {
  pkgdesc="Compiled, garbage-collected systems programming language which has an excellent productivity/performance ratio"
  url="https://github.com/nim-lang/Nim"
  license=('MIT')
  options=('!emptydirs')
  provides=('nim')
  conflicts=('nim')

  cd "$srcdir/Nim"

  msg2 'Installing Nim license...'
  install -Dm 644 "copying.txt" -t "$pkgdir/usr/share/licenses/nim"

  msg2 'Installing Nim documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/nim"
  cp -dpr --no-preserve=ownership examples web doc/* "$pkgdir/usr/share/doc/nim"

  msg2 'Installing Nim...'
  ./koch install "$pkgdir"
  install -Dm 755 bin/{nim,nimgrep} -t "$pkgdir/usr/bin"

  cd "$pkgdir/nim"
  install -dm 755 "$pkgdir/etc" "$pkgdir/usr/lib/nim"
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/usr/lib/nim" \;
  find config -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' "$pkgdir/etc/" \;
  cp -dpr --no-preserve=ownership "$srcdir/Nim/lib/packages" \
    "$pkgdir/usr/lib/nim"

  # https://bugs.archlinux.org/task/50252
  msg2 'Fixing unusual placement of header files...'
  install -dm 755 "$pkgdir/usr/include"
  for _header in cycle nimbase; do
    ln -s "/usr/lib/nim/${_header}.h" "$pkgdir/usr/include/${_header}.h"
  done

  msg2 'Fixing unusual placement of shared object files...'
  ln -s "/usr/lib/nim/libnimrtl.so" "$pkgdir/usr/lib/libnimrtl.so"

  msg2 'Cleaning up pkgdir...'
  rm -rf "$pkgdir/nim"
}

package_nimble-git() {
  pkgdesc="Package manager for the Nim programming language"
  url="https://github.com/nim-lang/nimble"
  license=('BSD')
  provides=('nimble')
  conflicts=('nimble')

  cd "$srcdir/nimble"

  msg2 'Installing Nimble license...'
  install -Dm 644 license.txt -t "$pkgdir/usr/share/licenses/nimble"

  msg2 'Installing Nimble documentation...'
  install -Dm 644 *.markdown -t "$pkgdir/usr/share/doc/nimble"

  msg2 'Installing Nimble...'
  install -Dm 755 "$srcdir/Nim/bin/nimble" -t "$pkgdir/usr/bin"

  # Nimble looks for nimscriptapi.nim in /usr/bin/nimblepkg/, of all places.
  install -dm 755 "$pkgdir/usr/share/nimble"
  cp -dpr --no-preserve=ownership src/nimblepkg "$pkgdir/usr/share/nimble"
  ln -s "/usr/share/nimble" "$pkgdir/usr/bin/nimblepkg"

  msg2 'Installing Nimble bash completion...'
  install -Dm 644 nimble.bash-completion \
    "$pkgdir/usr/share/bash-completion/completions/nimble"
}

package_nimsuggest-git() {
  pkgdesc="Tool for providing auto completion data for Nim source code"
  url="https://github.com/nim-lang/nimsuggest"
  license=('MIT')
  provides=('nimsuggest')
  conflicts=('nimsuggest')

  cd "$srcdir/nimsuggest"

  msg2 'Installing Nimsuggest license...'
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/nimsuggest"

  msg2 'Installing Nimsuggest documentation...'
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/nimsuggest"

  msg2 'Installing Nimsuggest...'
  install -Dm 755 "$srcdir/Nim/bin/nimsuggest" -t "$pkgdir/usr/bin"
}
