# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=ungoogled-chromium-widevine-bin
pkgver=151.0.7922.169
pkgrel=1
_upstream_rel=$pkgrel
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
  "ungoogled-chromium-$pkgver-$pkgrel-$arch.pkg.tar.zst::https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$_upstream_rel/ungoogled-chromium-$pkgver-$pkgrel-$arch.pkg.tar.zst"
  "google-chrome-stable_${pkgver}-1_amd64.deb::https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${pkgver}-1_amd64.deb"
)
noextract=("google-chrome-stable_${pkgver}-1_amd64.deb")
sha256sums=('c0a30148e99ac7ed304f4bfdd8c3ecdd08879b121041cc8c1ed5399dc833ef5e'
            '6572478310553cb25fdcb4ba2fb5459b472c2c765f5f68e9837d4964e8a87f1e')

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
