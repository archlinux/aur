# Maintainer: Alesar1
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: KspLite <ksplite@outlook.com>
# Contributor: Daniil Kovalev <daniil@kovalev.website>
pkgname=64gram-desktop
_pkgname=64Gram
pkgver=1.2.3
pkgrel=3
epoch=1
pkgdesc='Unofficial desktop version of Telegram messaging app'
arch=('x86_64')
url="https://github.com/TDesktop-x64/tdesktop"
license=('GPL3')
depends=(
  'abseil-cpp'
  'ada'
  'fcitx5'
  'ffmpeg'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'hunspell'
  'jemalloc'
  'kcoreaddons'
  'libavif'
  'libdispatch'
  'libgcc'
  'libheif'
  'libjpeg-turbo'
  'libjxl'
  'libpipewire'
  'libsigc++-3.0'
  'libstdc++'
  'libvpx'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'libxtst'
  'lz4'
  'minizip'
  'openal'
  'openh264'
  'openssl'
  'pipewire'
  'protobuf'
  'qt6-base'
  'qt6-imageformats'
  'qt6-svg'
  'qt6-wayland'
  'rnnoise'
  'xxhash'
  'zlib'
)

makedepends=(
  'boost'
  'boost-libs'
  'cmake'
  'dos2unix'
  'extra-cmake-modules'
  'fmt'
  'git'
  'glib2-devel'
  'gobject-introspection'
  'gperf'
  'libtg_owt'
  'meson'
  'microsoft-gsl'
  'mm-common'
  'ninja'
  'perl-xml-parser'
  'plasma-wayland-protocols'
  'python'
  'python-packaging'
  'range-v3'
  'tl-expected'
  'wayland-protocols'
)
optdepends=(
  'geoclue: geoinformation support'
  'geocode-glib-2: geocoding support'
  'geocode-glib: geocoding support'
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
  'webkit2gtk: embedded browser features provided by webkit2gtk'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
  'xdg-desktop-portal: desktop integration'
)


_td_commit=49b3bcbb6bfebf2ed44dd9f25102d2e1a94a58c4
_td_path=td-${_td_commit}
source=("https://github.com/TDesktop-x64/tdesktop/releases/download/v${pkgver}/${_pkgname}-${pkgver}-full.tar.gz"
        "fix-lzma-link.patch"
        "io.github.tdesktop_x64.TDesktop.desktop"
        "https://github.com/tdlib/td/archive/${_td_commit}.tar.gz"
        "tdesktop-fix-minizip-includes.patch")
noextract=("${_pkgname}-${pkgver}-full.tar.gz")
sha512sums=('07054a46297d724231370fb4dfc73f13af6880deeac4d544fa0a0112bff85dea672d849e78decef468f267f24b75d19e100bebb838df48639e1553432577bbc2'
            'e15cdc8513793f17e4b6ca2dfab5b4bbf22d0934c1e88038957b9004865edb4101a3133482708aab6844de3c1dfdac9c98970de684c1508634180d90c84345f7'
            'ea027bc2d40c74507adf32380444207210a8c31cdba57f3f468d23d8e9c7376647cc8c713f188660f9b1dacd9041227aafd5a27c7889f47ea3985712b6b74b8b'
            '6a906ccaaf89232ade9977e02c5e27155379d740aac229b3656a9be7cb9b34db26c63e0654c331648248649097845ad5bf60ebd4b4c68160e5021d9b24812c46'
            'd9765588e92f154d83b95dc2840207bf22b26b6ca37b4d5cdfdb5e27a00c9e1ebcc9cd475a96bbcc5b02c24f6892320e009f843aa6b172a1820814b952a772eb')

prepare() {
    mv td-${_td_commit} td
    LANG=C.UTF-8 bsdtar -xf ${_pkgname}-${pkgver}-full.tar.gz
    cd $_pkgname-$pkgver-full
    find "${srcdir}"/ -type f -exec dos2unix {} \;

    # Restore symlinks that were stored as text files in the archive
    find . -type f ! -path '*/.git*' -size -200c | while read -r f; do
        if [ -f "$f" ]; then
            line=$(head -n 1 "$f" 2>/dev/null | tr -d '\r\n')
            if [[ "$line" =~ ^\.\./ ]] || [[ "$line" =~ ^\./ ]]; then
                rm "$f"
                ln -s "$line" "$f"
            fi
        fi
    done

    patch -p1 --binary < ../fix-lzma-link.patch
    patch -Np1 -d Telegram/lib_base -i "$srcdir"/tdesktop-fix-minizip-includes.patch

}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

  cmake -S td -B td/build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="$PWD/td/install" \
    -Wno-dev \
    -DTD_E2E_ONLY=ON
  cmake --build td/build
  cmake --install td/build



    cmake \
        -B build \
        -S $_pkgname-$pkgver-full \
        -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -Dtde2e_DIR="$PWD/td/install/lib/cmake/tde2e" \
        -DCMAKE_BUILD_TYPE=Release \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON \
        -DTDESKTOP_API_TEST=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    mv "$pkgdir/usr/bin/Telegram" "$pkgdir/usr/bin/64gram-desktop"
    install -Dm644 "$srcdir/io.github.tdesktop_x64.TDesktop.desktop" -t "$pkgdir/usr/share/applications"
    find "$pkgdir" -type f -name "org.telegram.desktop.png" -exec rename org.telegram.desktop.png 64gram.png {} \;
    mv "$pkgdir/usr/share/icons/hicolor/symbolic/apps/org.telegram.desktop-attention-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/64gram-attention-symbolic.svg"
    mv "$pkgdir/usr/share/icons/hicolor/symbolic/apps/org.telegram.desktop-mute-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/64gram-mute-symbolic.svg"
    mv "$pkgdir/usr/share/icons/hicolor/symbolic/apps/org.telegram.desktop-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/64gram-symbolic.svg"
    mkdir -p "$pkgdir/usr/share/64Gram/externalupdater.d"
    echo "/usr/bin/64gram-desktop" >"$pkgdir/usr/share/64Gram/externalupdater.d/telegram-desktop.conf"
}
