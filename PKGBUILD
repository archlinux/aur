# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

pkgbase=cubeb
pkgname=('cubeb' 'cubeb-docs')
pkgver=20240817
#_commit=48689ae7a73caeb747953f9ed664dc71d2f918d8
_commit=8f6c9a01ddd7c1ac8360b9a31c54e24826ad073f
pkgrel=2
pkgdesc="Cross platform audio library"
arch=('aarch64' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://github.com/mozilla/cubeb"
license=('ISC')
makedepends=('alsa-lib' 'cmake' 'doxygen' 'git' 'jack' 'libpulse' 'sndio' 'speexdsp')
conflicts=("$pkgname-git")
source=(git+$url#commit=$_commit)
b2sums=('defe0612774d2ca77cc5475c6cb579a67fc144b012a87d0329b30aa5785b5cbb17d29cc32c9fa51f0a4893a3fcb972a108212c21859c7ee0728b53168dcbe3b5')

pkgver() {
    cd "$srcdir/$pkgname"
    git log -n1 --pretty='format:%cd' --date=format:'%Y%m%d' $_commit
}

prepare() {
    cd "$srcdir/$pkgname"
    # https://github.com/mozilla/cubeb/issues/736
    sed -i '/cubeb_add_test(logging)/d' CMakeLists.txt
}

build() {
    cd "$srcdir"
    cmake -B build -S "$pkgname" \
		-DBUILD_SHARED_LIBS=ON \
		-DBUILD_TESTS=OFF \
		-DBUNDLE_SPEEX=OFF \
		-DCMAKE_BUILD_TYPE=None \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DUSE_SANITIZERS=OFF \
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
