# Maintainer: Dan Beste  <dan.ray.beste+aur@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dominik Picheta <morfeusz8@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: Zion Nimchuk <zionnimchuk@gmail.com>

pkgbase='nim-git'
pkgname=('nim-git' 'nimble-git' 'nimsuggest-git' 'nimpretty-git')
pkgdesc='Nim is a compiled, garbage-collected systems programming language with a design that focuses on efficiency, expressiveness, and elegance (in that order of priority).'
epoch=1
pkgver=0.18.0.r1444.g276a05e57
pkgrel=2
arch=('i686' 'x86_64')
groups=('nim')
makedepends=('git')
source=(
  'git+https://github.com/nim-lang/Nim'
  'git+https://github.com/nim-lang/Nim.wiki'
  'git+https://github.com/nim-lang/csources'
  'git+https://github.com/nim-lang/nimble'
  'makepkg-conf.patch'
)
sha256sums=(
  'SKIP' 'SKIP' 'SKIP' 'SKIP'
  '9d73290e81a2e2a79f7bb8058d47854d90ba9301dda1bee107294e2d82f631bf'
)

pkgver() {
  cd Nim

  git describe --long --tags           \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
    | sed 's/v//'
}

prepare() {
  cd Nim

  # Prevent the build from failing if it is not cleanbuilt:
  [[ -d ./csources ]] && rm -rf ./csources
  cp -r "${srcdir}/csources" .
  # Remove `-O3` from build.sh's COMP_FLAGS:
  patch ./csources/build.sh \
  --strip=1                 \
  --fuzz 5                  \
  -N                        \
  < "${srcdir}/makepkg-conf.patch"
}

build() {
  cd Nim

  # Build the pre-generated C sources of the Nim compiler which aid in
  # bootstrapping:
  cd csources
    ./build.sh
  cd -

  # Build a release version of the "koch" maintenance program:
  ./bin/nim c -d:release koch
  # Build a release version of the nim compiler:
  ./koch boot -d:release -d:nativeStacktrace
  # Build nimsuggest, nimgrep, and nimpretty:
  ./koch tools

  # Build nimrtl.nim:
  cd lib
    ../bin/nim c --app:lib -d:createNimRtl -d:release nimrtl.nim
  cd -
}

package_nim-git() {
  url="https://nim-lang.org/"
  license=('MIT')
  options=('!emptydirs')
  provides=('nim')
  conflicts=('nim')

  cd Nim

  # License
  install -dm 755 "${pkgdir}/usr/share/licenses/nim"
  install -m 644 "copying.txt" "${pkgdir}/usr/share/licenses/nim/LICENSE"

  # Docs
  install -dm 755 "${pkgdir}/usr/share/doc/nim"
  cp -dpr --no-preserve=ownership \
    examples web doc/*            \
    -t "${pkgdir}/usr/share/doc/nim"

  # Docs: Wiki
  cp -dpr --no-preserve=ownership   \
    "${srcdir}/Nim.wiki"            \
    "${pkgdir}/usr/share/doc/nim/wiki"

  # Nim
  ./koch install "${pkgdir}"
  install -Dm 755 bin/{nim,nimgrep} -t "$pkgdir/usr/bin"

  cd "${pkgdir}/nim"
  install -dm 755 "${pkgdir}"/{etc/nim,usr/lib/nim}
  find lib -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' -t "$pkgdir/usr/lib/nim" \;
  find config -mindepth 1 -maxdepth 1 -exec \
    cp -dpr --no-preserve=ownership '{}' -t "$pkgdir/etc/nim" \;
  cp -dpr --no-preserve=ownership \
    "$srcdir/Nim/lib/packages"    \
    -t "$pkgdir/usr/lib/nim"

  # Workaround Nim's nonstandard header file placement
  # (https://bugs.archlinux.org/task/50252):
  install -dm 755 "${pkgdir}/usr/include"
  for _header in cycle nimbase; do
    ln -s "/usr/lib/nim/${_header}.h" "$pkgdir/usr/include/${_header}.h"
  done

  # Fix unusual placement of shared object files:
  ln -s "/usr/lib/nim/libnimrtl.so" "$pkgdir/usr/lib/libnimrtl.so"

  # Clean up $pkgdir
  rm -rf "$pkgdir/nim"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

package_nimble-git() {
  pkgdesc="Package manager for the Nim programming language"
  url="https://github.com/nim-lang/nimble"
  license=('BSD')
  provides=('nimble')
  conflicts=('nimble')

  cd nimble

  # License
  install -dm 755 "${pkgdir}/usr/share/licenses/nimble"
  install -Dm 644 license.txt "${pkgdir}/usr/share/licenses/nimble/LICENSE"

  # Docs
  install -Dm 644 *.markdown -t "$pkgdir/usr/share/doc/nimble"

  # Nimble
  install -Dm 755 "$srcdir/Nim/bin/nimble" -t "$pkgdir/usr/bin"

  # Nimble looks for nimscriptapi.nim in /usr/bin/nimblepkg/, of all places.
  install -dm 755 "$pkgdir/usr/share/nimble"
  cp -dpr --no-preserve=ownership src/nimblepkg "$pkgdir/usr/share/nimble"
  ln -s "/usr/share/nimble" "$pkgdir/usr/bin/nimblepkg"

  # Bash completion
  install -Dm 644          \
    nimble.bash-completion \
    "${pkgdir}/usr/share/bash-completion/completions/nimble"
}

package_nimsuggest-git() {
  pkgdesc="Nimsuggest is a tool that helps to give editors IDE like capabilities."
  url="https://github.com/nim-lang/nimsuggest"
  license=('MIT')
  provides=('nimsuggest')
  conflicts=('nimsuggest')

  # Nimsuggest
  install -Dm 755 "Nim/bin/nimsuggest" -t "${pkgdir}/usr/bin"
}

package_nimpretty-git() {
  pkgdesc="Standard tool for pretty printing."
  url="https://github.com/nim-lang/Nim/tree/devel/nimpretty"
  license=('MIT')
  provides=('nimpretty')
  conflicts=('nimpretty')

  # Nimpretty
  install -Dm 755 "Nim/bin/nimpretty" -t "${pkgdir}/usr/bin"
}

# vim: sw=2 ts=2 et:
