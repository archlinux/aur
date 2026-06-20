# Maintainer: networkException <git@nwex.de>

pkgname=ungoogled-chromium-bin
pkgver=149.0.7827.155
pkgrel=1
pkgdesc="A lightweight approach to removing Google web service dependency"
arch=('x86_64')
url="https://github.com/ungoogled-software/ungoogled-chromium"
license=('BSD')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'cairo'
  'dbus'
  'desktop-file-utils'
  'expat'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libcups'
  'libffi'
  'libgcc'
  'libgcrypt'
  'libpulse'
  'libstdc++'
  'libva'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxss'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'pciutils'
  'systemd'
  'systemd-libs'
  'ttf-liberation'
  'xdg-utils'
  'zlib'
)
optdepends=('pipewire: WebRTC desktop sharing under Wayland'
            'kdialog: support for native dialogs in Plasma'
            'gtk4: for --gtk-version=4 (GTK4 IME might work better on Wayland)'
            'qt6-base: Qt support'
            'org.freedesktop.secrets: password storage backend on GNOME, KDE and Xfce'
            'upower: Battery Status API support')
provides=("chromium=$pkgver" "chromedriver=$pkgver")
conflicts=('chromium' 'chromedriver')
source=(https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$pkgrel/ungoogled-chromium-$pkgver-$pkgrel-x86_64.pkg.tar.zst)
sha256sums=('02416a116e77d71478a8f2f04a04e630b260c48b4a65f6c5068027eff4514049')

declare -gA _system_libs=(
    [brotli]=brotli
    [dav1d]=dav1d
    #[ffmpeg]=ffmpeg    # YouTube playback stopped working in Chromium 120
    [flac]=flac
    [fontconfig]=fontconfig
    [freetype]=freetype2
    [harfbuzz]=harfbuzz
    #[icu]=icu
    #[jsoncpp]=jsoncpp  # needs libstdc++
    #[libaom]=aom
    #[libavif]=libavif  # needs -DAVIF_ENABLE_EXPERIMENTAL_GAIN_MAP=ON
    [libdrm]=libdrm
    [libjpeg]=libjpeg-turbo
    #[libpng]=libpng
    #[libvpx]=libvpx
    [libwebp]=libwebp
    [libxml]=libxml2
    [libxslt]=libxslt
    [openh264]=openh264
    [opus]=opus
    #[re2]=re2          # needs libstdc++
    #[snappy]=snappy    # needs libstdc++
    #[woff2]=woff2      # needs libstdc++
    [zlib]=minizip
    [zstd]=zstd
)
_unwanted_bundled_libs=(
    $(printf "%s\n" ${!_system_libs[@]} | sed 's/^libjpeg$/&_turbo/')
)
depends+=(${_system_libs[@]})

package() {
    cp -R "${srcdir}/usr/" "${pkgdir}/usr"

    chown root "$pkgdir/usr/lib/chromium/chrome-sandbox"
    chmod 4755 "$pkgdir/usr/lib/chromium/chrome-sandbox"
}
