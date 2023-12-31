# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: amesgen <amesgen AT amesgen DOT de>
# Based on ormolu and ormolu-bin by amesgen

pkgname=ormolu-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.7.3.0.r6.g05647fd
pkgrel=1
pkgdesc="A formatter for Haskell source code"
arch=('i686' 'x86_64')
url="https://github.com/tweag/${_pkgname}"
license=('custom')
provides=("$_pkgname")
depends=('gmp')
makedepends=('stack')
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
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
