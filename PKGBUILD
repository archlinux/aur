pkgname=pleazyng-bin
pkgver=3.0.7
pkgrel=1
pkgdesc='Plex client with Jellyfin and Emby support, offline downloads, and HDR'
arch=('x86_64' 'aarch64')
url='https://github.com/snapetech-org/pleazyng'
license=('GPL-3.0-only')
# Preserve the released native engines and provider binaries.
options=('!strip' '!debug')
depends=('alsa-lib' 'glib2' 'gtk3' 'webkit2gtk-4.1' 'libsecret' 'libdrm' 'libepoxy' 'libevdev' 'libglvnd' 'libva' 'libvdpau' 'vulkan-icd-loader' 'libx11' 'libxcb' 'libxext' 'mesa' 'wayland')
provides=('pleazyng')
source=('pleazyng.desktop' 'LICENSE')
source_x86_64=("$pkgname-$pkgver-linux-x64.tar.gz::https://github.com/snapetech-org/pleazyng/releases/download/v3.0.7/pleazyng-linux-x64.tar.gz")
source_aarch64=("$pkgname-$pkgver-linux-arm64.tar.gz::https://github.com/snapetech-org/pleazyng/releases/download/v3.0.7/pleazyng-linux-arm64.tar.gz")
sha256sums=('SKIP' 'SKIP')
sha256sums_x86_64=('fbe98082916f0131981d71e4fee4dba900a2da1b62d9f82b9a3555e1da09fde9')
sha256sums_aarch64=('6d02b9fc2d7fb142093e9b5b34846674339ae068c722e51db80f65413a31643d')
noextract=("$pkgname-$pkgver-linux-x64.tar.gz" "$pkgname-$pkgver-linux-arm64.tar.gz")

package() {
  local archive
  case "$CARCH" in
    x86_64) archive="$srcdir/$pkgname-$pkgver-linux-x64.tar.gz" ;;
    aarch64) archive="$srcdir/$pkgname-$pkgver-linux-arm64.tar.gz" ;;
    *) printf 'Unsupported architecture: %s\n' "$CARCH" >&2; return 1 ;;
  esac

  install -d "$pkgdir/opt/pleazyng"
  tar --no-same-owner -xzf "$archive" -C "$pkgdir/opt/pleazyng"
  install -Dm755 "$pkgdir/opt/pleazyng/pleazyng.sh" "$pkgdir/usr/bin/pleazyng"
  sed -i 's|INSTALL_DIR="/opt/pleazyng"|INSTALL_DIR="/opt/pleazyng"|' "$pkgdir/usr/bin/pleazyng"
  install -Dm644 "$srcdir/pleazyng.desktop" "$pkgdir/usr/share/applications/org.snapetech.pleazyng.desktop"
  install -Dm644 "$pkgdir/opt/pleazyng/pleazyng.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pleazyng.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
