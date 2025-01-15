# Maintainer: Gesh <gesh@gesh.uni.cx>
# based on pandoc-sile-git, by
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

shopt -s extglob

pkgname=pandoc-static-git
# convention: _^{n+1}pkgname is the vanilla pkgname, n renamings ago
_pkgname="${pkgname%-static-git}-cli"
__pkgname="${_pkgname%-cli}"
pkgver=3.6.2.r5.g96d4f5be5
pkgrel=2
pkgdesc='Conversion between markup formats (static build, dynamic Lua support)'
arch=('i686' 'x86_64')
url='https://pandoc.org'
license=('GPL-2.0-or-later')
provides=(
    "$_pkgname=${pkgver%%*([a-z]).r*}"
    "$__pkgname=${pkgver%%*([a-z]).r*}"
)
conflicts=("$_pkgname" "$__pkgname")
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
  stack config set resolver lts-22.22 # ghc-9.6.5
}

build() {
  cd "$pkgname"

  stack build \
      --install-ghc \
      --ghc-options='-fdiagnostics-color=always' \
      --flag 'pandoc:embed_data_files' \
        --fast
}

check() {
  cd "$pkgname"
  stack test
}

package() {
  cd "$pkgname"
  find ./ -path '*/dist/*' -type f -name pandoc -perm /u+x \
      -execdir install -Dm755 -t "$pkgdir/usr/bin/" {} \;
  install -Dm644 pandoc-cli/man/pandoc.1 \
      "$pkgdir"/usr/share/man/man1/pandoc.1
}

# vim:set ts=2 sw=2 et
