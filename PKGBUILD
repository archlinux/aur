# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgbase=soapysddc-git
pkgname=(soapysddc-git libsddc-git)
pkgver=r274.331b35c
pkgrel=4
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

prepare() {
    cd "$srcdir/ExtIO_sddc"
    # aarch64: upstream CMake only recognises x86_64 / arm* and probes 32-bit HWCAP_NEON.
    # CMAKE_SYSTEM_PROCESSOR on 64-bit ARM is "aarch64" -> used to hit FATAL_ERROR "Unable to identify CPU".
    sed -i 's/MATCHES "arm\.\*"/MATCHES "^(arm.*|aarch64)$"/' Core/CMakeLists.txt
    sed -i 's/^    if(APPLE)$/    if(APPLE OR "${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "aarch64")/' Core/CMakeLists.txt
    # HWCAP_NEON does not exist on aarch64 (NEON is mandatory there)
    perl -0pi -e 's/unsigned long caps = getauxval\(AT_HWCAP\);\s*\n\s*return \(caps & HWCAP_NEON\);/unsigned long caps = getauxval(AT_HWCAP);\n#if defined(__aarch64__)\n\t\t(void)caps;\n\t\treturn true;\n#else\n\t\treturn (caps \& HWCAP_NEON);\n#endif/' Core/fft_mt_r2iq.cpp
    # fail loudly if upstream reshuffles these files instead of silently dropping aarch64 support
    grep -q 'MATCHES "^(arm.*|aarch64)$"' Core/CMakeLists.txt || { echo "ERROR: aarch64 CMakeLists patch did not apply" >&2; return 1; }
    grep -q '__aarch64__' Core/fft_mt_r2iq.cpp || { echo "ERROR: aarch64 HWCAP_NEON patch did not apply" >&2; return 1; }
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

	install -Dm644 "$srcdir"/ExtIO_sddc/LICENSE.txt "$pkgdir"/usr/share/licenses/soapysddc-git/LICENSE
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

	install -Dm644 "$srcdir"/ExtIO_sddc/LICENSE.txt "$pkgdir"/usr/share/licenses/libsddc-git/LICENSE
}
