# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>
# Based on official Arch Linux PKGBUILD

pkgname=libwacom-surface
pkgver=2.0.0
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
sha256sums=('b2110eced57007d601e4ed18644f0f44ceff357aede0ee321794d214fa038881'
            '0f43297b2248df9df0d315edb25a1f9e30e86a9a2c13d1260cf66ec7c7c42d3c'
            '7a2886015574ddaffdbf3462255064831a03e4a6df0152d10516e1639824ab19'
            '0cc9ae1d12bb2d72f2c465326ae94bb0ce6bd3fb85a8c21ad4d64ee386bdce22'
            '8026b2bbf840fe8e24897a740b4cc8ee0eb807440c9cd4502750823b022eeaef'
            '51c09e64e452d41a3a2ed98fa01a1283c51f6e3e517083baaba42af2262894fe'
            '25d3831c5d090d9053690f6b8d683e155789d05db116b14c23a3f8604e58b2db'
            'b9633f0c292a0f385fdd8e8a2d1fa0214e0dd5aedf18460a92230b021dcb8b07'
            '4cd9ac66a493ec2a363154f682066aabb3c3b1f89f459addabcef3a4a00efcdf'
            '55e2dabee35ad1d6e8df0703afdd75344a08b2e56898255e31c722eb07341b47'
            '447507d06e842d1e83d90fa454b828e1a7a487619c57b1d62ac73bbdeb2cb4b1'
            '4923bdf3e7b4940bd81d3e7c1b8ab1843597a1bdf1e6f627840e0c87c381fe0a'
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
