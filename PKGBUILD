# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=ungoogled-chromium-widevine-bin
pkgver=147.0.7727.137
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
sha256sums=(
  'f3b0af264ec4f93a3bd1c64243b343239ef8fd576907244a7b4d245d3013f1dd'
  'd90280f2793e3b5d1c1abd2018e31294b931a4ef961c51b5cae97d6b7546abae'
)

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

  echo "Injecting WidevineCdm..."
  mkdir -p "$pkgdir/usr/lib/chromium/"
  cp -r "$srcdir/chrome_extract/opt/google/chrome/WidevineCdm" "$pkgdir/usr/lib/chromium/"
}
