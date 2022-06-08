# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.2.0
pkgrel=2
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('libxml2' 'meson')
checkdepends=('python-pytest' 'python-libevdev' 'python-pyudev')
optdepends=('python-libevdev: for libwacom-show-stylus')
validpgpkeys=('3C2C43D9447D5938EF4551EBE23B7E70B467F0BF')
conflicts=('libwacom')
provides=("libwacom=${pkgver}")

source=(
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.xz"{,.sig}
    "0001-Add-support-for-BUS_VIRTUAL.patch"
    "0002-Add-support-for-Intel-Management-Engine-bus.patch"
    "0003-data-Add-Microsoft-Surface-Pro-3.patch"
    "0004-data-Add-Microsoft-Surface-Pro-4.patch"
    "0005-data-Add-Microsoft-Surface-Pro-5.patch"
    "0006-data-Add-Microsoft-Surface-Pro-6.patch"
    "0007-data-Add-Microsoft-Surface-Pro-7.patch"
    "0008-data-Add-Microsoft-Surface-Book.patch"
    "0009-data-Add-Microsoft-Surface-Book-2-13.5.patch"
    "0010-data-Add-Microsoft-Surface-Book-2-15.patch"
    "0011-data-Add-Microsoft-Surface-Book-3-13.5.patch"
    "0012-data-Add-Microsoft-Surface-Book-3-15.patch"
)
sha256sums=('e62ac9edb522d36ad2fa99adca35ddc02067383d4668eeaa13d7efccc30bb8c8'
            'SKIP'
            'b7f7e9135d13b59bd927b7e89ee8a4762790773fe847531467d6c5c5fbec78fc'
            'b07c0e985a60d88c0ad6d590da8dedbfd451bcb70d4335625e19bad3127cfe09'
            '9b570ae66634c49d66cc38ef5a9e9acfe05a3344addeebce67d55b61dc42a383'
            '18b2eaa1b6f1f5a28741b245aa0681cd8741aba67c382a8aece6efd662711862'
            '13f597f8bdb08ad4f59c637d9f855f5e29f83597f07c7df46fe3c627a763512f'
            'c173dd7a6e0ed7308b3ac4787efaa31943179e3b32476202ce1bddc47363241b'
            '7061dbf6b75bfab6b25b86c418a2a6b53a78f33dd28f9749d4355ad2e20b10bf'
            '28edfbc01f108ded32d6e110aca218f099345653d05c0a9af5969bb979caa8bf'
            '501b297562b09348d1526eaaa98d1ebd0549534009f5febeb41a85c4151a60ac'
            'acc670872db7a6ed8c39da99e20027c0132a9f449bdde1ee196d607bd8980d7c'
            'e66e12e39359cbcbf369e70d096f91e75e5a44fea37e8ef6c65d93b40103a434'
            '11febceae805a7a12d3965f0903043002187ea3fdb9df3963cc7b9b19f926861')

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

check() {
    # disabled for now...
    # ninja test -C build
    true
}

package() {
    DESTDIR="${pkgdir}" ninja install -C build
    install -D -m644 "libwacom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
