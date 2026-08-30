# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=soapy-malahit-rr-git
_pkgname=SoapyMalahitRR
pkgver=r74.8538d46
pkgrel=1
pkgdesc="SoapySDR module for Malahit RR SDR receiver"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/luarvique/SoapyMalahitRR"
license=('MIT')
depends=('soapysdr' 'alsa-lib' 'libgpiod-1.6' 'bash')
provides=('soapy-malahit-rr' "$_pkgname")
conflicts=('soapy-malahit-rr' "$_pkgname")
makedepends=('cmake' 'git')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    cmake -B build \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=lib
    cmake --build build
}

package() {
    cd "$srcdir/${_pkgname}"
    DESTDIR="${pkgdir}" cmake --install build

    # Install firmware file
    install -Dm644 malahit-fw/malahit-r1-fw-111.bin "${pkgdir}/usr/share/malahit/malahit-r1-fw-111.bin"

    # Install systemd service
    install -Dm644 malahit-id/malahit-id.service "${pkgdir}/usr/lib/systemd/system/malahit-id.service"

    # Install systemd service helper script
    install -Dm755 malahit-id/malahit-id.sh "${pkgdir}/usr/share/malahit/malahit-id.sh"

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
