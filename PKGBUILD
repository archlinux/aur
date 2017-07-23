# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Taras Shpot <mrshpot@gmail.com>
# Contributor: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
_gitname='rust'
pkgname=('rust-git' 'rust-docs-git' 'rust-src-git' 'rust-analysis-git' 'cargo-git' 'rls-git')
pkgver=1.20.0.r65852.c35a0c1d05
epoch=3
pkgrel=1
pkgdesc="Systems programming language focused on safety, speed and concurrency"
arch=('i686' 'x86_64')
url="http://www.rust-lang.org/"
license=('MIT' 'Apache')
makedepends=('git' 'libffi' 'perl' 'python2' 'curl' 'llvm' 'cmake' 
'jemalloc')
source=("git+https://github.com/rust-lang/rust.git")
options=('staticlibs' '!strip' '!emptydirs')
sha256sums=('SKIP')

rustbuild_pkgver() {
    grep '^pub const CFG_RELEASE_NUM' src/bootstrap/channel.rs|head -n1|cut -d\" -f2
}

cargo_pkgver() {
    grep '^version =' Cargo.toml|head -n1|cut -d\" -f2
}

install_component() {
    if [ -z "${3}" ]; then
        release=$(rustbuild_pkgver)
    else
        release=$(cd "${3}" && cargo_pkgver)
    fi
    triple="${CARCH}-unknown-linux-gnu"
    fullver="${release}-dev-${triple}"

    "./build/tmp/dist/${1}-${fullver}/install.sh" \
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

    ./configure \
        --prefix=/usr \
        --llvm-root=/usr \
        --disable-codegen-tests \
        --enable-llvm-link-shared \
        --jemalloc-root=/usr/lib/ \
        --disable-dist-src \
        --enable-extended \
        --enable-sanitizers

    make dist
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
    local _srcdir=src/tools/cargo
    pkgdesc="The Rust package manager"
    depends=('rust')
    provides=('cargo')
    conflicts=('cargo')
    #pkgver=$(cd "$_gitname/$_srcdir" && echo "$(cargo_pkgver).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)").rust.$(pkgver)

    cd "$_gitname"

    install_component cargo cargo $_srcdir

    for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}

package_rls-git() {
    local _srcdir=src/tools/rls
    pkgdesc="Rust language server"
    depends=('rust-git' 'rust-src-git' 'rust-analysis-git')
    provides=('rls')
    conflicts=('rls')
    #pkgver=$(cd "$_gitname/$_srcdir" && echo "$(cargo_pkgver).r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)").rust.$(pkgver)

    cd "$_gitname"

    install_component rls rls $_srcdir

    for license in APACHE MIT; do install -Dm644 "LICENSE-$license" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE-$license"; done
}
