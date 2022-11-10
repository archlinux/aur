# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Taras Shpot <mrshpot@gmail.com>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
# Contributor: Bryan Malyn <bim9262@gmail.com>
_gitname='rust'
pkgname=('rust-git' 'rust-docs-git' 'rust-src-git' 'rust-analysis-git' 'cargo-git' 'rls-git')
pkgver=1.67.0.r209627.11fa0850f03
epoch=3
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=('i686' 'x86_64')
url="https://www.rust-lang.org/"
license=('MIT' 'Apache')
makedepends=('git' 'libffi' 'perl' 'python' 'curl' 'llvm' 'cmake' 'ninja')
source=("git+https://github.com/rust-lang/rust.git" "config.toml")
options=('staticlibs' '!strip' '!emptydirs')
sha384sums=('SKIP'
            '211305c032a61d9bec58cbef6929ce94ae605cfe0c27d73775c5cd67a83f673a0163a45d966087c7503a1694731b581b')

rustbuild_pkgver() {
    cat src/version
}


install_component() {
    release=$(rustbuild_pkgver)
    triple="${CARCH}-unknown-linux-gnu"
    fullver="${release}-dev-${triple}"

    "./build/tmp/tarball/${1}/${triple}/${1}-${fullver}/install.sh" \
        --prefix=$pkgdir/usr \
        --sysconfdir=$pkgdir/etc \
        --docdir=$pkgdir/usr/share/doc/$2 \
        --bindir=$pkgdir/usr/bin \
        --mandir=$pkgdir/usr/share/man \
        --libdir=$pkgdir/usr/lib \
        --disable-ldconfig

    rm $pkgdir/usr/lib/rustlib/{components,install.log,manifest-*,rust-installer-version,uninstall.sh}
}

pkgver() {
    cd "$_gitname"
    echo "$(rustbuild_pkgver).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "$_gitname"

    cp -a "$srcdir/config.toml" .
    ./x.py dist
}

package_rust-git() {
    depends=('gcc-libs' 'llvm-libs')
    provides=('rust')
    conflicts=('rust')

    cd $_gitname

    install_component rust-std rust
    install_component rustc rust

    for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done

    cd "$pkgdir/usr/lib"

    ln -sf rustlib/$CARCH-unknown-linux-gnu/lib/*.so .
}

package_rust-docs-git() {
    pkgdesc="Systems programming language focused on safety, speed and concurrency (Language and API documentation)"
    arch=('any')
    provides=('rust-docs')
    conflicts=('rust-docs')

    cd "$_gitname"

    install_component rust-docs rust

    for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}

package_rust-src-git() {
    pkgdesc="Systems programming language focused on safety, speed and concurrency (Source code)"
    arch=('any')
    provides=('rust-src')
    conflicts=('rust-src')

    cd "$_gitname"

    mkdir -p "$pkgdir/usr/src/rust/"
    git checkout-index -a --prefix "$pkgdir/usr/src/rust/"

    for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}

package_rust-analysis-git() {
    pkgdesc="Systems programming language focused on safety, speed and concurrency (Code completion data)"
    depends=('rust-git')
    provides=('rust-analysis')
    conflicts=('rust-analysis')

    cd "$_gitname"

    install_component rust-analysis rust

    for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}

package_cargo-git() {
    pkgdesc="The Rust package manager"
    depends=('rust')
    provides=('cargo')
    conflicts=('cargo')

    cd "$_gitname"

    install_component cargo cargo

    for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}

package_rls-git() {
    pkgdesc="Rust language server"
    depends=('rust-git' 'rust-src-git' 'rust-analysis-git')
    provides=('rls')
    conflicts=('rls')

    cd "$_gitname"

    install_component rls rls

    for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}
