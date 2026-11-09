pkgname=pleazyng-bin
pkgver=3.0.7
pkgrel=3
pkgdesc='Plex client with Jellyfin and Emby support, offline downloads, and HDR'
arch=('x86_64' 'aarch64')
url='https://github.com/snapetech-org/pleazyng'
license=('GPL-3.0-only')
# Preserve the released native engines and provider binaries.
options=('!strip' '!debug')
depends=('alsa-lib' 'glib2' 'gtk3' 'webkit2gtk-4.1' 'libsecret' 'libdrm' 'libepoxy' 'libevdev' 'libglvnd' 'libva' 'libvdpau' 'vulkan-icd-loader' 'libx11' 'libxcb' 'libxext' 'mesa' 'wayland')
depends+=('bubblewrap' 'xdg-dbus-proxy')
makedepends=('python' 'binutils' 'zstd' 'gdk-pixbuf2' 'pkgconf')
provides=('pleazyng')
_webkit_version=2.52.6-0ubuntu0.24.04.1
source=('pleazyng.desktop' 'LICENSE' 'install-webkit-helpers.py' 'webkit-runtime.json' 'rebuild-pixbuf-cache.py')
source_x86_64=("$pkgname-$pkgver-linux-x64.tar.gz::https://github.com/snapetech-org/pleazyng/releases/download/v3.0.7/pleazyng-linux-x64.tar.gz" "webkit-x64.deb::https://security.ubuntu.com/ubuntu/pool/main/w/webkit2gtk/libwebkit2gtk-4.1-0_${_webkit_version}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-linux-arm64.tar.gz::https://github.com/snapetech-org/pleazyng/releases/download/v3.0.7/pleazyng-linux-arm64.tar.gz" "webkit-arm64.deb::https://ports.ubuntu.com/ubuntu-ports/pool/main/w/webkit2gtk/libwebkit2gtk-4.1-0_${_webkit_version}_arm64.deb")
sha256sums=('128aa0babfce8d659c4a407b59fb8af85138c630e0b53c69a3f2159b871f324b' '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' 'fc28ccb4ff06df8fd5ff4212f84d221143560b9309ad497cf47b72c366ed71ba' 'ed208c117b5d7d403c0527fdba489d061b757842106c4c8f7f256158f35f4a6e' 'ab9ae42d2061af4f6b1dfd9aab2abd88416cefd0082a31217d0ea7e9b3251325')
sha256sums_x86_64=('fbe98082916f0131981d71e4fee4dba900a2da1b62d9f82b9a3555e1da09fde9' '3b3f7e2c36c679fd60392f6526b8c5659d6c5db324ebe792003831dc8108ac03')
sha256sums_aarch64=('6d02b9fc2d7fb142093e9b5b34846674339ae068c722e51db80f65413a31643d' '508f97ca47c45464c0e43480ebe983a0b4b484dd1a76031272f762662943b7c9')
noextract=("$pkgname-$pkgver-linux-x64.tar.gz" "$pkgname-$pkgver-linux-arm64.tar.gz" 'webkit-x64.deb' 'webkit-arm64.deb')

package() {
  local archive
  case "$CARCH" in
    x86_64) archive="$srcdir/$pkgname-$pkgver-linux-x64.tar.gz" ;;
    aarch64) archive="$srcdir/$pkgname-$pkgver-linux-arm64.tar.gz" ;;
    *) printf 'Unsupported architecture: %s\n' "$CARCH" >&2; return 1 ;;
  esac

  install -d "$pkgdir/opt/pleazyng"
  tar --no-same-owner -xzf "$archive" -C "$pkgdir/opt/pleazyng"
  case "$CARCH" in
    x86_64) local runtime_arch=x64 ;;
    aarch64) local runtime_arch=arm64 ;;
  esac
  python3 "$srcdir/install-webkit-helpers.py" --bundle "$pkgdir/opt/pleazyng" \
    --deb "$srcdir/webkit-${runtime_arch}.deb" --root "$pkgdir" --arch "$runtime_arch" \
    --metadata "$srcdir/webkit-runtime.json"
  python3 "$srcdir/rebuild-pixbuf-cache.py" "$pkgdir/opt/pleazyng" --runtime-prefix /opt/pleazyng
  install -Dm755 "$pkgdir/opt/pleazyng/pleazyng.sh" "$pkgdir/usr/bin/pleazyng"
  sed -i 's|INSTALL_DIR="/opt/pleazyng"|INSTALL_DIR="/opt/pleazyng"|' "$pkgdir/usr/bin/pleazyng"
  install -Dm644 "$srcdir/pleazyng.desktop" "$pkgdir/usr/share/applications/org.snapetech.pleazyng.desktop"
  install -Dm644 "$pkgdir/opt/pleazyng/pleazyng.png" "$pkgdir/usr/share/icons/hicolor/512x512/apps/pleazyng.png"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
