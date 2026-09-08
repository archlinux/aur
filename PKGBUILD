# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=ungoogled-chromium-widevine-bin
pkgver=152.0.7977.75
pkgrel=2
_upstream_rel=1
pkgdesc="A lightweight approach to removing Google web service dependency (with Widevine)"
arch=('x86_64')
url="https://github.com/ungoogled-software/ungoogled-chromium"
license=('BSD')
options=('!strip')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'brotli'
  'cairo'
  'dav1d'
  'dbus'
  'desktop-file-utils'
  'expat'
  'flac'
  'fontconfig'
  'freetype2'
  'glib2'
  'glibc'
  'gtk3'
  'harfbuzz'
  'hicolor-icon-theme'
  'libcups'
  'libdrm'
  'libffi'
  'libgcc'
  'libgcrypt'
  'libjpeg-turbo'
  'libpulse'
  'libstdc++'
  'libva'
  'libwebp'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxml2'
  'libxrandr'
  'libxslt'
  'libxss'
  'mesa'
  'minizip'
  'nspr'
  'nss'
  'openh264'
  'opus'
  'pango'
  'pciutils'
  'systemd'
  'systemd-libs'
  'ttf-liberation'
  'xdg-utils'
  'zlib'
  'zstd'
)
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: support for native dialogs in Plasma'
  'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
  'qt6-base: Qt support'
  'org.freedesktop.secrets: password storage backend on GNOME, KDE and Xfce'
  'upower: Battery Status API support'
)
provides=("chromium=$pkgver" "chromedriver=$pkgver")
conflicts=('chromium' 'chromedriver')
source=(
  "ungoogled-chromium-$pkgver-$_upstream_rel-$arch.pkg.tar.zst::https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$_upstream_rel/ungoogled-chromium-$pkgver-$_upstream_rel-$arch.pkg.tar.zst"
  "google-chrome-stable_${pkgver}-1_amd64.deb::https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${pkgver}-1_amd64.deb"
)
noextract=("google-chrome-stable_${pkgver}-1_amd64.deb")
sha256sums=('81f529216c5689e07ef9bb441ce47a154f808fd66fb11e5e1fc1368e380b6f6d'
  'a0b7a64f768ffc0ff5ccc9260ad9ebb53fd16f7a131e2e36994da58b82d913df')

prepare() {
  mkdir -p "$srcdir/chrome_extract"
  bsdtar -xf "google-chrome-stable_${pkgver}-1_amd64.deb" -C "$srcdir/chrome_extract"
  cd "$srcdir/chrome_extract"
  tar -xf data.tar.xz
}

package() {
  cp -R "${srcdir}/usr/" "${pkgdir}/usr"
  chown root "$pkgdir/usr/lib/chromium/chrome-sandbox"
  chmod 4755 "$pkgdir/usr/lib/chromium/chrome-sandbox"

  msg2 "Fixing license directory name..."
  mv "$pkgdir/usr/share/licenses/chromium" "$pkgdir/usr/share/licenses/$pkgname"

  msg2 "Injecting WidevineCdm..."
  cp -r "$srcdir/chrome_extract/opt/google/chrome/WidevineCdm" "$pkgdir/usr/lib/chromium/"
  chmod 755 "$pkgdir/usr/lib/chromium/WidevineCdm/_platform_specific/linux_x64/libwidevinecdm.so"
}

check() {
  local widevine_dir="$srcdir/chrome_extract/opt/google/chrome/WidevineCdm"
  local widevine_so="$widevine_dir/_platform_specific/linux_x64/libwidevinecdm.so"
  local manifest="$widevine_dir/manifest.json"

  msg2 "Checking Widevine files exist..."
  if [[ ! -f "$widevine_so" ]]; then
    error "libwidevinecdm.so couldn't be found. Chrome extract may not have the Widevine library inside it"
    return 1
  fi
  if [[ ! -f "$manifest" ]]; then
    error "manifest.json not found. Chrome extract may not have the manifest file inside it"
    return 1
  fi

  msg2 "Checking system dependencies for libwidevinecdm.so..."
  if ldd "$widevine_so" 2>/dev/null | grep -q "not found"; then
    error "Missing system dependencies for libwidevinecdm.so"
    ldd "$widevine_so" 2>/dev/null | grep "not found"
    return 1
  fi

  msg2 "Widevine sanity checks passed."
}
