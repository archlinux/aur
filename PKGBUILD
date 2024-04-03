# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Maintainer: SoulHarsh007 <admin@soulharsh007.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname=forkgram
_pkgname=frk
pkgver=4.16
pkgrel=1
pkgdesc='Fork of Telegram Desktop messaging app.'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/Forkgram/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0'
         'libxcomposite' 'libvpx' 'libxdamage' 'kcoreaddons')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'python-packaging' 'dos2unix')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=(forkgram-bin)
conflicts=(forkgram-bin telegram-desktop)
options=(!debug)
source=("https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-full.tar.gz"
        "${pkgname}.desktop"
        "block-sponsored_messages.patch"
        "fix-lzma-link.patch")
sha512sums=('d7ba3192283c812e79bc9a1845bc685a22d86c82bc4fe11cc534c2415b8020ff28cd0a752852e51440bd460620bbffeb12ceffcefc2b07e53a707c5eaf1ec069'
            'd6d54a5a396c0a84645ca5f38cd2d0c774d1a00f081cdf6151228b581ff1c05234550d4829aab4fe2221dec8e0477199da5a0cb1bc3a60fa1fbfe0336db365dd')

prepare() {
    cd ${_pkgname}-v${pkgver}-full
    patch -Np1 --binary -i ../block-sponsored_messages.patch
    patch -p1 --binary < ../fix-lzma-link.patch
    find "${srcdir}"/ -type f -exec dos2unix {} \;
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

    cmake \
        -B build \
        -S $_pkgname-$pkgver-full \
        -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON \
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
