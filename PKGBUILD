# Maintainer: Gesh <gesh@gesh.uni.cx>
# based on pandoc-sile-git, by
# Contributor: Caleb Maclennan <caleb@alerque.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Arch Haskell Team <arch-haskell@haskell.org>

shopt -s extglob

pkgname=pandoc-static-git
_pkgname_old=(pandoc-cli pandoc)
pkgver=3.10.2.r14.g0ce83fb13
pkgrel=1
pkgdesc='Conversion between markup formats (static build, dynamic Lua support)'
arch=('i686' 'x86_64')
url='https://pandoc.org'
license=('GPL-2.0-or-later')
provides=("${_pkgname_old[@]/%/=${pkgver%%*([a-z]).r*}}")
conflicts=("${_pkgname_old[@]}")
depends=('gmp' 'zlib')
makedepends=('git' 'cabal-install' 'ghc' 'curl')
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

  rts=$(date +%s --date="$(curl -I http://hackage.haskell.org/01-index.tar |
    awk -F': ' '$1 == "Last-modified" { print $2 }')")
  lts=$(TZ=UTC date +@%s --date='today 00:00')
  ts=$(printf '%s\n' "$rts" "$lts" | sort -n | head -n1)
  cabal update hackage.haskell.org,$ts
  cabal configure --prefix=/usr --docdir=/usr/share/doc/"$pkgname" \
    --enable-tests --flag embed_data_files
  cabal build --only-dependencies
}

build() {
  cd "$pkgname"

  cabal build --offline
  cabal run -v0 pandoc-cli -- --bash-completion > pandoc.bash
}

check() {
  cd "$pkgname"
  cabal test
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/usr/bin"
  cabal install pandoc-cli --install-method=copy --installdir "$pkgdir/usr/bin"
  env -C "$pkgdir/usr/bin" ln -s pandoc pandoc-lua
  env -C "$pkgdir/usr/bin" ln -s pandoc pandoc-server
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 pandoc-cli/man/pandoc*.1 -t "$pkgdir"/usr/share/man/man1/
  _install_completion_script bash bash-completion/completions/pandoc
  _install_completion_script zsh zsh/site-functions/_pandoc
  _install_completion_script fish fish/vendor_completions.d/pandoc.fish
}

_install_completion_script() {
  install -Dm644 \
    <("$pkgdir/usr/bin/pandoc" --completion=$1) \
    "$pkgdir/usr/share/$2"
}

# vim:set ts=2 sw=2 et
