# Maintainer: qwq233 <qwq233@qwq2333.top>
pkgname=64gram-desktop-no-ad
_pkgname=64Gram
pkgver=1.0.24
pkgrel=1
pkgdesc='Unofficial desktop version of Telegram messaging app (removed ad)'
arch=('x86_64')
url="https://github.com/qwq233/64gram-aur"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'qt6-5compat'
         'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'xxhash' 'libdbusmenu-qt5' 'kwayland'
         'glibmm' 'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'libtg_owt' 
         'xz')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'extra-cmake-modules' 'gtk3' 'webkit2gtk' 'abseil-cpp')
optdepends=('gtk3: GTK environment integration'
            'webkit2gtk: embedded browser features'
            'ttf-opensans: default Open Sans font family'
            'xdg-desktop-portal: desktop integration')
provides=("64gram-desktop-no-ad")
conflicts=("telegram-desktop" "tdesktop-x64" "64gram-desktop")
replaces=("tdesktop-x64")
source=(
        "https://github.com/TDesktop-x64/tdesktop/releases/download/v$pkgver/64Gram-$pkgver-full.tar.gz"
        "fix-ffmpeg-build-for-tgcalls.patch"
        "remove-ad.patch"
        )
sha512sums=('2d268a91f99369470f75051892dbe3c4b82992b72924dffeb3a6c39387ac02f6e65fbeab00c693514efe782d3d38876765c82ec30a15015a911fffe2cb6ab6e5'
            '5f87b047179b570846440dc0315c156438e6bdd1e95326a6e239e1e9f0d110af368f283c0c242438e06f8da7d0494cb5b46db61b0ae65c1a9d9242de27caf34c'
            'de0662d33062a8c169003095f73ce69f352c21873620841fd53c075ec18990d643fe0a88536aa3f5b9cca2d52a69c01d3e2ce0b279549f0c0ceb0a907e7e3ff7')

prepare() {
    echo -e "Please enter the API ID and API HASH\nYou can get one from https://my.telegram.org/apps"
    echo -n "API ID: "
    read _API_ID
    echo -n -e "API HASH: " 
    read _API_HASH

    cd $_pkgname-$pkgver-full
    patch -p1 < ../remove-ad.patch
    cd Telegram/ThirdParty/tgcalls
    patch -p1 < ../../../../fix-ffmpeg-build-for-tgcalls.patch
    cd ../../../

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
