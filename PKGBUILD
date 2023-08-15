# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname=forkgram
_pkgname=frk
pkgver=4.9
pkgrel=1
pkgdesc='Fork of Telegram Desktop messaging app.'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/Forkgram/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm-2.68'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=(telegram-desktop forkgram-bin)
conflicts=(telegram-desktop forkgram-bin)
source=("https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-full.tar.gz"
        "https://download.gnome.org/sources/glibmm/2.77/glibmm-2.77.0.tar.xz"
		"${pkgname}.desktop")
sha512sums=('1502f1ec1bbbb904a449b01aa4e4126633484311f43d7beeabcc33042b878abd9fb1695d0988681d7be22b65526614b89167e13de87fa351fd3dc02245c0818e'
            '6650e822de2529582d93291025500afb6a182a0c5a564f656f164d79d8765bb4ca9c9d16227148431cc71c2677923b9364e81bbd4ca4f07f68e36bb380fb9574'
            'd6d54a5a396c0a84645ca5f38cd2d0c774d1a00f081cdf6151228b581ff1c05234550d4829aab4fe2221dec8e0477199da5a0cb1bc3a60fa1fbfe0336db365dd')

prepare() {
  cd ${_pkgname}-v${pkgver}-full
  rm -rf Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl
}

build() {
  CXXFLAGS+=' -ffat-lto-objects'

  # Telegram currently needs unstable glibmm so we bundle it in as static libs.
  # This isn't great but what can you do.
  meson setup -D maintainer-mode=true --default-library static --prefix "$srcdir/glibmm" glibmm-2.77.0 glibmm-build
  meson compile -C glibmm-build
  meson install -C glibmm-build

  # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
  # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
  # Thanks @primeos!
  export PKG_CONFIG_PATH="$srcdir"/glibmm/usr/local/lib/pkgconfig

  cmake -B build $_pkgname-v$pkgver-full -G Ninja \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_PREFIX_PATH="$srcdir/glibmm" \
    -DCMAKE_BUILD_TYPE=Release \
    -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DTDESKTOP_API_TEST=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 /dev/null "${pkgdir}/etc/tdesktop/externalupdater"

  # Remove default icons
  find "${pkgdir}/usr/share/icons" -name telegram.png -delete
  rm "${pkgdir}/usr/share/applications/org.telegram.desktop.desktop" "${pkgdir}/usr/share/metainfo/org.telegram.desktop.metainfo.xml"

  # Rename executable
  mv -v "${pkgdir}"/usr/bin/{telegram-desktop,Forkgram}

  # Main icons
  install -dm755 "${pkgdir}/usr/share/pixmaps/"
  install -Dm644 "${srcdir}/${_pkgname}-v${pkgver}-full/Telegram/Resources/art/forkgram/logo_256.png" "${pkgdir}/usr/share/pixmaps/"

  # Desktop launcher
  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Icons
  local icon_size icon_dir
  for icon_size in 16 32 48 64 128 256 512; do
    icon_dir="${pkgdir}/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
    install -d "${icon_dir}"
    install -m644 "${srcdir}/${_pkgname}-v${pkgver}-full/Telegram/Resources/art/icon${icon_size}.png" "${icon_dir}/${pkgname}.png"
  done
}
