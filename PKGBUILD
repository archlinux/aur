# Maintainer: Dan Beste  <dan.ray.beste+aur@gmail.com>
# Maintainer: Chengrui Chen <chengruichen3@gmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Dominik Picheta <morfeusz8@gmail.com>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jesus Alvarez <jeezusjr@gmail.com>
# Contributor: Zion Nimchuk <zionnimchuk@gmail.com>

pkgbase='nim-git'
pkgname=('nim-git' 'nimble-git' 'nimsuggest-git' 'nimpretty-git' 'nim-gdb-git')
pkgdesc='Nim is a statically typed compiled systems programming language. It combines successful concepts from mature languages like Python, Ada and Modula. Its design focuses on efficiency, expressiveness, and elegance (in that order of priority).'
epoch=1
pkgver=1.6.8.r1070.9afb466d73
pkgrel=1
arch=('x86_64')
groups=('nim')
backup=(
  'etc/nim/config.nims'
  'etc/nim/nim.cfg'
  'etc/nim/nimdoc.cfg'
  'etc/nim/nimdoc.tex.cfg'
  'etc/nim/rename.rules.cfg'
)
makedepends=('git')
source=(
  'git+https://github.com/nim-lang/Nim'
  'git+https://github.com/nim-lang/csources_v2'
  'git+https://github.com/nim-lang/nimble'
  'makepkg-conf.patch'
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'a70ff09cea18ddf0b13fe732846426a7a0c10e9f4187a62228b3c2e3d091d996')

_tag() {
  # Grab the most recent non-annotated tag:
  git tag | grep -E '^v' | sort | tail -1
}

_revision() {
  # Count revisions made to HEAD since master:
  git rev-list --count $(_tag)..HEAD
}

_commit() {
  # Convert HEAD into a shortened commit id:
  git rev-parse --short HEAD
}

pkgver() {
  cd Nim

  # Suggestions for improvement welcome!
  printf '%s.r%s.%s'         \
    "$(_tag | sed 's/v//g')" \
    "$(_revision)"           \
    "$(_commit)"
}

prepare() {
  cd Nim

  # Upstream "pins" supported commits:
  local -r hash="$(grep 'nim_csourcesHash' config/build_config.txt | grep -Eio '[0-9a-z]{40}')"

  [[ -d ./csources_v2 ]] && rm -rf ./csources_v2

  cp -r "${srcdir}/csources_v2" .

  cd csources_v2

  # Checkout the "pinned" commit:
  git -c advice.detachedHead=false checkout "$hash"

  # Remove hardcoded `-O3` from makefile's COMP_FLAGS:
  patch makefile \
  --strip=1      \
  --fuzz 5       \
  -N             \
  < "${srcdir}/makepkg-conf.patch"
}

build() {
  cd Nim

  /usr/bin/env sh build_all.sh
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
    doc/*                         \
    -t "${pkgdir}/usr/share/doc/nim"

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
  backup=()
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
  backup=()
  pkgdesc='Nimsuggest is a tool that helps to give editors IDE like capabilities.'
  url='https://github.com/nim-lang/nimsuggest'
  license=('MIT')
  provides=('nimsuggest')
  conflicts=('nimsuggest')

  install -Dm 755 'Nim/bin/nimsuggest' -t "${pkgdir}/usr/bin"
}

package_nimpretty-git() {
  backup=()
  pkgdesc='Standard tool for pretty printing.'
  url='https://github.com/nim-lang/Nim/tree/devel/nimpretty'
  license=('MIT')
  provides=('nimpretty')
  conflicts=('nimpretty')

  install -Dm 755 'Nim/bin/nimpretty' -t "${pkgdir}/usr/bin"
}

package_nim-gdb-git() {
  backup=()
  pkgdesc='GDB pretty printing for Nim language.'
  url='https://github.com/nim-lang/Nim'
  license=('MIT')
  depends=('gdb')
  provides=('nim-gdb')
  conflicts=('nimp-gdb')

  install -Dm 755 'Nim/bin/nim-gdb' -t "${pkgdir}/usr/bin"
}

# vim: sw=2 ts=2 et:
