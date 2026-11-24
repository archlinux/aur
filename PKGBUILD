# Maintainer: Anuraj Jit Saikia <rajasaikia1644@gmail.com>
#
# Hand-written in cargo-aur's style. cargo-aur was not run to generate this
# skeleton because (a) it targets single-binary crates and would need manual
# extension for Voisu's three binaries plus the two systemd user units, and
# (b) no GitHub Release / prebuilt tarball exists yet to point it at. When the
# release workflow (ticket 14) publishes a `cargo aur` tarball, this file's
# fields already match cargo-aur's output layout.
pkgname=voisu-bin
pkgver=1.5.2
pkgrel=1
pkgdesc="Voice dictation for Linux desktops (prebuilt binaries)"
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
         'xdg-desktop-portal'
         'vulkan-icd-loader')
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
#   voisu.desktop, voisu.svg
#   LICENSE
#   THIRD_PARTY_NOTICES.md
#   ring/LICENSE
#   ring/LICENSE-BoringSSL
#   ring/LICENSE-other-bits
#   ring/src/polyfill/once_cell/LICENSE-APACHE
#   ring/src/polyfill/once_cell/LICENSE-MIT
#   ring/third_party/fiat/LICENSE
#   worker/voisu-local-asr and its libwhisper/libggml libraries and backend
#   modules (whisper.cpp and ggml, MIT; libggml-vulkan.so links
#   vulkan-icd-loader's libvulkan.so.1)
# ring's tree must keep those UPSTREAM names and paths so the cross-references
# inside ring's own LICENSE manifest resolve once installed.
source=("$pkgname-$pkgver.tar.gz::https://github.com/Anuraj-Dev/voisu/releases/download/v$pkgver/voisu-$pkgver-${CARCH}.tar.gz")
sha256sums=('2a7830cefae021c68a82e4199f5a29ccbd49680538ad0795107931627edfe2b7')

package() {
    install -Dm755 voisu "$pkgdir/usr/bin/voisu"
    install -Dm755 voisu-daemon "$pkgdir/usr/bin/voisu-daemon"
    install -Dm755 voisu-overlay "$pkgdir/usr/bin/voisu-overlay"

    # The whisper.cpp worker keeps its libraries beside it and finds them
    # through its $ORIGIN rpath. Arch keeps private helpers in /usr/lib/<pkg>.
    # The daemon starts only a worker whose runtime list sits beside it.
    install -Dm755 -t "$pkgdir/usr/lib/voisu" worker/voisu-local-asr
    local lib
    while read -r lib; do
        install -Dm755 "worker/$lib" "$pkgdir/usr/lib/voisu/$lib"
    done < worker/voisu-whisper-runtime.txt
    install -Dm644 worker/voisu-whisper-runtime.txt \
        "$pkgdir/usr/lib/voisu/voisu-whisper-runtime.txt"

    install -Dm644 voisu.service "$pkgdir/usr/lib/systemd/user/voisu.service"
    install -Dm644 voisu-overlay.service \
        "$pkgdir/usr/lib/systemd/user/voisu-overlay.service"

    # Desktop entry makes a resolvable app_id (voisu) available to portal
    # backends that support it; the stable session token is the primary fix.
    install -Dm644 voisu.desktop "$pkgdir/usr/share/applications/voisu.desktop"
    install -Dm644 voisu.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/voisu.svg"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 THIRD_PARTY_NOTICES.md \
        "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"

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
