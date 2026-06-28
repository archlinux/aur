# Maintainer: Christian Balcom <robot.inventor@gmail.com>

pkgname=prism-notify
pkgver=0.1.1
pkgrel=1
pkgdesc='Notification daemon for the prism compositor — damascene-rendered, layer-shell native'
arch=('x86_64')
url='https://github.com/computer-whisperer/prism-notify'
license=('MIT OR Apache-2.0')
# wayland (libwayland-client) and vulkan-icd-loader are dlopened at
# runtime (wgpu's dlopen path), not linked — ldd shows only glibc and
# gcc-libs. zbus is pure Rust; no libdbus.
depends=(
    'gcc-libs'
    'glibc'
    'vulkan-icd-loader'
    'wayland'
)
makedepends=('cargo')
# The notification-daemon virtual, per convention (dunst, mako, …).
# Not conflicts=: that would match every provider of the virtual.
# The one real overlap — the literal notification-daemon package also
# ships org.freedesktop.Notifications.service — surfaces as a pacman
# file conflict if it comes to that.
provides=('notification-daemon')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b97fbf6b67560001f94f991f6d6af108aa07074ae4a3a1669195eabc844bfc3c')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen
}

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/prism-notify" "$pkgdir/usr/bin/prism-notify"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    # D-Bus activation: the bus spawns the daemon on the first Notify()
    # call if nothing owns org.freedesktop.Notifications yet. Installed
    # under the canonical filename — dbus-broker prefers the service
    # file named after the D-Bus name and ignores misnamed duplicates
    # (e.g. dunst's and plasma's), so this is what makes activation
    # deterministically pick prism-notify when several daemons are
    # installed.
    install -Dm644 prism-notify.service \
        "$pkgdir/usr/share/dbus-1/services/org.freedesktop.Notifications.service"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
