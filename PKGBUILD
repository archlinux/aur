# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=ungoogled-chromium-widevine-bin
pkgver=150.0.7871.186
pkgrel=1
_upstream_rel=$pkgrel
pkgdesc="A lightweight approach to removing Google web service dependency (with Widevine)"
arch=('x86_64')
url="https://github.com/ungoogled-software/ungoogled-chromium"
license=('BSD')
options=('!strip')
depends=(
  'alsa-lib' 'brotli' 'dbus' 'desktop-file-utils' 'flac' 'fontconfig'
  'freetype2' 'gtk3' 'harfbuzz' 'hicolor-icon-theme' 'icu' 'libcups'
  'libffi' 'libgcrypt' 'libjpeg-turbo' 'libpng' 'libpulse' 'libva'
  'libwebp' 'libxml2' 'libxslt' 'libxss' 'minizip' 'nss' 'opus'
  'pciutils' 'systemd' 'ttf-liberation' 'xdg-utils'
)
optdepends=(
  'pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: support for native dialogs in Plasma'
  'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
  'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
  'kwallet: support for storing passwords in KWallet on Plasma'
  'upower: Battery Status API support'
)
provides=("chromium=$pkgver" "chromedriver=$pkgver")
conflicts=('chromium' 'chromedriver')
source=(
  "ungoogled-chromium-$pkgver-$pkgrel-$arch.pkg.tar.zst::https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$_upstream_rel/ungoogled-chromium-$pkgver-$pkgrel-$arch.pkg.tar.zst"
  "google-chrome-stable_${pkgver}-1_amd64.deb::https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${pkgver}-1_amd64.deb"
)
noextract=("google-chrome-stable_${pkgver}-1_amd64.deb")
sha256sums=('6dff50efad4c3320949d7d7c1ef25adb99891f6c1134dc74866a2822499e8742'
  '4193e00b6d5d5969ee63f7a69596868f546aa0e8cb077b3e0bf9cc1e2c719d00')

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

  echo "Fixing license directory name..."
  mv "$pkgdir/usr/share/licenses/chromium" "$pkgdir/usr/share/licenses/$pkgname"

  echo "Injecting WidevineCdm..."
  mkdir -p "$pkgdir/usr/lib/chromium/"
  cp -r "$srcdir/chrome_extract/opt/google/chrome/WidevineCdm" "$pkgdir/usr/lib/chromium/"
}

check() {
  local widevine_dir="$srcdir/chrome_extract/opt/google/chrome/WidevineCdm"
  local widevine_so="$widevine_dir/_platform_specific/linux_x64/libwidevinecdm.so"
  local manifest="$widevine_dir/manifest.json"

  echo "Checking Widevine files exist..."
  if [[ ! -f "$widevine_so" ]]; then
    echo "ERROR: libwidevinecdm.so not found!"
    return 1
  fi
  if [[ ! -f "$manifest" ]]; then
    echo "ERROR: manifest.json not found!"
    return 1
  fi

  echo "Checking system dependencies for libwidevinecdm.so..."
  if ldd "$widevine_so" 2>/dev/null | grep -q "not found"; then
    echo "ERROR: Missing dependencies for Widevine!"
    ldd "$widevine_so" 2>/dev/null | grep "not found"
    return 1
  fi

  echo "Widevine sanity checks passed."
}
