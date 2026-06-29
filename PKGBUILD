# Maintainer: satorisage <stephen.redding31@gmail.com>
# door — a self-contained, reversible Wayland login manager.
#
# Installs DISABLED by default: the package never enables any unit and never touches
# the active display manager. Making door the active DM is a deliberate, reversible
# step the admin runs separately (see the post-install note), with a tested TTY
# revert in hand. The previous DM is left installed as the fallback.
pkgname=door
pkgver=0.1.0
pkgrel=1
pkgdesc="Self-contained reversible Wayland login manager (privileged doord + unprivileged greeter)"
arch=('x86_64')
url="https://github.com/satorisage/door"
license=('MPL-2.0')
# Runtime: PAM, logind (systemd), and the greeter host compositor (cage).
depends=('pam' 'systemd' 'cage')
makedepends=('cargo')
backup=('etc/pam.d/doord' 'etc/pam.d/door-greeter')
install="${pkgname}.install"
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# Run `updpkgsums` after the v$pkgver tag exists to pin this to the real checksum.
sha256sums=('2f00830d1ee21815d4f49431aee55adf2f662cd5c8e8e008af7975092628ef46')

prepare() {
    cd "${pkgname}-${pkgver}"
    # Vendor/refresh deps against the committed lockfile (offline, reproducible build).
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --frozen --workspace
}

check() {
    cd "${pkgname}-${pkgver}"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --release --frozen --workspace
}

package() {
    cd "${pkgname}-${pkgver}"

    # Binaries: the privileged daemon, the unprivileged greeter, and the (also
    # unprivileged) settings editor.
    install -Dm755 target/release/doord         "$pkgdir/usr/bin/doord"
    install -Dm755 target/release/door-greeter   "$pkgdir/usr/bin/door-greeter"
    install -Dm755 target/release/door-settings  "$pkgdir/usr/bin/door-settings"

    # PAM: the login service (doord) and the passwordless greeter session service.
    install -Dm644 dist/pam.d/doord            "$pkgdir/etc/pam.d/doord"
    install -Dm644 dist/pam.d/door-greeter     "$pkgdir/etc/pam.d/door-greeter"

    # systemd unit (installed, NOT enabled) + the greeter system user. doord owns the
    # greeter lifecycle, so there is no separate greeter unit.
    install -Dm644 dist/systemd/doord.service "$pkgdir/usr/lib/systemd/system/doord.service"
    install -Dm644 dist/sysusers.d/door.conf  "$pkgdir/usr/lib/sysusers.d/door.conf"

    # Greeter theme: the packaged default + its wallpaper + the built-in presets,
    # world-readable under /usr/share/door/. Admins customize by copying greeter.toml
    # to /etc/door/.
    install -Dm644 dist/door/greeter.toml  "$pkgdir/usr/share/door/greeter.toml"
    install -Dm644 dist/door/wallpaper.png "$pkgdir/usr/share/door/wallpaper.png"
    for preset in dist/door/presets/*.toml; do
        install -Dm644 "$preset" "$pkgdir/usr/share/door/presets/$(basename "$preset")"
    done

    # Settings editor launcher (appears under Settings in the app menu).
    install -Dm644 dist/door/door-settings.desktop \
        "$pkgdir/usr/share/applications/door-settings.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
