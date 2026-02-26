# Maintainer: Reyka Matthies <openglfreak at googlemail dot com>

_pkgname=preload-ng
pkgname=$_pkgname-git
pkgver=r249.b43c779
pkgrel=1
pkgdesc='An optimized preload-rs fork with aggressive prefetching (Git version)'
url='https://github.com/firelzrd/preload-ng'
arch=('x86_64')
license=('Apache-2.0')
depends=('libgcc' 'glibc')
makedepends=('cargo' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://github.com/firelzrd/preload-ng.git'
        'preload-ng.service'
        'preload-ng-user.service')
sha256sums=('SKIP'
            'f9d783a067e82bd7d6452901e33eef73b05d56c23522b17f7b19cadd9cc5297d'
            'fc3d71b21b28df51a5979fd5c6adb5a4b2381ea771fbbc145520b2dc42fd133c')
b2sums=('SKIP'
        '9dbd32813ed9525159cde6541f486752ab45e91f10dc8b77390b5299fd3b4e170bbbec4d3e9183e0482d941b0751024f9205fae865cea20a99514a2004a866c2'
        '9b0dfb50aecc8b2d093224111c3cfd4000ae8418a37a5761af0d2e8f9ed4aa21f5eca1988019ea95c2823cda12e7fa9d9805335b38ebcf2bf03e98b7c9788e5e')

if check_option 'lto' 'y'; then
    export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1
fi
if check_option 'debug' 'y'; then
    export CARGO_PROFILE_RELEASE_DEBUG=2
fi

options=('!lto')

pkgver() {
    cd "$_pkgname"
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export CARGO_INCREMENTAL=0
    if (( CHECKFUNC )); then
        cargo build --frozen --release --all-features --target "$CARCH-unknown-linux-gnu" --lib --bins --tests
    else
        cargo build --frozen --release --all-features --target "$CARCH-unknown-linux-gnu" --lib --bins
    fi
}

check() {
    cd "$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_INCREMENTAL=0
    cargo test --frozen --all-features
}

package() {
    cd "$_pkgname"
    install -d -Dm755 "$pkgdir/usr"
    install -d -Dm755 "$pkgdir/usr/bin"
    install -Dm755 "target/$CARCH-unknown-linux-gnu/release/cli" "$pkgdir/usr/bin/preload-ng"
    install -d -Dm755 "$pkgdir/usr/lib"
    install -d -Dm755 "$pkgdir/usr/lib/systemd"
    install -d -Dm755 "$pkgdir/usr/lib/systemd/system"
    install -Dm644 ../preload-ng.service "$pkgdir/usr/lib/systemd/system/preload-ng.service"
    install -d -Dm755 "$pkgdir/usr/lib/systemd/user"
    install -Dm644 ../preload-ng-user.service "$pkgdir/usr/lib/systemd/user/preload-ng.service"
    install -d -Dm755 "$pkgdir/usr/share"
    install -d -Dm755 "$pkgdir/usr/share/licenses"
    install -d -Dm755 "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -d -Dm755 "$pkgdir/usr/share/doc"
    install -d -Dm755 "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 GUIDE.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 CONTRIBUTING.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 DEVELOPING.md -t "$pkgdir/usr/share/doc/$pkgname"
    install -d -Dm755 "$pkgdir/usr/share/doc/$pkgname/docs"
    install -Dm644 docs/config.example.toml -t "$pkgdir/usr/share/doc/$pkgname/docs"
    install -d -Dm755 "$pkgdir/etc"
    install -d -Dm755 "$pkgdir/etc/preload-ng"
}
