# Maintainer: Tim Harding <tim@timharding.co>

pkgname='neophyte-git'
pkgver=0.2.4.r0.gc62a622
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

    install \
        --mode=0644 \
        -D --target-directory="$pkgdir/usr/share/licenses/neophyte/" \
        LICENSE

    install \
        --mode=0644 \
        -D --target-directory="$pkgdir/usr/share/doc/neophyte/" \
        README.md
}

# vim: ts=4 sts=4 sw=4 et
