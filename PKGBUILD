# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgbase=soapysddc-git
pkgname=(soapysddc-git libsddc-git)
pkgver=r271.7e2c0e2
pkgrel=1
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/ik1xpv/ExtIO_sddc"
license=('MIT')
depends=('libusb' 'fftw' 'soapysdr')
makedepends=('cmake' 'git')
source=("git+https://github.com/ik1xpv/ExtIO_sddc.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/ExtIO_sddc"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cmake -B build \
	    -S "$srcdir/ExtIO_sddc" \
	    -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
	    -DCMAKE_INSTALL_PREFIX=/usr
	# make -C build
    cmake --build build --config Release
}

package_soapysddc-git() {
    pkgdesc="Soapy SDR plugin for wideband SDR receivers like BBRF103, RX-666, RX888, HF103, etc"
    provides=(soapysddc)
    conflicts=(soapysddc)
	make -C build DESTDIR="$pkgdir/" install
}

package_libsddc-git() {
    pkgdesc="A low level library for wideband SDR receivers like BBRF103, RX-666, RX888, HF103, etc"
    provides=(libsddc)
    conflicts=(libsddc)
    install -Dm644 "$srcdir"/ExtIO_sddc/libsddc/libsddc.h "$pkgdir"/usr/include/libsddc.h
    cd build/libsddc
    mkdir -p "$pkgdir/usr/lib"
    for file in libsddc.so*; do
        cp -Pv $file "$pkgdir/usr/lib/$file"
    done
}
