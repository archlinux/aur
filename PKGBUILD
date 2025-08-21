# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

pkgbase=cubeb
pkgname=('cubeb' 'cubeb-docs')
pkgver=20250813
_commit=46b2f23a2929fc367a8cd07a43975dda1e2ebc69
pkgrel=1
pkgdesc="Cross platform audio library"
arch=('aarch64' 'armv7h' 'i686' 'pentium4' 'x86_64')
url="https://github.com/mozilla/cubeb"
license=('ISC')
makedepends=('alsa-lib' 'cmake' 'ninja' 'doxygen' 'git' 'jack' 'libpulse' 'sndio' 'speexdsp')
conflicts=("$pkgname-git")
source=(git+$url#commit=$_commit
	git+https://github.com/google/googletest.git
	git+https://github.com/arsenm/sanitizers-cmake.git
	git+https://github.com/mozilla/cubeb-coreaudio-rs.git
	git+https://github.com/mozilla/cubeb-pulse-rs.git)
b2sums=('8b4e9e070b7b9786e5c5db0cf3704f6454c84b0797ef23326cd7df06eefe18c8c0bb0485ac54e0470a6b104bc9505a885f7f241ef25947bcd2e9124520615ff5'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git log -n1 --pretty='format:%cd' --date=format:'%Y%m%d' $_commit
}

prepare() {
    cd "$srcdir/$pkgname"
    # https://github.com/mozilla/cubeb/issues/736
    sed -i '/cubeb_add_test(logging)/d' CMakeLists.txt
    git submodule init
    git config submodule.googletest.url "$srcdir/googletest"
    git config submodule.cmake/sanitizers-cmake.url "$srcdir/sanitizers-cmake"
    git config submodule.src/cubeb-coreaudio-rs.url "$srcdir/cubeb-coreaudio-rs"
    git config submodule.src/cubeb-pulse-rs.url "$srcdir/cubeb-pulse-rs"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir"
    cmake -B build -S "$pkgname" \
    -G Ninja \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTS=OFF \
    -DBUNDLE_SPEEX=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DUSE_SANITIZERS=ON \
    -Wno-dev
    cmake --build build
}

package_cubeb() {
 optdepends+=(
    'alsa-lib: for ALSA backend'
    'jack: for JACK backend'
    'libpulse: for PulseAudio backend'
    'sndio: for sndio backend')
    depends+=('libspeexdsp.so' 'glibc' 'gcc-libs')
    provides+=("$pkgname=$pkgver" 'libcubeb.so')

    cd "$srcdir"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    rm -rf "$pkgdir/usr/share/doc"
}
package_cubeb-docs() {
	arch=('any')
	cd "$srcdir"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 "$srcdir/cubeb/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	rm -rf "$pkgdir/usr/lib" "$pkgdir/usr/bin" "$pkgdir/usr/include"
}
