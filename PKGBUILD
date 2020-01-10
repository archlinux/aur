# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

pkgname=libwacom-surface
pkgver=1.2
pkgrel=2
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('git' 'libxml2')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
conflicts=('libwacom')
provides=("libwacom=${pkgver}")

source=(
    '0001-Add-support-for-Intel-Management-Engine-bus.patch'
    '0002-data-Add-Microsoft-Surface-Pro-4.patch'
    '0003-data-Add-Microsoft-Surface-Pro-5.patch'
    '0004-data-Add-Microsoft-Surface-Pro-6.patch'
    '0005-data-Add-Microsoft-Surface-Book.patch'
    '0006-data-Add-Microsoft-Surface-Book-2-13.5.patch'
    '0007-data-Add-Microsoft-Surface-Book-2-15.patch'
    '0008-data-Add-Microsoft-Surface-Go.patch'
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=('7c4ff319dcf48debca4445d18ef10a50435d41a54f9d2b9ca0b41a238c3d76de'
            '281d6d13129cb04809bf94dc7d8bc631f04d2cb99f5d2e890d4f69086f206048'
            'e1813105d44b1ad289853a73795b0b86701a750202f6733100ee0c4bd457e283'
            'd166a0f37f39ffa186ee2577940465f1bc70d00b8bb75e15af6dffa82233c401'
            '78cbe7898e896fd594610a58c2dc2972348bbc3b89ff21f880687fb0b9190d74'
            'b05ba743fd4315906fbcfa1dd8f13ce3c09ca4b7dbd05d9b17353827880f8d3b'
            '65173fcf181e9346aab610598cf1155aa83ee89af6cd9b767d5e27482e25c928'
            '3d9bbeab1447996089181d5dd7ff1331e87dfbb5b292b280cfa0e51f0250230d'
            'c204cfdee2159d124a4f5ecc8970bbd72f9adf5ad7fd94b66798f93db1f863c3'
            'SKIP')

prepare() {
    cd "libwacom-${pkgver}"

    for p in "${srcdir}/"*.patch ; do
        patch -Np1 -i "${p}" || true
    done
}

build() {
    cd "libwacom-${pkgver}"
    ./configure --prefix="/usr"
    make
}

check() {
    cd "libwacom-${pkgver}"
    make check
}

package() {
    cd "libwacom-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m755 -d "${pkgdir}/usr/lib/udev/rules.d"
    cd "tools"
    ./generate-udev-rules > "${pkgdir}/usr/lib/udev/rules.d/65-libwacom.rules"
}
