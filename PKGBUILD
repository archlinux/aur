# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.8.0
pkgrel=1
pkgdesc="Patched libwacom for Microsoft Surface devices"
arch=('x86_64')
url="https://github.com/linux-surface/libwacom"
license=('MIT')
depends=('glib2' 'systemd' 'libgudev')
makedepends=('libxml2' 'meson')
checkdepends=('python-pytest' 'python-libevdev' 'python-pyudev')
optdepends=('python-libevdev: for libwacom-show-stylus')
validpgpkeys=(
    '594ABBA066118C7A02D10A80A8AF906D9307FBAD'
    '3C2C43D9447D5938EF4551EBE23B7E70B467F0BF'
)
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
    "0008-data-Add-Microsoft-Surface-Pro-7.patch"
    "0009-data-Add-Microsoft-Surface-Pro-8.patch"
    "0010-data-Add-Microsoft-Surface-Pro-9.patch"
    "0011-data-Add-Microsoft-Surface-Book.patch"
    "0012-data-Add-Microsoft-Surface-Book-2-13.5.patch"
    "0013-data-Add-Microsoft-Surface-Book-2-15.patch"
    "0014-data-Add-Microsoft-Surface-Book-3-13.5.patch"
    "0015-data-Add-Microsoft-Surface-Book-3-15.patch"
    "0016-data-Add-Microsoft-Surface-Laptop-Studio.patch"
)
sha256sums=('bb04b12c8688d0ff6a108d47a38d2057d572c4d7227d78138abd5fd0ba59f215'
            'SKIP'
            '0e00ada152317d16355cbfed8195397f3903f3d3448d19731d839367182d4cb6'
            'a092cc857a665204fc0284865186fddc7e746f0e4217f1c55a128265929e101f'
            '7380090427e166e2216742479925c44045cf914e3543615692850168d952f0c8'
            '33e4867394903376f110b674cc0a0b777313dfb4c7ff3a487e11e3735b95c604'
            '94903d479d0667870decdd57c51bee29d16feb199dc720844144e13745d77877'
            'f70a3faf5797b3db86c51fd2bf75a3f7fb95087231e8c998b3ce5b8a009f08da'
            '93931117dccec37684b8890e5ae28ac6c23e65517581e0269382252c81eeab2b'
            '57abca80d9be9e4d93d5ba83be92a576d0fef5186efcbb213c92cb5fa85e8b5f'
            '6886bd9f9a445830972d608f3edcd8381527c6ac553fcb4511559a2274ab4904'
            '7096f0e8d5b57c5e20e0616be98b77f6f5d300d7913d2e224f8a2b968872765d'
            'a61577739761a0730ed137cbd4c1151275ecabece7b9c35069e8de7fcf2786bc'
            '16e4c0124cf126735c321f5b2fd51d303f079a8892727981b2221a36a7d93c8f'
            'fe511c7ff2b39760aaee0617cedd7277cca4c49627fc476006bfb30bdd4bb35f'
            '5c4acfc9565d7743686792e6637e28a54f28abd9ab5a05bda072e34fab7f5af7'
            '227c278f19be81d8cd67556855b0e4e7bc0fd3059f9697b525506be2b076cfa9'
            '79a11214181e0e912e77e9013c7f35f7a44fc2f839d331371a227e1563985151')

prepare() {
    cd "libwacom-${pkgver}"

    for p in "${srcdir}/"*.patch ; do
        patch -Np1 -i "${p}" || true
    done
}

build() {
    rm -rf build
    meson setup build "libwacom-${pkgver}" --prefix="/usr"
    meson compile -C build
}

check() {
    # disabled for now...
    # ninja test -C build
    true
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
    install -D -m644 "libwacom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
