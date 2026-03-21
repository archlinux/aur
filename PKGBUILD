# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakci@gmail.com>

pkgname=ungoogled-chromium-widevine-bin
pkgver=146.0.7680.153
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
  "https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$_upstream_rel/ungoogled-chromium-$pkgver-$pkgrel-$arch.pkg.tar.zst"
  "google-chrome-stable_${pkgver}-1_amd64.deb::https://dl.google.com/linux/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${pkgver}-1_amd64.deb"
)
noextract=("google-chrome-stable_${pkgver}-1_amd64.deb")
sha256sums=('b4b3c4e523bffe2082d86e21141f25e33f0179d38c0543a84b2d6a41c38c672f'
            '6ff0cb5dbbc76e35161722535cba0bd08e9aff7af561a568c0daabde84348a60')

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
