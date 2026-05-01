# Maintainer: Atay Özcan <atay@oezcan.me>
pkgname=sentinel
pkgver=0.2.1
pkgrel=1
pkgdesc="UAC-style confirmation dialog for Linux privilege escalation (COSMIC + sudo-rs friendly)"
arch=('x86_64' 'aarch64')
url="https://github.com/atayozcan/sentinel"
license=('GPL-3.0-or-later')
depends=(
    'pam'
    'wayland'
    'libxkbcommon'
    'fontconfig'
    'freetype2'
    'mesa'
    'vulkan-icd-loader'
    'gcc-libs'
    'glibc'
)
makedepends=(
    'rust'
    'pkgconf'
    'wayland-protocols'
)
optdepends=(
    'sudo-rs: memory-safe sudo replacement'
    'polkit: for graphical privilege prompts'
)
backup=('etc/security/sentinel.conf' 'etc/pam.d/polkit-1')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0505fe31ebabcac7c392794be3af09bcb76a2f111993fca19451e9d2207c09cc')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export SENTINEL_PREFIX=/usr
    export SENTINEL_SYSCONFDIR=/etc
    export SENTINEL_LIBEXECDIR=lib
    cargo build --frozen --release --workspace
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 target/release/sentinel-helper \
        "$pkgdir/usr/lib/sentinel-helper"

    install -Dm644 target/release/libpam_sentinel.so \
        "$pkgdir/usr/lib/security/pam_sentinel.so"

    install -Dm644 config/sentinel.conf \
        "$pkgdir/etc/security/sentinel.conf"

    install -Dm644 config/polkit-1 \
        "$pkgdir/etc/pam.d/polkit-1"

    # config/sudo is *not* installed to /etc/pam.d/sudo automatically —
    # silently rewriting /etc/pam.d/sudo is a notorious foot-gun. Ship
    # it under /usr/share/doc/ for users to copy in manually.
    install -Dm644 config/sudo \
        "$pkgdir/usr/share/doc/$pkgname/sudo"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
