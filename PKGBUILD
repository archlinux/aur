# Maintainer: Xuanrui QI <me@xuanruiqi.com>

# This PKGBUILD is forked off the PKGBUILD for rustup, which is 
# the work of:
# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
# Contributor: Jonathon Fernyhough <jonathon_at_manjaro_dot_org>
# Contributor: Jon Gjengset <jon@tsp.io>
_pkgname=elan
pkgname=${_pkgname}-lean
pkgver=1.4.5
pkgrel=2
pkgdesc="A Lean version manager"
arch=('x86_64')
url="https://github.com/leanprover/elan"
license=('MIT' 'Apache')
depends=('curl' 'xz')
makedepends=('cargo')
provides=('lean-community')
conflicts=('lean-bin' 'lean-git' 'lean4' 'lean-community')
install='post.install'
source=("elan-${pkgver}.tar.gz::https://github.com/leanprover/elan/archive/v${pkgver}.tar.gz")
sha512sums=('88d4d7e58a0d659168c54ce85967020371716d92f9dd260f6030e4c57de2c94b3a61801cc3ffa7f859b574c5d95b8c4d543780e267015c538786de8c55c2d64b')
_binlinks=('lean' 'leanchecker' 'leanpkg' 'lake')
options=(!lto)

build() {
    cd "$srcdir/$_pkgname-${pkgver}"
    cargo build --release --features no-self-update --bin elan-init
}

package() {
    cd "$_pkgname-${pkgver}"
    install -Dm755 "target/release/elan-init" "${pkgdir}/usr/bin/elan"
    for link in "${_binlinks[@]}"; do
        ln -s /usr/bin/elan "${pkgdir}/usr/bin/${link}"
    done

    # Generate completion files.
    mkdir -p "$pkgdir/usr/share/bash-completion/completions"
    "$pkgdir"/usr/bin/elan completions bash > "$pkgdir/usr/share/bash-completion/completions/elan"
    mkdir -p "$pkgdir/usr/share/fish/vendor_completions.d"
    "$pkgdir"/usr/bin/elan completions fish > "$pkgdir/usr/share/fish/vendor_completions.d/elan.fish"
    mkdir -p "$pkgdir/usr/share/zsh/site-functions"
    "$pkgdir"/usr/bin/elan completions zsh > "$pkgdir/usr/share/zsh/site-functions/_elan"

    install -Dm644 LICENSE-MIT "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-MIT
    install -Dm644 LICENSE-APACHE "${pkgdir}"/usr/share/licenses/$pkgname/LICENSE-APACHE
}

# vim:filetype=sh:
