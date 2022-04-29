# Maintainer: qwq233 <qwq233@qwq2333.top>
pkgname=64gram-desktop-no-ad
_pkgname=64Gram
pkgver=1.0.34
pkgrel=1
pkgdesc='Unofficial desktop version of Telegram messaging app (removed ad)'
arch=('x86_64')
url="https://github.com/qwq233/64gram-aur"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'qt6-5compat'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'libdbusmenu-qt5' 'kwayland'
         'glibmm' 'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'libtg_owt' 
         'xz' 'qt6-base')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'extra-cmake-modules' 'gtk3' 'webkit2gtk' 'abseil-cpp')
optdepends=('gtk3: GTK environment integration'
            'webkit2gtk: embedded browser features'
            'ttf-opensans: default Open Sans font family'
            'xdg-desktop-portal: desktop integration')
provides=("64gram-desktop-no-ad")
conflicts=("telegram-desktop" "tdesktop-x64" "64gram-desktop")
replaces=("tdesktop-x64")
source=("https://github.com/TDesktop-x64/tdesktop/releases/download/v$pkgver/64Gram-$pkgver-full.tar.gz"
        "remove-ad.patch")

sha512sums=('8d11ff44d9b8a384180dab7cc4b03b58fba84819b092eb5044d32c27078c885d59b2e0c052336c33cd6c7c8bf40fec547e6724b8bb888efccbc46b481b44b27f'
            'de0662d33062a8c169003095f73ce69f352c21873620841fd53c075ec18990d643fe0a88536aa3f5b9cca2d52a69c01d3e2ce0b279549f0c0ceb0a907e7e3ff7')

prepare() {
    echo -e "Please enter the API ID and API HASH\nYou can get one from https://my.telegram.org/apps"
    echo -n "API ID: "
    read _API_ID
    echo -n -e "API HASH: " 
    read _API_HASH

    cd $_pkgname-$pkgver-full
    patch -p1 < ../remove-ad.patch

    cmake . \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_BUILD_TYPE=Release \
        -DTDESKTOP_API_ID=$_API_ID \
        -DTDESKTOP_API_HASH=$_API_HASH \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON
    python -c 'with open("build/build.ninja","+r") as f:t=f.read();t=t.replace("LINK_LIBRARIES =","LINK_LIBRARIES = /usr/lib/liblzma.so.5");f.seek(0,0);f.write(t);f.truncate();'

}

build() {
    cd $_pkgname-$pkgver-full
    ninja -C build
}

package() {
    cd $_pkgname-$pkgver-full
    DESTDIR=$pkgdir ninja -C build install
}
