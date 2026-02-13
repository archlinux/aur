# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

pkgbase=cubeb
pkgname=('cubeb' 'cubeb-docs')
pkgver=20260123
_commit=484857522c73318c06f18ba0a3e17525fa98c608
pkgrel=1
pkgdesc="Cross platform audio library"
arch=('aarch64' 'armv7h' 'i686' 'pentium4' 'x86_64')
url="https://github.com/mozilla/cubeb"
license=('ISC')
makedepends=('alsa-lib' 'cmake' 'doxygen' 'git' 'jack' 'libpulse' 'sndio' 'speexdsp' 'cargo')
conflicts=("$pkgname-git")
source=(git+$url#commit=$_commit
	git+https://github.com/google/googletest.git
	git+https://github.com/arsenm/sanitizers-cmake.git
	git+https://github.com/mozilla/cubeb-coreaudio-rs.git
	git+https://github.com/mozilla/cubeb-pulse-rs.git)
b2sums=('50e3ecbdc35898fef39e1ba85a53a01121f8cb6b4be323532e0e41ecdfa33b5be1d29444d75adbaeb79dad42a8bcb000630986bc849d332b7eeb2c4567b42c07'
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
    export CFLAGS="$CFLAGS -ffat-lto-objects"
    cmake -B build -S "$pkgname" \
    -DBUILD_SHARED_LIBS=ON \
    -DBUILD_TESTS=OFF \
    -DBUNDLE_SPEEX=OFF \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_RUST_LIBS=ON \
    -Wno-dev
    cmake --build build
}

package_cubeb() {
 optdepends+=(
    'alsa-lib: for ALSA backend'
    'jack: for JACK backend'
    'sndio: for sndio backend')
    depends+=('libspeexdsp.so' 'glibc' 'gcc-libs' 'libpulse')
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
