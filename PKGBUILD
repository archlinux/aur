# Maintainer: SteamedFish <steamedfish@hotmail.com>

pkgname=onair
pkgver=0.2.9
pkgrel=1
pkgdesc="SDR receiver for digital TV (DVB-T/T2, DVB-S/S2, ATSC), DAB+, FM, DRM, ADS-B, GNSS and DMR"
arch=('x86_64' 'aarch64')
url="https://github.com/adswill/OnAir"
license=('GPL-3.0-or-later')
# codec2 and mbelib are loaded at run time via dlopen (libcodec2.so.1.2 / libmbe.so.1
# are searched in /usr/lib), so the system packages from [extra] are used instead of
# the vendored copies. The two do not conflict with the vendored ones either way:
# the vendored codec2 is installed as a private libcodec2.so.1.2 under /usr/lib/onair
# (merely shadowing the system one at run time), and since 0.2.8 upstream no longer
# bundles mbelib at all (dlopen is the only way). If the system libraries ever prove
# unusable, fall back to the vendored codec2: drop the codec2 depend and remove
# -DDECT2_BUNDLE_CODEC2=OFF below.
depends=('ffmpeg' 'glibc' 'libgcc' 'libstdc++' 'glfw' 'hackrf' 'hicolor-icon-theme' 'libusb' 'soapysdr'
         # dlopen'd at run time, so namcap reports them as "may not be needed" - that is expected
         'codec2'   # FreeDV / M17 voice (dlopen'd, replaces vendored third_party/codec2)
         'mbelib')  # DMR / P25 / NXDN / dPMR / D-STAR voice (dlopen'd, upstream ships no copy since 0.2.8)
makedepends=('cmake' 'pkgconf' 'rust')  # rust: core protocol/FEC/file/net layers are Rust-only since 0.2.8
optdepends=('zenity: file dialogs'
            'soapyrtlsdr: RTL-SDR support through SoapySDR'
            'soapyairspy: Airspy support through SoapySDR'
            'soapysdrplay: SDRplay support through SoapySDR'
            'onair-dra: DRA/DRA+ audio decoder for CDR radio sound (dlopened at run time)')
conflicts=('onair-bin')
source=("$pkgname-$pkgver.tar.gz::https://github.com/adswill/OnAir/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9d4655e1635b0be6b92b851d8b01f00dccc03ebcc71e6de542c10c0700a292d4')

prepare() {
    # The udev-rule / blacklist fix-it hints tell the user to run
    # install-udev-rules.sh, which only exists in the source tree (the official
    # .deb has the same dangling hint). The package already installs
    # 60-onair-sdr.rules and the modprobe blacklists, so reword the hints to
    # reload the installed rules instead (mirrors the .deb postinst).
    # String-based (not a context diff) so it survives upstream churn: 0.2.7
    # touched the lines and 0.2.8 moved the files (app/fixit.cpp ->
    # app/panels/fixit.cpp), breaking the patch each release. Fails loudly if
    # dangling script references remain that we do not know how to rewrite.
    local src="OnAir-$pkgver"
    grep -rq 'install-udev-rules' "$src/app" "$src/core" --include='*.cpp' --include='*.h' || {
        echo 'onair: no dangling udev-script hints found, nothing to rewrite'
        return 0
    }
    local cmd='sudo udevadm control --reload-rules \&\& sudo udevadm trigger --subsystem-match=usb'
    local f
    while IFS= read -r f; do
        sed -i \
            -e "s|sudo ./install-udev-rules.sh   # in the OnAir folder; then unplug and replug the radio|$cmd   # the onair package already installed the udev rules; then unplug and replug the radio|g" \
            -e "s|Install OnAir's udev rules (install-udev-rules.sh), then unplug and replug the radio.|Reload the udev rules installed by the onair package, then unplug and replug the radio.|g" \
            -e "s|Install the udev rules (install-udev-rules.sh), then unplug and replug the radio.|Reload the udev rules installed by the onair package, then unplug and replug the radio.|g" \
            -e "s|Install the udev rules: run install-udev-rules.sh from the OnAir folder (the .deb package does it for you).|Reload the udev rules installed by the onair package: $cmd.|g" \
            -e "s|Install the udev rules: run install-udev-rules.sh from the OnAir folder (the .deb does it).|Reload the udev rules installed by the onair package ($cmd).|g" \
            -e "s|Or install OnAir's blacklist file (the .deb package does it).|OnAir's blacklist file is already installed by the onair package.|g" \
            -e "s|Install OnAir's blacklist file (the .deb package does it), or run: sudo systemctl restart sdrplay|OnAir's blacklist file is already installed by the onair package; or run: sudo systemctl restart sdrplay|g" \
            -e "s|unplug and replug it after installing OnAir's blacklist file (the .deb does it), or restart the SDRplay API service|unplug and replug it (OnAir's blacklist file is already installed by the onair package), or restart the SDRplay API service|g" \
            -e "s|install OnAir's udev rules (the .deb does it, or run install-udev-rules.sh from the portable folder), then unplug and replug it|reload OnAir's udev rules (already installed by the onair package) with $cmd, then unplug and replug it|g" \
            "$f"
    done < <(grep -rl 'install-udev-rules' "$src/app" "$src/core" --include='*.cpp' --include='*.h')
    if grep -rq 'install-udev-rules' "$src/app" "$src/core" --include='*.cpp' --include='*.h'; then
        echo 'onair: dangling install-udev-rules.sh references remain after rewrite;' >&2
        echo 'upstream changed the hint strings, the rewrite rules need a review' >&2
        return 1
    fi
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
