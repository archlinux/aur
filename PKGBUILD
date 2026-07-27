# Maintainer: Anuraj Jit Saikia <rajasaikia1644@gmail.com>
#
# Hand-written in cargo-aur's style. cargo-aur was not run to generate this
# skeleton because (a) it targets single-binary crates and would need manual
# extension for Voisu's three binaries plus the two systemd user units, and
# (b) no GitHub Release / prebuilt tarball exists yet to point it at. When the
# release workflow (ticket 14) publishes a `cargo aur` tarball, this file's
# fields already match cargo-aur's output layout.
pkgname=voisu-bin
pkgver=0.7.0
pkgrel=1
pkgdesc="Cloud-first Linux dictation for Wayland (prebuilt binaries)"
arch=('x86_64')
url="https://github.com/Anuraj-Dev/voisu"
license=('MIT' 'Apache-2.0' 'ISC' 'BSD-3-Clause')
# Same runtime boundaries as the source package: pipewire-audio ships pw-record
# (the base `pipewire` package does not), wireplumber ships wpctl for the
# microphone readiness check, wl-clipboard/libsecret/curl are subprocesses,
# xdg-desktop-portal is a D-Bus service, and libxkbcommon is linked directly.
depends=('gtk4'
         'gtk4-layer-shell'
         'libxkbcommon'
         'pipewire'
         'pipewire-audio'
         'wireplumber'
         'wl-clipboard'
         'libsecret'
         'curl'
         'xdg-desktop-portal')
optdepends=('libei: direct Delivery of the Transcript into the focused window'
            'xdg-desktop-portal-kde: portal backend for KDE Plasma'
            'xdg-desktop-portal-hyprland: portal backend for Hyprland')
provides=("voisu=$pkgver")
conflicts=('voisu')
install="$pkgname.install"
# NOTE: the release asset does not exist until the first tagged release. The
# tarball 'SKIP' below MUST be replaced with the pinned sha256 (or b2sum, as
# cargo-aur emits) at the first real release, then regenerate .SRCINFO.
#
# RELEASE TARBALL CONTRACT (ticket 14). The archive must contain, at the top
# level:
#   voisu, voisu-daemon, voisu-overlay
#   voisu.service, voisu-overlay.service
#   voisu.desktop
#   LICENSE
#   ring/LICENSE
#   ring/LICENSE-BoringSSL
#   ring/LICENSE-other-bits
#   ring/src/polyfill/once_cell/LICENSE-APACHE
#   ring/src/polyfill/once_cell/LICENSE-MIT
#   ring/third_party/fiat/LICENSE
# ring's tree must keep those UPSTREAM names and paths so the cross-references
# inside ring's own LICENSE manifest resolve once installed.
source=("$pkgname-$pkgver.tar.gz::https://github.com/Anuraj-Dev/voisu/releases/download/v$pkgver/voisu-$pkgver-${CARCH}.tar.gz")
sha256sums=('e665bd6d51d5cf039d3608c52de0f80a64634b8d945461bf946b72b344d11860')

package() {
    install -Dm755 voisu "$pkgdir/usr/bin/voisu"
    install -Dm755 voisu-daemon "$pkgdir/usr/bin/voisu-daemon"
    install -Dm755 voisu-overlay "$pkgdir/usr/bin/voisu-overlay"

    install -Dm644 voisu.service "$pkgdir/usr/lib/systemd/user/voisu.service"
    install -Dm644 voisu-overlay.service \
        "$pkgdir/usr/lib/systemd/user/voisu-overlay.service"

    # Desktop entry makes a resolvable app_id (voisu) available to portal
    # backends that support it; the stable session token is the primary fix.
    install -Dm644 voisu.desktop "$pkgdir/usr/share/applications/voisu.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    # Preserve ring's upstream license tree verbatim.
    local ringlic="$pkgdir/usr/share/licenses/$pkgname/ring"
    install -Dm644 ring/LICENSE              "$ringlic/LICENSE"
    install -Dm644 ring/LICENSE-BoringSSL    "$ringlic/LICENSE-BoringSSL"
    install -Dm644 ring/LICENSE-other-bits   "$ringlic/LICENSE-other-bits"
    install -Dm644 ring/src/polyfill/once_cell/LICENSE-APACHE \
        "$ringlic/src/polyfill/once_cell/LICENSE-APACHE"
    install -Dm644 ring/src/polyfill/once_cell/LICENSE-MIT \
        "$ringlic/src/polyfill/once_cell/LICENSE-MIT"
    install -Dm644 ring/third_party/fiat/LICENSE \
        "$ringlic/third_party/fiat/LICENSE"
}
