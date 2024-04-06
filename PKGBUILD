# Maintainer: Gesh <gesh@gesh.uni.cx>
# Contributor: amesgen <amesgen AT amesgen DOT de>
# Based on ghcup-hs-bin by amesgen

pkgname=ghcup-hs-static-git
_pkgname="${pkgname%-static-git}"
pkgver=0.1.22.0.r11.g63e714d
pkgrel=1
pkgdesc='GHC toolchain installer'
arch=('x86_64' 'aarch64' 'armv7h' 'i686')
url="https://www.haskell.org/ghcup/"
license=('LGPL-3.0-only')
makedepends=(git stack)
optdepends=('curl'
            'wget'
            "ncurses5-compat-libs: using older ghc's linking against libtinfo.so.5")
provides=("$_pkgname" "$_pkgname"-bin)
conflicts=("$_pkgname" "$_pkgname"-bin)
source=($pkgname::git+https://github.com/haskell/ghcup-hs)
sha256sums=('SKIP')
install="$_pkgname.install"

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

    _install_completion_script bash bash-completion/completions/ghcup
    _install_completion_script zsh zsh/site-functions/_ghcup
    _install_completion_script fish fish/vendor_completions.d/ghcup.fish
}

_install_completion_script() {
    install -Dm644 \
        <("$pkgdir/usr/bin/ghcup" --$1-completion-script /usr/bin/ghcup) \
        "$pkgdir/usr/share/$2"
}
