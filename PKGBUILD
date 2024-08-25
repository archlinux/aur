# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: SoulHarsh007 <admin@soulharsh007.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname=forkgram
_pkgname=frk
pkgver=5.4.1
pkgrel=1
pkgdesc='Fork of Telegram Desktop messaging app.'
arch=('x86_64')
url="https://github.com/Forkgram/tdesktop"
license=('GPL-3.0-or-later')
depends=(
  abseil-cpp
  ada
  ffmpeg
  glib2
  hicolor-icon-theme
  hunspell
  kcoreaddons
  libdispatch
  libsigc++-3.0
  libvpx
  libxcomposite
  libxdamage
  libxrandr
  libxtst
  lz4
  minizip
  openal
  openh264
  openssl
  pipewire
  protobuf
  qt6-imageformats
  qt6-svg
  qt6-wayland
  rnnoise
  xxhash
)
makedepends=(
  boost
  cmake
  dos2unix
  extra-cmake-modules
  fmt
  git
  glib2-devel
  gobject-introspection
  libtg_owt
  meson
  microsoft-gsl
  mm-common
  ninja
  perl-xml-parser
  plasma-wayland-protocols
  python
  range-v3
  tl-expected
  wayland-protocols
)
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=(forkgram-bin)
conflicts=(forkgram-bin telegram-desktop)
source=("https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-full.tar.gz"
        "${pkgname}.desktop")
sha512sums=('e2bfca658185be695efd1200657a5fe60dd05a4eee2cd8798c0d37290929c33d99bb9a107362ff37d76c470132ff64617ad867e4e52da34aeac792acf3fbccdb'
            'd6d54a5a396c0a84645ca5f38cd2d0c774d1a00f081cdf6151228b581ff1c05234550d4829aab4fe2221dec8e0477199da5a0cb1bc3a60fa1fbfe0336db365dd')

prepare() {
    cd ${_pkgname}-v${pkgver}-full
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

    cmake -B build $_pkgname-v$pkgver-full -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=611335 \
        -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
    cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 /dev/null "${pkgdir}/etc/tdesktop/externalupdater"

  # Remove default icon
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
