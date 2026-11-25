pkgname=pleazyng-bin
pkgver=3.0.52
pkgrel=1
pkgdesc='Plex client with Jellyfin and Emby support, offline downloads, and HDR'
arch=('x86_64' 'aarch64')
url='https://github.com/snapetech-org/pleazyng'
license=('GPL-3.0-only')
# Preserve the released native engines and provider binaries.
options=('!strip' '!debug')
depends=('alsa-lib' 'glib2' 'gtk3' 'webkit2gtk-4.1' 'libsecret' 'gst-plugins-base-libs' 'libdrm' 'libepoxy' 'libevdev' 'libglvnd' 'libva' 'libvdpau' 'vulkan-icd-loader' 'libx11' 'libxcb' 'libxext' 'mesa' 'wayland')
depends+=('bubblewrap' 'xdg-dbus-proxy')
makedepends=('python' 'binutils' 'zstd' 'gdk-pixbuf2' 'pkgconf')
provides=('pleazyng')
_webkit_version=2.52.6-0ubuntu0.24.04.2
source=('pleazyng.desktop' 'LICENSE' 'install-webkit-helpers.py' 'webkit-runtime.json' 'rebuild-pixbuf-cache.py')
source_x86_64=("$pkgname-$pkgver-linux-x64.tar.gz::https://github.com/snapetech-org/pleazyng/releases/download/v3.0.52/pleazyng-linux-x64.tar.gz" "webkit-x64.deb::https://security.ubuntu.com/ubuntu/pool/main/w/webkit2gtk/libwebkit2gtk-4.1-0_${_webkit_version}_amd64.deb")
source_aarch64=("$pkgname-$pkgver-linux-arm64.tar.gz::https://github.com/snapetech-org/pleazyng/releases/download/v3.0.52/pleazyng-linux-arm64.tar.gz" "webkit-arm64.deb::https://ports.ubuntu.com/ubuntu-ports/pool/main/w/webkit2gtk/libwebkit2gtk-4.1-0_${_webkit_version}_arm64.deb")
sha256sums=('128aa0babfce8d659c4a407b59fb8af85138c630e0b53c69a3f2159b871f324b' '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986' 'fc28ccb4ff06df8fd5ff4212f84d221143560b9309ad497cf47b72c366ed71ba' '5959f61ef75290b094abbf4f257b5f4f2e76040cb2522e28ed8b4711a08af8f2' 'ab9ae42d2061af4f6b1dfd9aab2abd88416cefd0082a31217d0ea7e9b3251325')
sha256sums_x86_64=('d3d0d6cbc763faf048bf78e13c9de2ed6289c893ee1b1dc8728c225e2efe2676' '0f0278776be4250283a2120e849f9d0d856d5f3e45e886e2ced92fa93f58a969')
sha256sums_aarch64=('7161dc93a16c7541cdd53270a79be9f190aefe3d3cece21bef097ac022027424' '85629246d18ac069b80f05854007931356357d9108627ce5ace6bb90ae320b1b')
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
