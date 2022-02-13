# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.1.0
pkgrel=1
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
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.xz"{,.sig}
)
sha256sums=('40b6834ae423f68f68d3fbd7852aa58eafaa9adb0a29ce132f762e778954553d'
            '17a27e9f495ce0d710aa6425bb6edfa5f4123f181754f776d06c4c4fc6f53749'
            '55dc40c5ac58e977c5017ab98dea47a5e8791773aa331229e6afdf0d32d10841'
            'b6abf69199222b849a499d02eed379ef265d5576787993933978a25a9af2b5be'
            'ad7d7ae6b2deac85f6ca3b0838c5a9be28c7a535d18f2396e9a97addc214b8ec'
            'bb07abc8e74b45531721d79d4602918b301d92dc9e74201e88aefac231cb2e3c'
            'ec9f0bdbed0b136453cf571724cbae06fff2236da2bbf22b143c4d0f48756b20'
            '10ebf14c928c6074e5b08498e6155fa5f13e8c15d7d69f09f5e47b9f168d5256'
            '89225dde12a795f700d090a484a04e5da01d1d47b792bf4f7128135a70a0a66d'
            'aaab03d55d1fcfed17ea4d6de838cab3a3774d2b8ce0070bea6647d1a211401f'
            '8ff37ac6631be6851c6a521a1e852b182b4cdd6735206ab19056db8735920772'
            'b900899589c4c1f83e6671a2383a3437cfa70c3a275cb266bddbbc6c4eaf71a2'
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

check() {
    # disabled for now...
    # ninja test -C build
    true
}

package() {
    DESTDIR="${pkgdir}" ninja install -C build
    install -D -m644 "libwacom-${pkgver}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
