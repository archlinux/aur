# Maintainer: Tokyob0t <kparra2023[at]alu.uct.cl>

_pkgname=fht-compositor
pkgname="$_pkgname-git"
pkgver=25.10.1.r724.4a04397
pkgrel=1
pkgdesc='A dynamic tiling Wayland compositor (git development version)'
arch=('x86_64')
url="https://github.com/nferhat/$_pkgname"
license=('GPL-3.0-or-later')
source=("git+${url}.git")
sha256sums=('SKIP')
makedepends=(
    'cargo'
    'clang'
    'egl-gbm'
)
depends=(
    'mesa'
    'glibc'
    'seatd'
    'gcc-libs'
    'libinput'
    'libpipewire'
    'systemd-libs'
    'libxkbcommon'
    'libdisplay-info'
)
optdepends=(
    'uwsm: systemd-managed session support'
    'fht-share-picker-git: XDG screencast portal'
)
conflicts=("$_pkgname")
options=('!lto') # TODO: temporary for libspa

pkgver() {
    cd "$srcdir/$_pkgname"

    printf "%s.r%s.%s" \
        "$(sed -n 's/^version = "\(.*\)"/\1/p' Cargo.toml)" \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export RUSTFLAGS='-C link-arg=/usr/lib/libinput.so -C link-arg=/usr/lib/libxkbcommon.so -C link-arg=/usr/lib/libgbm.so'
    cargo build --profile opt --features systemd
}


package() {
    cd "$srcdir/$_pkgname"

    install -Dm755 target/opt/fht-compositor "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 res/systemd/fht-compositor.service "$pkgdir/usr/lib/systemd/user/$_pkgname.service"
    install -Dm644 res/systemd/fht-compositor-shutdown.target "$pkgdir/usr/lib/systemd/user/$_pkgname-shutdown.target"
    install -Dm755 res/systemd/fht-compositor-session "$pkgdir/usr/bin/$_pkgname-session"
    install -Dm644 res/systemd/fht-compositor.desktop "$pkgdir/usr/share/wayland-sessions/$_pkgname.desktop"
    install -Dm644 res/fht-compositor.portal "$pkgdir/usr/share/xdg-desktop-portal/portals/$_pkgname.portal"
    install -Dm644 res/fht-compositor-portals.conf "$pkgdir/usr/share/xdg-desktop-portal/$_pkgname-portals.conf"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${_pkgname}/LICENSE"
}
