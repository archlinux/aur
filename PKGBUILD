# Maintainer: kenura-krag <kenura.gunarathna@thenex.global>
pkgname=campus-lms-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Desktop Moodle LMS client with content diff tracking and desktop notifications"
arch=('x86_64')
url="https://github.com/Kenura-R-Gunarathna/campus-lms"
license=('MIT')
depends=(
    'libxkbcommon'
    'libgl'
    'dbus'
    'libsecret'
    'openssl'
    'wayland'
)
makedepends=('rust' 'cargo' 'git')
optdepends=(
    'dunst: desktop notifications on X11'
    'mako: desktop notifications on Wayland'
    'xdg-desktop-portal: notification support'
)
provides=('campus-lms')
conflicts=('campus-lms')
source=(
    "campus-lms::git+${url}.git"
    "campus-lms.desktop"
    "campus-lms-daemon.service"
)
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)

pkgver() {
    cd "$srcdir/campus-lms"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/campus-lms"
    cargo fetch --locked 2>/dev/null || cargo fetch
}

build() {
    cd "$srcdir/campus-lms"
    export RUSTFLAGS="-C opt-level=3"
    cargo build --release --frozen 2>/dev/null || cargo build --release
}

package() {
    cd "$srcdir/campus-lms"

    install -Dm755 "target/release/campus-lms" \
        "$pkgdir/usr/bin/campus-lms"

    install -Dm644 "$srcdir/campus-lms.desktop" \
        "$pkgdir/usr/share/applications/campus-lms.desktop"

    install -Dm644 "$srcdir/campus-lms-daemon.service" \
        "$pkgdir/usr/lib/systemd/user/campus-lms-daemon.service"
}
