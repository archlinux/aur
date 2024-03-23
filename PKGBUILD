# Maintainer: Tim Harding <tim@timharding.co>

pkgname='neophyte'
pkgver='0.2.5'
pkgrel=2
pkgdesc='A WebGPU-rendered Neovim GUI'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/tim-harding/$pkgname"
license=('MIT')
depends=('fontconfig' 'freetype2' 'gcc-libs' 'glibc')
makedepends=('cargo')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname-bin" "$pkgname-git")
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha256sums=('SKIP')

# See for best practices:
# https://wiki.archlinux.org/title/Rust_package_guidelines
#
# Test in a clean chroot with `namcap PKGBUILD && extra-x86_64-build`:
# https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    target_platform="$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch \
        --locked \
        --target $target_platform
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C target-cpu=native"
    cargo build --release --frozen
}

package() {
    cd "$pkgname-$pkgver"

    install \
        --mode=0755 \
        -D --target-directory="$pkgdir/usr/bin/" \
        target/release/$pkgname

    install \
        --mode=0644 \
        -D --target-directory="$pkgdir/usr/share/applications/" \
        assets/neophyte.desktop

    install \
        --mode=0644 \
        -D --target-directory="$pkgdir/usr/share/licenses/$pkgname/" \
        LICENSE

    install \
        --mode=0644 \
        -D --target-directory="$pkgdir/usr/share/doc/$pkgname/" \
        README.md
}

# vim: ts=4 sts=4 sw=4 et
