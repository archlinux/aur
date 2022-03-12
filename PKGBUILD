# Maintainer: qwq233 <qwq233@qwq2333.top>
pkgname=64gram-desktop-no-ad
_pkgname=64Gram
pkgver=1.0.23
pkgrel=1
pkgdesc='Unofficial desktop version of Telegram messaging app (removed ad)'
arch=('x86_64')
url="https://github.com/TDesktop-x64/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal'
         'qt5-imageformats' 'qt5-svg' 'xxhash' 'libdbusmenu-qt5' 'kwayland' 'glibmm'
         'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'libtg_owt' 'xz')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl'
             'extra-cmake-modules' 'gtk3' 'webkit2gtk')
optdepends=('gtk3: GTK environment integration'
            'webkit2gtk: embedded browser features'
            'ttf-opensans: default Open Sans font family'
            'xdg-desktop-portal: desktop integration')
provides=("64gram-desktop-no-ad")
conflicts=("telegram-desktop" "tdesktop-x64" "64gram-desktop")
replaces=("tdesktop-x64")
source=(
        "fix-ffmpeg-build-for-tgcalls.patch"
        "remove-ad.patch"
        )
sha512sums=(
        "6866bf7169210e7ce3fe91a9aab5940a56ab213a43283b50188368e03981881bae66e5aff1e28dba756325f8dcde58b3a69809fd09e5e2d68b882d13da2e309e"
        "23ef22dd165804b91b0eb357b98145c6fd29c8b82e9c93d0c0daf8f9ef6966bc44150a70e51bd9b978bd6e86f1cb6cd594a06215b6c3e83a74fecc4dd8250358"
        )

prepare() {
    echo -e "Please enter the API ID and API HASH\nYou can get one from https://my.telegram.org/apps"
    echo -n "API ID: "
    read _API_ID
    echo -n -e "API HASH: " 
    read _API_HASH

    git clone https://github.com/TDesktop-x64/tdesktop tdesktop-$pkgver -b v$pkgver --recurse-submodules
    cd tdesktop-$pkgver
    git am ../remove-ad.patch
    cd Telegram/ThirdParty/tgcalls
    git am ../../../../fix-ffmpeg-build-for-tgcalls.patch
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
    cd tdesktop-$pkgver
    ninja -C build
}

package() {
    cd tdesktop-$pkgver
    DESTDIR=$pkgdir ninja -C build install
}
