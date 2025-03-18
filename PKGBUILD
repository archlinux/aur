# Maintainer: Gesh <gesh@gesh.uni.cx>
# based on pandoc-sile-git, by
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

shopt -s extglob

pkgname=pandoc-static-git
_pkgname_old=(pandoc-cli pandoc)
pkgver=3.6.2.r6.gba04a9987
pkgrel=1
pkgdesc='Conversion between markup formats (static build, dynamic Lua support)'
arch=('i686' 'x86_64')
url='https://pandoc.org'
license=('GPL-2.0-or-later')
provides=("${_pkgname_old[@]/%/=${pkgver%%*([a-z]).r*}}")
conflicts=("${_pkgname_old[@]}")
depends=('gmp' 'zlib')
makedepends=('git' 'stack')
optdepends=('texlive-core: for pdf output')
_url=https://github.com/jgm/pandoc
source=("$pkgname::git+$_url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long --match 'pandoc-cli-*' \
    | sed 's/^pandoc-cli-//;s/^v//' \
    | awk -F- \
    'BEGIN { OFS="" }
    {
        revcount=$(NF-1)
        sha=$NF
        NF=(NF-2)
        printf "%s.r%s.%s\n", $0, revcount, sha
    }'
}

prepare() {
  cd "$pkgname"
  stack config set resolver lts-23.1 # ghc-9.8.4
}

build() {
  cd "$pkgname"

  stack build \
      --install-ghc \
      --ghc-options='-fdiagnostics-color=always' \
      --flag 'pandoc:embed_data_files' \
        --fast
  stack run -- --bash-completion > pandoc.bash
}

check() {
  cd "$pkgname"
  stack test
}

package() {
  cd "$pkgname"
  stack install --verbose --local-bin-path "$pkgdir/usr/bin"
  install -Dm644 pandoc-cli/man/pandoc.1 \
      "$pkgdir"/usr/share/man/man1/pandoc.1
  install -Dm644 pandoc.bash \
      "$pkgdir"/usr/share/bash-completion/completions/pandoc
}

# vim:set ts=2 sw=2 et
