# Maintainer: Peter Jung ptr1337 <admin@ptr1337.dev>
# Contributor: MedzikUser <nivua1fn@duck.com>

pkgname=forkgram
_pkgname=frk
pkgver=4.2.4
pkgrel=1
_kcorever=5.98.0
pkgdesc='Fork of Telegram Desktop messaging app.'
arch=('x86_64' 'x86_64_v3')
url="https://github.com/Forkgram/tdesktop"
license=('GPL3')
depends=('hunspell' 'ffmpeg4.4' 'hicolor-icon-theme' 'lz4' 'minizip' 'openal' 'ttf-opensans'
    	 'qt6-imageformats' 'qt6-svg' 'qt6-wayland' 'qt6-5compat' 'xxhash' 'glibmm'
		 'rnnoise' 'pipewire' 'libxtst' 'libxrandr' 'jemalloc' 'abseil-cpp' 'libdispatch')
makedepends=('cmake' 'git' 'ninja' 'python' 'range-v3' 'tl-expected' 'microsoft-gsl' 'meson'
			 'extra-cmake-modules' 'wayland-protocols' 'plasma-wayland-protocols' 'libtg_owt' 'qt6-tools')
optdepends=('webkit2gtk: embedded browser features'
			'xdg-desktop-portal: desktop integration')
provides=("telegram-desktop")
conflicts=("telegram-desktop" "tdesktop-x64")
replaces=("tdesktop-x64")
source=("https://github.com/Forkgram/tdesktop/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-full.tar.gz"
        "https://download.kde.org/stable/frameworks/${_kcorever%.*}/kcoreaddons-${_kcorever}.tar.xz"
        "https://invent.kde.org/frameworks/kcoreaddons/-/merge_requests/258.patch")
sha512sums=('a91473b93d8b1887fd98bb75cd2d1b7cde0772e6cb762f819bf4aef962d83b20f37e87ed3be67bb7f1e84c5b5af4969c63d0979cca0c2984c80642c7e2448689'
            '7370860c300a2ceb009622a3ed543ffda7cd36ae4a339abc6fb4bc39a08abbbd8d09eb5da08b2702e9dfa2db3c35572df654ff265275d3cd96b076123a022198'
            'fbb61e884094d3b259f0562809e1c058365346815541c85a3309b4f13e55629f9b14148d6a9c929ad5057901a26aaaef48fba6f094ef6484f81ff1a034cbf54f')

prepare() {
    cd $_pkgname-v$pkgver-full

    rm -rf Telegram/ThirdParty/libtgvoip/webrtc_dsp/absl

    cd ../kcoreaddons-$_kcorever
    patch -Np1 -i ../258.patch
}

build() {
    cd kcoreaddons-$_kcorever
    cmake \
            -B build \
            -G Ninja \
            -DCMAKE_BUILD_TYPE=Release \
            -DCMAKE_INSTALL_PREFIX="${srcdir}/kcoreaddons" \
            -DBUILD_TESTING=OFF \
            -DBUILD_WITH_QT6=ON \
            -DEXCLUDE_DEPRECATED_BEFORE_AND_AT=5.78.0 \
            -DBUILD_SHARED_LIBS=OFF
    ninja -C build
    ninja -C build install
    
    cd ${srcdir}/$_pkgname-v$pkgver-full
    export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'
    cmake . \
        -B build \
        -G Ninja \
        -DCMAKE_INSTALL_PREFIX="/usr" \
        -DKF5CoreAddons_DIR="${srcdir}/kcoreaddons/lib/cmake/KF5CoreAddons" \
        -DCMAKE_BUILD_TYPE=Release \
        -DDESKTOP_APP_DISABLE_AUTOUPDATE=ON \
        -DTDESKTOP_API_TEST=ON
    sed -i '/LINK_LIBRARIES/s/$/ \/usr\/lib\/liblzma.so/' build/build.ninja
    ninja -C build
}

package() {
    cd $_pkgname-v$pkgver-full
    DESTDIR="$pkgdir" ninja -C build install
    # They botched the release and put a lot of stuff here.
    rm -rf "$pkgdir/build"
}
