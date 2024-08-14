# Maintainer: Alesar1
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: KspLite <ksplite@outlook.com>
# Contributor: Daniil Kovalev <daniil@kovalev.website>
pkgname=0wgram
pkgver=1.4.0
pkgrel=1
epoch=1
pkgdesc='Unofficial desktop version of Telegram messaging app'
arch=('x86_64' 'aarch64')
url="https://github.com/clansty/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'ada'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'glib2' 'libsigc++-3.0'
         'libxcomposite' 'libvpx' 'libxdamage' 'kcoreaddons' 'jemalloc' 'openh264')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'boost' 'fmt' 'mm-common' 'perl-xml-parser' 'python-packaging'
             'dos2unix' 'glib2-devel')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')

commit="1576cacb687060713733754e3952cbc27d42b93b"
source=("git+${url}.git#commit=${commit}"
        "fix-lzma-link.patch")

sha512sums=('4efad218af2e45c6254f6ba7584445486ca96fff6f00f9288aa81d6b7fc2f2c2320e440dda270cb26a15e1cd86175692c05bb0b0784fadc0bde69b3fbca96ee6'
            'e15cdc8513793f17e4b6ca2dfab5b4bbf22d0934c1e88038957b9004865edb4101a3133482708aab6844de3c1dfdac9c98970de684c1508634180d90c84345f7')

prepare() {
    cd tdesktop
    git submodule update --init --recursive
    patch -p1 --binary < ../fix-lzma-link.patch
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'

    cmake \
        -B build \
        -S tdesktop \
        -G Ninja \
        -DCMAKE_VERBOSE_MAKEFILE=ON \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON \
        -DTDESKTOP_API_ID=16138177 \
        -DTDESKTOP_API_HASH=f14e4d935dcd9f002e44b2698aeb2466
        # -DTDESKTOP_API_TEST=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    mv "$pkgdir/usr/bin/telegram-desktop" "$pkgdir/usr/bin/${pkgname}"
    find "$pkgdir" -type f -name "telegram.png" -exec rename telegram.png ${pkgname}.png {} \;
    mv "$pkgdir/usr/share/icons/hicolor/symbolic/apps/telegram-symbolic.svg" "$pkgdir/usr/share/icons/hicolor/symbolic/apps/${pkgname}-symbolic.svg"
    mkdir -p "$pkgdir/usr/share/${pkgname}/externalupdater.d"
    echo "/usr/bin/${pkgname}" > "$pkgdir/usr/share/${pkgname}/externalupdater.d/telegram-desktop.conf"
}
