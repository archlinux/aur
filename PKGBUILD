# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

pkgname=libwacom-surface
pkgver=1.2
pkgrel=1
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
    '0002-data-Add-Microsoft-Surface-Book-2-13.5.patch'
    '0003-data-Add-Microsoft-Surface-Pro-5.patch'
    '0004-data-Add-Microsoft-Surface-Book-2-15.patch'
    '0005-data-Add-Microsoft-Surface-Pro-6.patch'
    '0006-data-Add-Microsoft-Surface-Pro-4.patch'
    '0007-data-Add-Microsoft-Surface-Book.patch'
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=('eb0f32d5e33cb07cfb66c97ac6303383387ccfb97e808865cf056c21c3998ba4'
            'abf0137ec6ac8aee8e77b2d33423a4a90689660558bbb9bfef41b43f72170d4d'
            '55384a33ddb4761729d8915a3709160dfc2c076b103c4072b2a46c0cb24a44b6'
            'fb16b33addc6c44401c2e36e8f3d5d244d6c76e036a64cf4988c679de8687cb2'
            '833227f52f050c368e6ca5908aa7534238b96afb5d8a0df8413b14dd63891a9a'
            'dde9d2328c6c6112656f1537efb2bc8f0f50d96570b055acef1628a2442b464a'
            '6f7f5f849e460110fad9304b275e4f9f2d880165faed124305b1bf2391c6958f'
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
