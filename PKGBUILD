# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: amesgen <amesgen AT amesgen DOT de>
# Based on ormolu and ormolu-bin by amesgen

pkgname=ormolu-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.7.5.0.r0.ga9e996b
pkgrel=1
pkgdesc="A formatter for Haskell source code"
arch=('i686' 'x86_64')
url="https://github.com/tweag/${_pkgname}"
license=('LicenseRef-BSD-3-Clause')
provides=("$_pkgname")
depends=('gmp')
makedepends=('git' 'stack' 'yq')
source=("${pkgname}::git+${url}")
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
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$pkgname"
    stack config set resolver lts-22.22 # ghc-9.6.5

    _bumpVer aeson 2.2.2.0
    _bumpVer character-ps 0.1
    _bumpVer parsec 3.1.17.0
    _bumpVer text 2.1.1
    _bumpVer text-iso8601 0.1.1
}

build() {
    cd "${pkgname}"
    stack build
}

package() {
    cd "${pkgname}"
    stack install --local-bin-path "${pkgdir}/usr/bin"
    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

    _install_completion_script bash bash-completion/completions/ormolu
    _install_completion_script zsh zsh/site-functions/_ormolu
    _install_completion_script fish fish/vendor_completions.d/ormolu.fish
}

_install_completion_script() {
    install -Dm644 \
        <("$pkgdir/usr/bin/ormolu" --$1-completion-script /usr/bin/ormolu) \
        "$pkgdir/usr/share/$2"
}
