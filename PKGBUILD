# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgname=cubeb
pkgver=20221208
_commit=51728e55cd9e11088da414d6ae1e21ef10cd83de
pkgrel=3
pkgdesc="Cross platform audio library"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/mozilla/cubeb"
license=('ISC')
makedepends=('alsa-lib' 'cmake' 'doxygen' 'git' 'jack' 'libpulse' 'sndio' 'speexdsp')
checkdepends=('gtest')
optdepends=(
    'alsa-lib: for ALSA backend'
    'jack: for JACK backend'
    'libpulse: for PulseAudio backend'
    'sndio: for sndio backend'
)
provides=("$pkgname=$pkgver" 'libcubeb.so')
conflicts=("$pkgname-git")
source=(git+$url#commit=$_commit)
b2sums=('SKIP')

pkgver() {
    cd $pkgname
    git log -n1 --pretty='format:%cd' --date=format:'%Y%m%d' $_commit
}


build() {
    cd $pkgname
    cmake -B build \
		-DBUILD_SHARED_LIBS=ON \
		-DBUILD_TESTS="$CHECKFUNC" \
		-DBUNDLE_SPEEX=OFF \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_C_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_CXX_FLAGS_RELEASE="-DNDEBUG" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_SANITIZERS=OFF \
		-Wno-dev
    cmake --build build
}

check() {
    cd $pkgname
    ctest --test-dir build -E 'audio|callback_ret|device_changed_callback|devices|duplex|latency|record|sanity|tone'
}

package() {
    depends+=('libspeexdsp.so')

    cd $pkgname
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
