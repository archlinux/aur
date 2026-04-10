# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=ungoogled-chromium-widevine-bin
pkgver=147.0.7727.55
pkgrel=1
_upstream_rel=$pkgrel
pkgdesc="A lightweight approach to removing Google web service dependency (with Widevine)"
arch=('x86_64')
url="https://github.com/ungoogled-software/ungoogled-chromium"
license=('BSD')
depends=('gtk3' 'nss' 'alsa-lib' 'xdg-utils' 'libxss' 'libcups' 'libgcrypt'
  'ttf-liberation' 'systemd' 'dbus' 'libpulse' 'pciutils' 'libva'
  'libffi' 'desktop-file-utils' 'hicolor-icon-theme')
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
  'kdialog: support for native dialogs in Plasma'
  'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
  'org.freedesktop.secrets: password storage backend on GNOME / Xfce'
  'kwallet: support for storing passwords in KWallet on Plasma'
  'upower: Battery Status API support')
provides=("chromium=$pkgver" "chromedriver=$pkgver")
conflicts=('chromium' 'chromedriver')
source=(
  "ungoogled-chromium-$pkgver-$pkgrel-$arch.pkg.tar.zst::https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$_upstream_rel/ungoogled-chromium-$pkgver-$pkgrel-$arch.pkg.tar.zst"
  "google-chrome-stable_${pkgver}-1_amd64.deb::https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${pkgver}-1_amd64.deb"
)
noextract=("google-chrome-stable_${pkgver}-1_amd64.deb")
sha256sums=('6c924d1655975f37f4fe97740475030ff0210f4c53c83990b6177179f7fab060'
            '377b972c143e90cb6d4ca31a5a28ed1398475d47670e8f7b15e4ba11a42cbb28')

declare -gA _system_libs=(
  [brotli]=brotli
  [flac]=flac
  [fontconfig]=fontconfig
  [freetype]=freetype2
  [harfbuzz-ng]=harfbuzz
  [icu]=icu
  [libdrm]=
  [libjpeg]=libjpeg-turbo
  [libpng]=libpng
  [libwebp]=libwebp
  [libxml]=libxml2
  [libxslt]=libxslt
  [opus]=opus
  [zlib]=minizip
)
_unwanted_bundled_libs=(
  $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

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
