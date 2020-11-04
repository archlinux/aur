# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=1.6
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
    '0012-data-Add-Microsoft-Surface-Go.patch'
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=('21c0495cdbbac8950727e3699a851214ae4b67f24dffbc562eaa7a4dbd9c8947'
            '9f49d987d534564149caa089cdb6fb99582d7c6ecd3c46a6be6ac910bff47de9'
            'fc091b56ab73c56ee0a4a7c387b1881ae6c57d4120e6e41ef209ee31e596b56f'
            'd7c4993dff271a181215a01cd29979629aad3becfe41dcacc59d46824e907b1d'
            '1907a57c2f276a51356becfe50265af60eb17870667e4b3a99046216f1526812'
            'c64344b92c60312ea4c9928fe04a1f69174f5c99567f2fd7590d143efb71a234'
            '5159e9e33c9e54b2321d4ecf94e1e446a2d9be296f2b998c1d809666cb3ebd3e'
            '636f68a054c6ef286c7926acdb0d8c97ca673668beb96b04a1fdb55875d136eb'
            '8982215d8c61705f04deb96b00239a6343e361703699e5dedbb20dceae3356f6'
            'd5381abd62a44d7886c743316de941b2cb940ccf5eb04ee55326cdc0bb05bd8f'
            '6086082b23267fa991edd8ad623f43bcc4924a17f0fa5f5ba994cf0ce24f5fd2'
            '4637cbcd280def21e74c23b1c2b37427a5a8e94ccdad864a49d9f337600fdcae'
            '701cb23ee3f2ad4eb5183ef1421dfff3e5b7622e5d3bb6fcd599190a7d77aea8'
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
    make DESTDIR="$pkgdir" install
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -m755 -d "${pkgdir}"/usr/lib/udev/rules.d
    cd tools
    ./generate-hwdb > "${pkgdir}"/usr/lib/udev/hwdb.d/65-libwacom.hwdb
}
