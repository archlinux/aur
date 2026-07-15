# Maintainer: Piyush Tiwari <piyush@bytical.ai>
#
# Binary AUR package. Wraps the upstream signed .deb from GitHub
# Releases so Arch users get the exact same bits as Debian/Ubuntu
# users (same tray-icon DBus name, same crash-report fingerprint).
#
# Named `nerva-desktop-bin` because `nerva-bin` on the AUR is an
# unrelated network-fingerprinting CLI (praetorian-inc/nerva) that
# also installs /usr/bin/nerva — hence the conflicts entry below.
#
# Why not a source package (`nerva`)? Tauri 2 + the Rust toolchain
# pull ~3 GB of build deps and ~30 min of CPU on a clean machine.
# We track upstream releases; users who want from-source are pointed
# at `cargo install --path src-tauri` in the README.

pkgname=nerva-desktop-bin
pkgver=0.1.11
pkgrel=1
pkgdesc="Persistent focus workspace for deep work — timers, notes, habits, tasks"
arch=('x86_64')
url="https://nerva.bytical.ai"
license=('Apache-2.0')
depends=(
  'webkit2gtk-4.1'
  'gtk3'
  'libayatana-appindicator'
  'librsvg'
  'libnotify'
)
optdepends=(
  'libsecret: keyring storage for AI provider tokens'
)
provides=('nerva-desktop')
conflicts=('nerva' 'nerva-bin')
options=('!strip' '!emptydirs')

# Repack the official .deb so /usr/bin/nerva is the same binary
# that ships on every Linux distribution.
source=("nerva-${pkgver}.deb::https://github.com/piyushptiwari1/nerva/releases/download/v${pkgver}/Nerva_${pkgver}_amd64.deb")
sha256sums=('542180d5e916f2c4e5cb92e2b0817778de46aac6899efb8d42bc86a84f176610')

prepare() {
  # Extract data.tar.* out of the deb without `dpkg-deb` (not in core).
  bsdtar -xf "nerva-${pkgver}.deb" -C "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.gz" -C "${srcdir}" \
    || bsdtar -xf "${srcdir}/data.tar.xz" -C "${srcdir}" \
    || bsdtar -xf "${srcdir}/data.tar.zst" -C "${srcdir}"
}

package() {
  # Binary
  install -Dm755 "${srcdir}/usr/bin/nerva" "${pkgdir}/usr/bin/nerva"

  # Desktop entry
  install -Dm644 "${srcdir}/usr/share/applications/Nerva.desktop" \
    "${pkgdir}/usr/share/applications/nerva.desktop"

  # Icons (all sizes shipped by tauri-bundler)
  for size in 32x32 128x128 128x128@2x 256x256; do
    src="${srcdir}/usr/share/icons/hicolor/${size}/apps/nerva.png"
    dst="${pkgdir}/usr/share/icons/hicolor/${size%%@*}/apps/nerva.png"
    if [ -f "$src" ]; then
      install -Dm644 "$src" "$dst"
    fi
  done

  # License + docs
  install -Dm644 "${srcdir}/usr/share/doc/nerva/changelog.gz" \
    "${pkgdir}/usr/share/doc/${pkgname}/changelog.gz" 2>/dev/null || true
}
