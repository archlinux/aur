# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: amesgen <amesgen AT amesgen DOT de>
# Based on ormolu and ormolu-bin by amesgen

pkgname=ormolu-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.8.0.0.r0.g4369d7c
pkgrel=1
pkgdesc='A formatter for Haskell source code'
arch=('i686' 'x86_64')
url="https://github.com/tweag/${_pkgname}"
license=('BSD-3-Clause')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
depends=('gmp')
makedepends=('git' 'stack' 'yq')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

# TODO: Delete the old version even if it's more complicated than just a hackage
# string
_rmDep() {
    yq -i --yaml-output --arg pkg "$1" \
        "$(cat <<'EOF'
        ."extra-deps"
        |= del(.[] | strings | select(match("^\($pkg)-[0-9.]+")))
EOF
)" stack.yaml
}

_bump() {
    _rmDep "$1"
    yq -i --yaml-output --argjson val "$2" '."extra-deps"+=[$val]' stack.yaml
}

__ver() { jq -cn '"\($pkg)-\($ver)"' --arg pkg "$1" --arg ver "$2"; }
_bumpVer() { _bump "$1" "$(__ver "$@")"; }

pkgver() {
  cd "$pkgname"
  git describe --tags --long \
    | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  stack config set resolver lts-23.1 # ghc-9.8.4

  # Note -- need to bump filepath for ghc-lib-parser
  # and touching a boot package means we need to touch all the others
  _bumpVer directory 1.3.9.0
  _bumpVer filepath  1.5.4.0
  _bumpVer process   1.6.25.0
  _bumpVer unix      2.8.6.0

  yq -i --yaml-output \
      '(.flags |
        (.unix, .directory, ."file-io") |
        ."os-string")
        = true' stack.yaml

  # enable tests
  yq -i --yaml-output \
      '.build."test-arguments"."no-run-tests" = false' stack.yaml
}

build() {
  cd "$pkgname"
  stack build ormolu:exe:ormolu
}

check() {
  cd "$pkgname"
  stack test ormolu:exe:ormolu
}

package() {
  cd "$pkgname"
  stack install ormolu:exe:ormolu --local-bin-path "$pkgdir/usr/bin"
  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"

  _install_completion_script bash bash-completion/completions/ormolu
  _install_completion_script zsh zsh/site-functions/_ormolu
  _install_completion_script fish fish/vendor_completions.d/ormolu.fish
}

_install_completion_script() {
  install -Dm644 \
    <("$pkgdir/usr/bin/ormolu" --$1-completion-script /usr/bin/ormolu) \
    "$pkgdir/usr/share/$2"
}

# vim:set ts=2 sw=2 et
