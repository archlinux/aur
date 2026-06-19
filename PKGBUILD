# Maintainer: Alesar1
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: KspLite <ksplite@outlook.com>
# Contributor: Daniil Kovalev <daniil@kovalev.website>
pkgname=0wgram
pkgver=1.4.4
pkgrel=2
epoch=1
pkgdesc='Unofficial desktop version of Telegram messaging app'
arch=('x86_64' 'aarch64')
url="https://github.com/clansty/tdesktop"
license=('GPL3')
depends=(
  'abseil-cpp'
  'ada'
  'ffmpeg'
  'glib2'
  'glibc'
  'hicolor-icon-theme'
  'hunspell'
  'kcoreaddons'
  'libavif'
  'libdispatch'
  'libgcc'
  'libheif'
  'libjxl'
  'libstdc++'
  'libxcomposite'
  'libxdamage'
  'libxrandr'
  'libxtst'
  'lz4'
  'minizip'
  'openal'
  'openh264'
  'openssl'
  'pipewire'
  'protobuf'
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
  'git'
  'glib2-devel'
  'gobject-introspection'
  'gperf'
  'libtg_owt'
  'microsoft-gsl'
  'ninja'
  'python'
  'range-v3'
  'tl-expected'
)
optdepends=(
  'geoclue: geoinformation support'
  'crow-translate: translation provider'
  'webkit2gtk-4.1: embedded browser features provided by webkit2gtk-4.1'
  'webkitgtk-6.0: embedded browser features provided by webkitgtk-6.0 (Wayland only)'
  'xdg-desktop-portal: desktop integration'
)

_td_commit=51743dfd01dff6179e2d8f7095729caa4e2222e9
commit="ccd109eb47"
source=("git+${url}.git#commit=${commit}"
  "git+https://github.com/tdlib/td.git#tag=${_td_commit}"
  fix-lzma-link.patch)

sha512sums=('58f7bdeda6a5ebbe08044ac0390fb389673a2bc4b2530847b01f0fe765929812acaa310253bb7629b17ec7220b1e8bb35eff1a5e4cc119770919ff8cd1c3a4d4'
            'd622b8f3580ee49415546d025c4ba45f5b2de50b315fc379dc57c0427c5f815c7cc3820cca937c12182ee461641bb61f87ebc99b6c74a1a666cea9a08f0f41a0'
            'e15cdc8513793f17e4b6ca2dfab5b4bbf22d0934c1e88038957b9004865edb4101a3133482708aab6844de3c1dfdac9c98970de684c1508634180d90c84345f7')

prepare() {
    cd tdesktop
    git config submodule.Telegram/lib_base.url https://github.com/clansty/lib_base.git
    if [ -e Telegram/lib_base/.git ]; then
        git -C Telegram/lib_base remote set-url origin https://github.com/clansty/lib_base.git || git -C Telegram/lib_base remote add origin https://github.com/clansty/lib_base.git
    fi
    git submodule update --init --recursive
    patch -p1 --binary < "$srcdir"/fix-lzma-link.patch
}

build() {
    cmake -S td -B td/build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX="$PWD/td/install" \
        -Wno-dev \
        -DTD_E2E_ONLY=ON
    cmake --build td/build
    cmake --install td/build

  cmake -B build -S tdesktop -G Ninja \
    -DCMAKE_VERBOSE_MAKEFILE=ON \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -Dtde2e_DIR="$PWD/td/install/lib/cmake/tde2e" \
    -DCMAKE_BUILD_TYPE=Release \
    -DTDESKTOP_API_ID=611335 \
    -DTDESKTOP_API_HASH=d524b414d21f4d37f08684c1df41ac9c
  cmake --build build
}

_pkgname_original=org.telegram.desktop
_pkgname_new=com.clansty.0wgram

package() {
    DESTDIR="$pkgdir" cmake --install build
    mv "$pkgdir/usr/bin/Telegram" "$pkgdir/usr/bin/${pkgname}"
    find "$pkgdir" -type f -name "${_pkgname_original}.png" -exec rename ${_pkgname_original}.png ${_pkgname_new}.png {} \;
    mv "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${_pkgname_original}-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${_pkgname_new}-symbolic.svg"
    mv "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${_pkgname_original}-mute-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${_pkgname_new}-mute-symbolic.svg"
    mv "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${_pkgname_original}-attention-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${_pkgname_new}-attention-symbolic.svg"
}
