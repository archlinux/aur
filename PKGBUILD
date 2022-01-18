# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=1.12.1
pkgrel=1
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('libxml2' 'meson')
checkdepends=('python-pytest' 'python-libevdev' 'python-pyudev')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
conflicts=('libwacom')
provides=("libwacom=${pkgver}")

source=(
    '0001-Add-support-for-BUS_VIRTUAL.patch'
    '0002-Add-support-for-Intel-Management-Engine-bus.patch'
    '0003-data-Add-Microsoft-Surface-pro-4.patch'
    '0004-data-Add-Microsoft-Surface-pro-5.patch'
    '0005-data-Add-Microsoft-Surface-pro-6.patch'
    '0006-data-Add-Microsoft-Surface-pro-7.patch'
    '0007-data-Add-Microsoft-Surface-Book.patch'
    '0008-data-Add-Microsoft-Surface-Book-2-13.5.patch'
    '0009-data-Add-Microsoft-Surface-Book-2-15.patch'
    '0010-data-Add-Microsoft-Surface-Book-3-13.5.patch'
    '0011-data-Add-Microsoft-Surface-Book-3-15.patch'
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=('f0dd37c1fb5df159a8596c5d587a7108774a72b6394823973b62f713821fa2a6'
            '1f3c8de1abfbcbdf629f894cddd1e48e798f88f709c00f7fb87196a90fa4605f'
            '07710600984df95875b58aa59fffbea30257079e1bffedce606c926aa508be5d'
            'c5b6ffc46b923a4dfc1ed1a999548650a617aa2320348b5f69f45dc2388ba6b0'
            '0ac63f53a79dc20813f9c190005ad9ce073812e12a359557efb1b1aaba13416c'
            '1c4526b1b30a8b9c5dac6491d1c36cb5d6537e1cd497b9ee365c3a90232e956c'
            '662505e626143f5136c43831e49b232633da6ef6b4787ac5236dfbf812e2771c'
            '48fd58dc30ca4bc862a1e77b4e0bd4e50e078239e877e85d5fb36640cd882bc5'
            '73f750ad8bda8c94dc74d13e2475f5b3c1e6584c33ac47780272aac84ae3d7e8'
            '83aace4c8e1040cba959b79f5a5d05c44652b7f21fc1d75b358065c93b48e4d8'
            'b1a4577d1f0c39b2e7b5b1eb59a427abbc01d6f19a9fd8111dc1148c1dc44942'
            '053687f64fdb1c8947cf0e54743c47bfcfba8ef3cb22466a1faa1e2c37ccb315'
            'SKIP')

prepare() {
    cd "libwacom-${pkgver}"

    for p in "${srcdir}/"*.patch ; do
        patch -Np1 -i "${p}" || true
    done
}

build() {
    meson build "libwacom-${pkgver}" --prefix="/usr"
    ninja -C build
}

# disabled for now...
#check() {
#    ninja test -C build
#}

package() {
    DESTDIR="${pkgdir}" ninja install -C build
    install -D -m644 "libwacom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
