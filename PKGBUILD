# Maintainer: Tim Harding <tim@timharding.co>

pkgname='neophyte-git'
pkgver=0.2.5.r0.g9b5e62f
pkgrel=1
pkgdesc='A WebGPU-rendered Neovim GUI'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/tim-harding/neophyte"
license=('MIT')
depends=('fontconfig' 'freetype2' 'gcc-libs' 'glibc')
makedepends=('git' 'cargo')
provides=("neophyte=$pkgver")
conflicts=('neophyte-bin' 'neophyte')
source=("neophyte::git+$url.git")
sha256sums=('SKIP')

# See for best practices:
# https://wiki.archlinux.org/title/Rust_package_guidelines
#
# Test in a clean chroot with `namcap PKGBUILD && extra-x86_64-build`:
# https://wiki.archlinux.org/title/DeveloperWiki:Building_in_a_clean_chroot

# From https://wiki.archlinux.org/title/VCS_package_guidelines#Package_naming
pkgver() {
  cd "neophyte"
  git describe --long --abbrev=7 | sed 's/-/.r/;s/-/./'
}

prepare() {
    cd "neophyte"
    git fetch --tags
    latest_tag=$(git describe --tags "$(git rev-list --tags --max-count=1)")
    git checkout "$latest_tag"
    export RUSTUP_TOOLCHAIN=stable
    target_platform="$(rustc -vV | sed -n 's/host: //p')"
    cargo fetch \
        --locked \
        --target $target_platform
}

build() {
    cd "neophyte"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export RUSTFLAGS="-C target-cpu=native"
    cargo build --release --frozen
}

package() {
    cd "neophyte"

    install \
        --mode=0755 \
        -D --target-directory="$pkgdir/usr/bin/" \
        target/release/neophyte

    install \
        --mode=0644 \
        -D --target-directory="$pkgdir/usr/share/applications/" \
        assets/neophyte.desktop

    # Installing to both locations because makepkg complains about uncommon
    # license identifier MIT needing a license file in neophyte-git
    for dst in neophyte $pkgname
    do
        install \
            --mode=0644 \
            -D --target-directory="$pkgdir/usr/share/licenses/$dst/" \
            LICENSE

        install \
            --mode=0644 \
            -D --target-directory="$pkgdir/usr/share/doc/$dst/" \
            README.md
    done
}

# vim: ts=4 sts=4 sw=4 et
