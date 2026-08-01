# Maintainer: Pulsar <Pulsar33550336@163.com>

pkgname=tuack-ng-git
pkgver=1.0.0.r3.g3c8e9f4
pkgrel=1
pkgdesc="重构后的 tuack 项目，旨在提供更加高效和轻量的出题体验。"
url="https://github.com/tuack-ng/tuack-ng"
license=("AGPL-3.0-or-later")
arch=("x86_64")
provides=("tuack-ng")
conflicts=("tuack-ng")
depends=("gcc-libs" "glibc")
source=(
    "git+https://github.com/tuack-ng/tuack-ng.git"
    "git+https://github.com/tuack-ng/templates.git"
    "git+https://github.com/MikeMirzayanov/testlib.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')
makedepends=(
    'cargo'
    'git'
)
optdepends=(
    'typst: Needed for rendering PDF'
    'git: Needed for lfs management'
)
options=('!lto'     # to prevent compile error
         '!debug')  # useless in Rust project

pkgver() {
    cd tuack-ng
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd tuack-ng
    git submodule init
    git config submodule.assets/templates.url "$srcdir/templates"
    git config submodule.vendor/testlib.url "$srcdir/testlib"
    git -c protocol.file.allow=always submodule update

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
    cd tuack-ng
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd tuack-ng

    install -Dm755 target/release/tuack-ng -t "$pkgdir/usr/bin"

    install -dm755 "$pkgdir/usr/share/tuack-ng/"
    cd assets
    find . -type d -exec install -dm755 "$pkgdir/usr/share/tuack-ng/{}" \;
    find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/tuack-ng/{}" \;
    find ./checkers -type f ! -name "*.*" -exec chmod 755 "$pkgdir/usr/share/tuack-ng/{}" \;

    cd ..

    mkdir -vp "$pkgdir/usr/share/zsh/site-functions"
    target/release/tuack-ng gen complete zsh >"$pkgdir/usr/share/zsh/site-functions/_tuack-ng"

    mkdir -vp "$pkgdir/usr/share/bash-completion/completions"
    target/release/tuack-ng gen complete bash >"$pkgdir/usr/share/bash-completion/completions/tuack-ng"

    mkdir -vp "$pkgdir/usr/share/fish/vendor_completions.d"
    target/release/tuack-ng gen complete fish >"$pkgdir/usr/share/fish/vendor_completions.d/tuack-ng.fish"
}
