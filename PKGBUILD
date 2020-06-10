# Maintainer: Filipp Andjelo <filipp dot andjelo at gmail.com>

pkgname=elgato-gchd-git
pkgver=r147.e5bc6b9
pkgrel=2
pkgdesc="Elgato Game Capture HD Driver"
arch=('i686' 'x86_64')
url="https://github.com/tolga9009/elgato-gchd"
license=('MIT')
depends=('libusb')
makedepends=('git' 'cmake' 'p7zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
    "git+${url}.git" 
    "https://edge.elgato.com/egc/windows/egcw/3.70/final/GameCaptureSetup_3.70.43.3043_x64.msi"
)
sha256sums=(
    'SKIP'
    '8f4a81e0e4cc794eaf1c9e33c2c8ade8b345de1e524369fc7e31d8dff3f83d5e'
)

pkgver() {
	cd "${srcdir}/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p "${srcdir}/firmware"
    7z e -aoa -o"${srcdir}" GameCaptureSetup_3.70.43.3043_x64.msi x86_yPushFile3.dll
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
          -DCMAKE_INSTALL_PREFIX="/usr"
    cmake --build "${srcdir}/build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"
    for f in ${srcdir}/firmware/*; do
        install -D -m644 -t "${pkgdir}/usr/lib/firmware/gchd/" "$f"
    done
    for f in ${srcdir}/${pkgname%-git}/udev-rules/*; do
        install -D -m644 -t "${pkgdir}/etc/udev/rules.d/" "$f"
    done
}
