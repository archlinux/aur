# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: SoulHarsh007 <admin@soulharsh007.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname=forkgram
_pkgname=frk
pkgver=4.12.2
pkgrel=1
pkgdesc='Fork of Telegram Desktop messaging app.'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/Forkgram/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
  'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash'
  'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
  'openssl' 'protobuf' 'glib2' 'libsigc++-3.0' 'glibmm-2.68')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
  'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
  'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'libsigc++-3.0' 'libxcomposite')
optdepends=('webkit2gtk: embedded browser features'
  'xdg-desktop-portal: desktop integration')
provides=(telegram-desktop forkgram-bin)
conflicts=(telegram-desktop forkgram-bin)
source=("https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-full.tar.gz"
  "${pkgname}.desktop")
sha512sums=('7ba1a88a8a27454c30465c5a14fec4b6901189485559dd4c1e8b35ef9cc6ae59beb2ee9ebaa4b223509e284563b7b51b062feb7e0310a3fd5f47c4a72e5c90ff'
  'd6d54a5a396c0a84645ca5f38cd2d0c774d1a00f081cdf6151228b581ff1c05234550d4829aab4fe2221dec8e0477199da5a0cb1bc3a60fa1fbfe0336db365dd')

prepare() {
  cd ${_pkgname}-v${pkgver}-full
  rm -rf Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl
}

build() {
  CXXFLAGS+=' -ffat-lto-objects'
  # Turns out we're allowed to use the official API key that telegram uses for their snap builds:
  # https://github.com/telegramdesktop/tdesktop/blob/8fab9167beb2407c1153930ed03a4badd0c2b59f/snap/snapcraft.yaml#L87-L88
  # Thanks @primeos!
  cmake -B build $_pkgname-v$pkgver-full -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
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
