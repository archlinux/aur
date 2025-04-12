# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=dumphfdl
pkgver=1.6.1
pkgrel=2
pkgdesc="Multichannel HFDL decoder"
arch=('x86_64' 'aarch64')
url="https://github.com/szpajder/dumphfdl"
license=('GPL3')
depends=('libacars' 'glib2' 'liquid-dsp' 'fftw' 'libconfig' 'soapysdr' 'sqlite' 'statsd-c-client' 'zeromq')
makedepends=('cmake' 'git')
optdepends=(
	'libsdrplay: Proprietary API service for SDRplay devices.'
	'gperftools: for profiling'
)
source=(
    "$pkgname"::"git+https://github.com/szpajder/dumphfdl#tag=v${pkgver}"
    detect_liquid_dsp_version.patch
)
sha256sums=(
    'SKIP'
    'd1c9922e68b08b922865a1cab03b81d0fcadb310f7b664618645f58c0368b93a'
)

prepare() {
    cd "$srcdir/$pkgname"
    pwd
    patch -p1 < $srcdir/detect_liquid_dsp_version.patch
}


build() {
	cmake -B build \
	    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	    -S "$srcdir/$pkgname" \
	    -DCMAKE_INSTALL_PREFIX=/usr
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir/" install
}
