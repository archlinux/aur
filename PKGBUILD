# Maintainer: Alesar1
# Contributor: solopasha <daron439 at gmail dot com>
# Contributor: KspLite <ksplite@outlook.com>
# Contributor: Daniil Kovalev <daniil@kovalev.website>
pkgname=64gram-desktop
_pkgname=64Gram
pkgver=1.0.85
pkgrel=1
epoch=1
pkgdesc='Unofficial desktop version of Telegram messaging app'
arch=('x86_64')
url="https://github.com/TDesktop-x64/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm-2.68'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch'
         'openssl' 'protobuf' 'boost-libs')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
             'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt'
             'gobject-introspection' 'glib2' 'boost' 'fmt' 'p7zip')
optdepends=('webkit2gtk: embedded browser features'
            'xdg-desktop-portal: desktop integration')
provides=(telegram-desktop)
conflicts=(telegram-desktop)
source=("https://github.com/TDesktop-x64/tdesktop/releases/download/v${pkgver}/${_pkgname}-${pkgver}-full.tar.gz"
        "block-sponsored_messages.patch"
        "fix-lzma-link.patch"
        expected-lite-$pkgver.tar.gz::https://github.com/martinmoene/expected-lite/archive/refs/tags/v0.6.3.tar.gz
        https://gitlab.com/mnauw/cppgir/-/archive/960fe054ffaab7cf55722fea6094c56a8ee8f18e/cppgir-960fe054ffaab7cf55722fea6094c56a8ee8f18e.tar.gz
        https://github.com/desktop-app/cmake_helpers/commit/6b0eeb2c15aa278ffa577bcefebcff8f2c98aca9.patch)
noextract=("${_pkgname}-${pkgver}-full.tar.gz")
sha512sums=('f4b2e281879994e43836bb2bab320de8166495e696a5230a8ec67b549fcf27a43f8800563e3449803ee363052a1c6a6c6ec8495f86d53892f6f5063ebccc1bf1'
            'c662524ca4f4a8df021ee94696d84896ed9a271df321933942806dda4544ea25f51a650ec8b4fc72f9a2219ea54cbfaf37b9604124f7263c86f74f1d647587ae'
            'd813a5ac6ff2208b693ecf494d7bf036087e223662f9f34aaaeafea0afe0fe798e867b9610f7221ea80319865502c20b61310d5a31634b888793873d63322463'
            'd6a4f30f90494dda002ad27d227f17ce0201752178418d7dfada26441e853590d46816c88922e7d458dda68ad4414ddfe6b7fa4ed2a5854e4e3b22675b13f92a'
            '8ed54513511ec8ce6d7c9c311924b6d662102ffec3af75ccc8c4ebc6d48aaf162fd004b9c5fd31e50b83bc5872e82674eeaa2766423d9dc7d2338eb941ae8d40'
            '6d69aae0b470ac4d6cc90cfc241b185c6c483065cae8ff94532950bec2b7047d95f0c5002f460e09d8143f723ad7e1b2c767c2725ac0d456a64b78702bf510ea')

prepare() {
    7za x ${_pkgname}-${pkgver}-full.tar.gz
    tar -xvf ${_pkgname}-${pkgver}-full.tar
    cd $_pkgname-$pkgver-full
    patch -Np1 --binary -i ../block-sponsored_messages.patch
    patch -p1 --binary < ../fix-lzma-link.patch
    cd $srcdir
    tar xf "$srcdir"/expected-lite-$pkgver.tar.gz -C $_pkgname-$pkgver-full/cmake/external/glib/cppgir/expected-lite --strip-components 1
    tar xf "$srcdir"/cppgir-960fe054ffaab7cf55722fea6094c56a8ee8f18e.tar.gz -C $_pkgname-$pkgver-full/cmake/external/glib/cppgir --strip-components 1
}

build() {
    CXXFLAGS+=' -ffat-lto-objects'
    cmake \
        -B build \
        -S $_pkgname-$pkgver-full \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON \
        -DTDESKTOP_API_TEST=ON
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 /dev/null "$pkgdir/etc/tdesktop/externalupdater"
}
