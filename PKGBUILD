# Maintainer: networkException <git@nwex.de>

pkgname=ungoogled-chromium-bin
pkgver=140.0.7339.207
pkgrel=1
pkgdesc="A lightweight approach to removing Google web service dependency"
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
source=(https://github.com/ungoogled-software/ungoogled-chromium-archlinux/releases/download/$pkgver-$pkgrel/ungoogled-chromium-$pkgver-$pkgrel-x86_64.pkg.tar.zst)
sha256sums=('a4c2f612bace6bf8209627ed83fa990917fedcf90a90c17257bd5cba029d82f6')

declare -gA _system_libs=(
    [brotli]=brotli
    #[dav1d]=dav1d
    #[ffmpeg]=ffmpeg    # YouTube playback stopped working in Chromium 120
    [flac]=flac
    [fontconfig]=fontconfig
    [freetype]=freetype2
    [harfbuzz-ng]=harfbuzz
    [icu]=icu
    #[jsoncpp]=jsoncpp  # needs libstdc++
    #[libaom]=aom
    #[libavif]=libavif  # needs -DAVIF_ENABLE_EXPERIMENTAL_GAIN_MAP=ON
    [libdrm]=
    [libjpeg]=libjpeg-turbo
    [libpng]=libpng
    #[libvpx]=libvpx
    [libwebp]=libwebp
    [libxml]=libxml2
    [libxslt]=libxslt
    [opus]=opus
    #[re2]=re2          # needs libstdc++
    #[snappy]=snappy    # needs libstdc++
    #[woff2]=woff2      # needs libstdc++
    [zlib]=minizip
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
