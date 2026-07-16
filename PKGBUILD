# Maintainer: germanua

pkgname=linux-soundboard
pkgver=2.1.1
pkgrel=1
pkgdesc="Native Linux soundboard with full Wayland/X11 support and virtual microphone support"
arch=('x86_64')
url="https://github.com/germanua/Linux-SoundBoard"
license=('custom:PolyForm-Noncommercial-1.0.0')
depends=(
  'gtk4'
  'libadwaita'
  'libpulse'
  'libx11'
  'libxi'
  'libxtst'
  'libxkbcommon'
  'hicolor-icon-theme'
  'polkit'
  'pipewire'
  'wireplumber'
)
makedepends=(
  'cargo'
  'imagemagick'
  'clang'
  'pkgconf'
)
optdepends=(
  'swhkd-git: native Wayland hotkey daemon from upstream source'
  'xorg-xwayland: enables the native X11 backend inside Wayland sessions'
)
conflicts=('linux-soundboard-git')
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('75795e58ca156bdf5147cf100c7bbc72608845baecac14b5c233354fb1580433')
install="${pkgname}.install"

build() {
    cd "$srcdir/Linux-SoundBoard-$pkgver"
    bash packaging/linux/generate-icons.sh assets/icons/icon.png
    export CARGO_TARGET_DIR="$srcdir/target"
    export RUSTFLAGS="${RUSTFLAGS:+${RUSTFLAGS} }--remap-path-prefix=${srcdir}=."
    cargo build --frozen --locked --release --manifest-path src/Cargo.toml
}

check() {
    cd "$srcdir/Linux-SoundBoard-$pkgver"
    export CARGO_TARGET_DIR="$srcdir/target"
    cargo test --frozen --locked --release --manifest-path src/Cargo.toml -- --test-threads=1
}

package() {
    cd "$srcdir/Linux-SoundBoard-$pkgver"

    install -Dm755 "$srcdir/target/release/linux-soundboard" \
      "$pkgdir/usr/bin/linux-soundboard"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    for legal_file in NOTICE.md THIRDPARTY_LICENSES.md THIRD_PARTY_NOTICES.html COMMERCIAL-LICENSE.md DONATIONS.md; do
      install -Dm644 "$legal_file" "$pkgdir/usr/share/doc/$pkgname/$legal_file"
    done
    install -Dm644 packaging/rpm/linux-soundboard.desktop \
      "$pkgdir/usr/share/applications/com.linuxsoundboard.app.desktop"

    local icon_root="src/resources/icons"
    local icon_names=("com.linuxsoundboard.app.png" "linux-soundboard.png")
    local size
    for size in 16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512; do
      local icon_name
      for icon_name in "${icon_names[@]}"; do
        install -Dm644 "${icon_root}/${size}/apps/${icon_name}" \
          "$pkgdir/usr/share/icons/hicolor/${size}/apps/${icon_name}"
      done
    done

    install -Dm644 packaging/flatpak/com.linuxsoundboard.app.metainfo.xml \
      "$pkgdir/usr/share/metainfo/com.linuxsoundboard.app.metainfo.xml"
    install -Dm755 packaging/linux/install-swhkd-helper.sh \
      "$pkgdir/usr/libexec/linux-soundboard/install-swhkd-helper.sh"
    install -Dm644 packaging/linux/com.linuxsoundboard.install-swhkd.policy \
      "$pkgdir/usr/share/polkit-1/actions/com.linuxsoundboard.install-swhkd.policy"
    install -Dm644 packaging/linux/linux-soundboard-engine.service \
      "$pkgdir/usr/lib/systemd/user/linux-soundboard-engine.service"
}
