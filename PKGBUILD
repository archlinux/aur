# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

pkgbase=cubeb
pkgname=('cubeb' 'cubeb-docs')
pkgver=20250911
_commit=6f5a5986d356da246475e152132f62c0b556da52
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
b2sums=('19ed11a96d2bc7ee7301de558765331d6b93597ab7147960757202117856854aa02456ac136d9270c2a6249297846cf711200815707a501b51a7f52e0c64846e'
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
