# Maintainer: hoornet <hoornet@users.noreply.github.com>
#
# Stable, tagged Vega. This is the package Arch users should install; it
# builds a released tag and nothing else.
#
# Its sibling `vega-nostr-git` builds the default branch, which is what a
# `-git` package is supposed to do — but that means it ships whatever was
# last pushed to main, including unreleased work. It was the only Vega
# package on the AUR until this one existed, and the README pointed at it,
# so every Arch user was running development code without being told.
#
# Keep the build steps here in sync with vega-nostr-git's. They are the same
# build; only the source ref differs.
pkgname=vega-nostr
pkgver=0.15.7
pkgrel=1
pkgdesc="Cross-platform Nostr desktop client with Lightning integration"
arch=('x86_64')
url="https://github.com/hoornet/vega"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'libayatana-appindicator'
    'openssl'
    'gst-plugins-base'
    'gst-plugins-good'
    'gst-libav'
)
optdepends=(
    'gnome-keyring: persistent key storage (any Secret Service provider works)'
    'kwallet: Secret Service provider on KDE'
)
makedepends=(
    'rust'
    'cargo'
    'nodejs'
    'npm'
    'git'
)
options=('!debug')
# Pinned to the release tag. Tags in this repo are immutable by policy — a bad
# release is superseded by a patch release, never re-tagged (see CLAUDE.md), so
# a tag names one commit forever. Harden further with `#commit=<sha>` if you
# ever want the ref to be cryptographically pinned rather than policy-pinned.
source=("$pkgname-$pkgver::git+https://github.com/hoornet/vega.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname-$pkgver"
    # Reset makepkg flags — they interfere with Rust cc crate
    # compiling bundled SQLite and Ring assembly
    unset CFLAGS CXXFLAGS LDFLAGS

    # `npm ci --ignore-scripts`, never `npm install` — this mirrors
    # .github/workflows/release.yml. `install` re-resolves inside the caret
    # ranges, so a compromised patch release could reach a user's build
    # without ever appearing in the reviewed lockfile, and postinstall
    # scripts run as the building user. This package builds on the user's
    # own machine, so that gap is theirs, not CI's.
    npm ci --ignore-scripts

    # `-- --locked` forwards to cargo (the Tauri CLI passes trailing args
    # through). Cargo's equivalent of `npm ci`: refuse to re-resolve, fail
    # instead of silently building a lockfile nobody reviewed.
    npx tauri build --no-bundle -- --locked
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 "src-tauri/target/release/vega" \
        "$pkgdir/usr/bin/vega"

    # Strip build paths from binary (fixes $srcdir reference warning)
    strip --strip-unneeded "$pkgdir/usr/bin/vega"

    # Icons
    install -Dm644 "src-tauri/icons/32x32.png" \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/vega.png"
    install -Dm644 "src-tauri/icons/128x128.png" \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/vega.png"
    install -Dm644 "src-tauri/icons/128x128@2x.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/vega.png"

    # Desktop entry. WEBKIT_DISABLE_DMABUF_RENDERER=1 is required on Wayland —
    # without it the WebKit DMA-BUF renderer produces a blank window.
    install -Dm644 /dev/stdin \
        "$pkgdir/usr/share/applications/vega.desktop" << 'EOF'
[Desktop Entry]
Name=Vega
Comment=Nostr desktop client
Exec=env WEBKIT_DISABLE_DMABUF_RENDERER=1 /usr/bin/vega
Icon=vega
Type=Application
Categories=Network;InstantMessaging;
StartupNotify=true
EOF

    install -Dm644 "LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
