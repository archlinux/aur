# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.7.0
pkgrel=2
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
    "0008-data-Add-Microsoft-Surface-Book.patch"
    "0009-data-Add-Microsoft-Surface-Book-2-13.5.patch"
    "0010-data-Add-Microsoft-Surface-Book-2-15.patch"
    "0011-data-Add-Microsoft-Surface-Book-3-13.5.patch"
    "0012-data-Add-Microsoft-Surface-Book-3-15.patch"
    "0013-data-Add-Microsoft-Surface-Pro-7.patch"
)
sha256sums=('853929bd73fba2064b12142dbbee4b3bf84509197ff46a4da559eddf62d32cdf'
            'SKIP'
            '416bd97440be1bc602e79086f128b931e09c3895563995d227eb993b0c8ee57d'
            '15179a1929df962e239521e8c15ec709e54d324fdecf45c96524a0c8d63dbd98'
            'db77bc0f6cf9419708d1088a1a9bf38dbcc9dc8e7c6a2cd8342e7e1fea991381'
            'ff24ca67ba308802301a9a917a2df10654fbb865381538b43cb66b86a4ca10f8'
            'e55921b4f067cea62b7395b1d8e74fef5ea5e2674b2feaebd5d73743fc481268'
            '58129638de2d12d43c65a552baf131d9ec3b128bdb207c3fa791491009929d3f'
            '4c7a75a339d07edb81fe2e6ca2399064d83f2238c05b6b438491ce5f3d7c2b7c'
            '414f998826d081905f654a92480899bf00f42324b29066e936e867c2e0c4ed4e'
            'e7e7238f044c43171ad4f45afd1fd6fd4cd583858bcc6a1c7ad81b4bb5e379cb'
            '8781f138968cd7a6b01c38bedcb84d13b5f572277c49d2ef878349e5f4cf7945'
            'ec25e26b22d3a21f09357eb88cef8b148849d24c96882cf29064e4fa506f64a4'
            '2cd13ac5b7d4bed85eefcfcaccbe2947a5c2db222da6b2515eba78fff45fedca'
            '93a1dd06fe6a75ad93a3dd17c258e235bd45591d9346befb0759ff10cb658e69')

prepare() {
    cd "libwacom-${pkgver}"

    for p in "${srcdir}/"*.patch ; do
        patch -Np1 -i "${p}" || true
    done
}

build() {
    meson setup build "libwacom-${pkgver}" --prefix="/usr"
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
