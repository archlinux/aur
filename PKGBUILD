# Maintainer: futpib-bot <futpib-bot@users.noreply.github.com>

pkgname=safe-git-git
_pkgname=safe-git
pkgver=0.1.0.r1.g1694e3b
pkgrel=1
pkgdesc='Restricted SSH Git client for fetch, working-tree fast-forward, and push'
arch=('x86_64')
url='https://github.com/futpib/safe-git'
license=('MIT')
depends=('glibc' 'libgcc')
makedepends=('cargo' 'git')
provides=("safe-git=$pkgver")
conflicts=('safe-git')
source=("$_pkgname::git+$url.git#branch=master")
sha256sums=('SKIP')

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target
# Let makepkg handle stripping instead of the upstream Cargo profile.
export CARGO_PROFILE_RELEASE_STRIP=false

pkgver() {
    cd "$srcdir/$_pkgname" || return
    local version
    version=$(sed -n '/^\[package\]$/,/^\[/s/^version = "\([^"]*\)"$/\1/p' Cargo.toml)
    printf '%s.r%s.g%s' "$version" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname" || return
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/^host: //p')"
}

build() {
    cd "$srcdir/$_pkgname" || return
    # ring builds C code; retain native objects when makepkg enables LTO.
    CFLAGS+=' -ffat-lto-objects'
    CXXFLAGS+=' -ffat-lto-objects'
    cargo build --frozen --release --bin safe-git
}

check() {
    cd "$srcdir/$_pkgname" || return
    # The separate Python integration suites require a privileged SSH server.
    cargo test --frozen --release
}

package() {
    cd "$srcdir/$_pkgname" || return
    install -Dm755 target/release/safe-git "$pkgdir/usr/bin/safe-git"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
