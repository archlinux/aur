# Maintainer: derivativeoflog7 <derivativeoflog7+aur at outlook dot com>
# Contributor: Filipp Andjelo <filipp dot andjelo at gmail.com>

pkgname=elgato-gchd-git
pkgver=r148.463e19f
pkgrel=1
pkgdesc="Elgato Game Capture HD Driver"
arch=('i686' 'x86_64')
url="https://github.com/Sir-Boops/elgato-gchd"
license=('MIT')
depends=('libusb')
makedepends=('git' 'cmake' 'p7zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "git+${url}.git" 
    "https://edge.elgato.com/egc/windows/egcw/3.70/final/GameCaptureSetup_3.70.56.3056_x64.msi"
)
sha256sums=(
    'SKIP'
    '403b03518ac5170e52238fdbc5ce757b9901b16e123101ec5db2c46d640ae949'
)

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p "${srcdir}/firmware"
    7z e -aoa -o"${srcdir}" GameCaptureSetup_3.70.56.3056_x64.msi x86_yPushFile3.dll
    7z e -aoa -o"${srcdir}/firmware" -r "${srcdir}/x86_yPushFile3.dll" \
        MB86H57_H58_IDLE \
        MB86H57_H58_ENC_H \
        MB86M01_ASSP_NSEC_IDLE \
        MB86M01_ASSP_NSEC_ENC_H
}

build() {
    cmake -B "${srcdir}/build" \
          -S "$srcdir/${pkgname%-git}" \
          -DCMAKE_BUILD_TYPE=Release \
          -DCMAKE_INSTALL_PREFIX="/usr" \
          -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    cmake --build "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    for f in ${srcdir}/firmware/*; do
        install -D -m644 -t "${pkgdir}/usr/lib/firmware/gchd/" "$f"
    done
    for f in ${srcdir}/${pkgname%-git}/udev-rules/*; do
        install -D -m644 -t "${pkgdir}/usr/lib/udev/rules.d" "$f"
    done
    echo "*****"
    echo "To run the driver without requiring root permissions, follow these instructions starting from step 2:"
    echo "https://github.com/tolga9009/elgato-gchd/wiki/Configuring-the-Driver-to-be-Run-Without-Root-Permissions"
    echo "*****"
}
