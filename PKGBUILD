# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=onair
pkgver=0.2.6
pkgrel=2
pkgdesc="SDR receiver for digital TV (DVB-T/T2, DVB-S/S2, ATSC), DAB+, FM, DRM, ADS-B, GNSS and DMR"
arch=('x86_64' 'aarch64')
url="https://github.com/adswill/OnAir"
license=('GPL-3.0-or-later')
# codec2 and mbelib are loaded at run time via dlopen (libcodec2.so.1.2 / libmbe.so.1
# are searched in /usr/lib), so the system packages from [extra] are used instead of
# the vendored copies. The two do not conflict with the vendored ones either way:
# the vendored codec2 is installed as a private libcodec2.so.1.2 under /usr/lib/onair
# (merely shadowing the system one at run time) and the vendored mbelib is linked
# statically, installing no files at all. If the system libraries ever prove
# unusable, fall back to the vendored ones: drop the codec2/mbelib depends and
# remove -DDECT2_BUNDLE_CODEC2=OFF and -DDECT2_BUNDLE_MBELIB=OFF below.
depends=('ffmpeg' 'glibc' 'libgcc' 'libstdc++' 'glfw' 'hackrf' 'hicolor-icon-theme' 'libusb' 'soapysdr'
         # dlopen'd at run time, so namcap reports them as "may not be needed" - that is expected
         'codec2'   # FreeDV / M17 voice (dlopen'd, replaces vendored third_party/codec2)
         'mbelib')  # DMR / P25 / NXDN / dPMR / D-STAR voice (dlopen'd, replaces vendored third_party/mbelib)
makedepends=('cmake' 'pkgconf')
optdepends=('zenity: file dialogs'
            'soapyrtlsdr: RTL-SDR support through SoapySDR'
            'soapyairspy: Airspy support through SoapySDR'
            'soapysdrplay: SDRplay support through SoapySDR')
conflicts=('onair-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adswill/OnAir/archive/refs/tags/v$pkgver.tar.gz"
        # the udev-rule / blacklist fix-it hints tell the user to run
        # install-udev-rules.sh, which only exists in the source tree (the
        # official .deb has the same dangling hint); the package already
        # installs 60-onair-sdr.rules and the modprobe blacklists, so reword
        # the hints to reload the installed rules instead
        "onair-package-hints.patch")
sha256sums=('ca8f2a50ba3ad3c7e8a07c52519d97596f6667962266b6204d68574c5681d605'
            '1e772949b8182e8994b31503ddcb93bb50f8cd525c445d03afcfb4e5243770be')

prepare() {
    patch -Np1 -d "OnAir-$pkgver" -i "$srcdir/onair-package-hints.patch"
}

build() {
    # app/dtmb_ui.cpp passes a runtime fmt string to ImGui::Text (safe: callers
    # pass literals); relax Arch's -Werror=format-security for this build
    export CXXFLAGS="$CXXFLAGS -Wno-error=format-security"
    cmake -B build -S "OnAir-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DDECT2_BUILD_APP=ON \
        -DDECT2_BUILD_TESTS=ON \
        -DDECT2_BUNDLE_CODEC2=OFF \
        -DDECT2_BUNDLE_MBELIB=OFF \
        -DCMAKE_SKIP_INSTALL_ALL_DEPENDENCY=ON \
        -DONAIR_VERSION="$pkgver" \
        -Wno-dev
    # only the app and the two CLI tools are installed; skip compiling the test
    # suite and benchmarks that DECT2_BUILD_TESTS=ON would otherwise add to `all`
    cmake --build build --target dect2 dect2cli dect2scan
}

package() {
    DESTDIR="$pkgdir" cmake --install build
}
