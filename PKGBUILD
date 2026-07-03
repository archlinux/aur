# Maintainer: satorisage <stephen.redding31@gmail.com>
# door — a self-contained, reversible Wayland login manager.
#
# Installs DISABLED by default: the package never enables any unit and never touches
# the active display manager. Making door the active DM is a deliberate, reversible
# step the admin runs separately (see the post-install note), with a tested TTY
# revert in hand. The previous DM is left installed as the fallback.
pkgname=door
pkgver=0.1.7
pkgrel=1
pkgdesc="Beautiful, security-first Wayland display manager / login manager with an animated GPU greeter (privilege-separated, reversible)"
arch=('x86_64')
url="https://github.com/satorisage/door"
license=('MPL-2.0')
# Runtime: PAM, logind (systemd), the greeter host compositor (cage), and the
# font the built-in default theme renders in (MesloLGS Nerd Font) so the greeter
# looks as designed out of the box.
depends=('pam' 'systemd' 'cage' 'ttf-meslo-nerd')
makedepends=('cargo')
# Optional hardware-key 2FA. door drives whatever PAM stack the system presents,
# so a `pam_u2f.so` line the admin adds to the login stack "just works" over the
# daemon's multi-prompt conversation — see docs/yubikey.md. pamu2fcfg (enrollment)
# ships in the same package.
optdepends=('pam-u2f: FIDO2/U2F hardware-key second factor (YubiKey etc.), see docs/yubikey.md')
backup=('etc/pam.d/doord' 'etc/pam.d/door-greeter')
install="${pkgname}.install"
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
# Run `updpkgsums` after the v$pkgver tag exists to pin this to the real checksum.
sha256sums=('3971a4e736415d9a04cb7c4df45f6d3fa1d5fcc383bb8af278a42d26550acd5d')

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

    # Settings editor launchers (appear under Settings in the app menu): the plain
    # entry and an Expert entry that launches with the advanced (Tier-3) controls
    # already revealed (door-settings --expert).
    install -Dm644 dist/door/door-settings.desktop \
        "$pkgdir/usr/share/applications/door-settings.desktop"
    install -Dm644 dist/door/door-settings-expert.desktop \
        "$pkgdir/usr/share/applications/door-settings-expert.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
