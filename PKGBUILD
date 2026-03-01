# Maintainer: Michael <your@email.example>
# Provides a DKMS kernel module for the ITE IT5570 embedded controller
# fan sensor found on certain mini-PCs and embedded boards.

pkgname=it5570-fan-dkms
pkgver=0.1.0
pkgrel=1
pkgdesc="hwmon driver for ITE IT5570 EC fan control (DKMS)"
arch=('x86_64')
url="https://github.com/passiveEndeavour/it5570-fan"
license=('GPL-2.0-only')
depends=('dkms')
optdepends=(
    'linux-headers: build for the stock Arch kernel'
    'linux-cachyos-headers: build for the CachyOS kernel'
    'linux-zen-headers: build for the Zen kernel'
)
# No compiled source in the AUR package - DKMS builds at install time.
# The source tarball / git tag is fetched from GitHub.
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('58613116132613be851e368bbc01674ea8380c646d776917eaad4d0305c1bfa89f405347ce17c4f0fa7dadaf6cfae45925054bb5a9a4a0fbf73bc141966fc40f')

package() {
    local _srcdir="it5570-fan-${pkgver}"
    local _dkmsdir="${pkgdir}/usr/src/it5570-fan-${pkgver}"

    install -dm755 "${_dkmsdir}"

    # Only ship the files DKMS needs - no build artefacts
    install -m644 "${_srcdir}/it5570_fan.c" "${_dkmsdir}/"
    install -m644 "${_srcdir}/Makefile"     "${_dkmsdir}/"
    install -m644 "${_srcdir}/dkms.conf"    "${_dkmsdir}/"

    # Substitute the placeholder written during `makepkg` time so DKMS sees
    # the exact version string it registered under.
    sed -e "s/@PKGVER@/${pkgver}/g" \
        -i "${_dkmsdir}/dkms.conf"

    # Auto-load the module at boot (safe: driver self-detects and exits on
    # unsupported hardware with -ENODEV).
    install -Dm644 "${_srcdir}/it5570_fan.conf" \
        "${pkgdir}/usr/lib/modules-load.d/it5570_fan.conf"
}
