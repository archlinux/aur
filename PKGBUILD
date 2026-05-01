# Maintainer: Atay Özcan <atay@oezcan.me>
# Companion -git package. Tracks the main branch HEAD.
# Submit as the AUR package "sentinel-git" alongside "sentinel".
pkgname=sentinel-git
pkgver=0.2.1.r0.g656b327
pkgrel=1
pkgdesc="UAC-style confirmation dialog for Linux privilege escalation (git HEAD)"
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
    'git'
)
provides=("sentinel=$pkgver")
conflicts=('sentinel')
optdepends=(
    'sudo-rs: memory-safe sudo replacement'
    'polkit: for graphical privilege prompts'
)
backup=('etc/security/sentinel.conf' 'etc/pam.d/polkit-1')
source=("sentinel::git+$url.git#branch=main")
sha256sums=('SKIP')

pkgver() {
    cd sentinel
    # 0.2.0.r{commits-since-tag}.g{shortsha}
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf '0.2.1.r%s.g%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd sentinel
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd sentinel
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    export SENTINEL_PREFIX=/usr
    export SENTINEL_SYSCONFDIR=/etc
    export SENTINEL_LIBEXECDIR=lib
    cargo build --frozen --release --workspace
}

package() {
    cd sentinel

    install -Dm755 target/release/sentinel-helper \
        "$pkgdir/usr/lib/sentinel-helper"

    install -Dm644 target/release/libpam_sentinel.so \
        "$pkgdir/usr/lib/security/pam_sentinel.so"

    install -Dm644 config/sentinel.conf \
        "$pkgdir/etc/security/sentinel.conf"

    install -Dm644 config/polkit-1 \
        "$pkgdir/etc/pam.d/polkit-1"

    # See sentinel/PKGBUILD for why config/sudo is *not* installed to
    # /etc/pam.d/sudo automatically.
    install -Dm644 config/sudo \
        "$pkgdir/usr/share/doc/sentinel/sudo"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/sentinel/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/sentinel/README.md"
}
