# Maintainer: Maximilian Luz <luzmaximilian@gmail.com>

pkgname=libwacom-surface
pkgver=1.3
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
    '0002-data-Add-Microsoft-Surface-Pro-4.patch'
    '0003-data-Add-Microsoft-Surface-Pro-5.patch'
    '0004-data-Add-Microsoft-Surface-Pro-6.patch'
    '0005-data-Add-Microsoft-Surface-Book.patch'
    '0006-data-Add-Microsoft-Surface-Book-2-13.5.patch'
    '0007-data-Add-Microsoft-Surface-Book-2-15.patch'
    '0008-data-Add-Microsoft-Surface-Go.patch'
    "https://github.com/linuxwacom/libwacom/releases/download/libwacom-${pkgver}/libwacom-${pkgver}.tar.bz2"{,.sig}
)
sha256sums=('3f5cf68310477c21dbe05ca213d95010188b7cf54a2d98d6ef7c0adad776b210'
            'f0a4f080be79cd088618c23ab083fdfcea1102af879d0385e658845226f82dc6'
            '9b343d6906d7b39872e6f9d7cd249fdd093b85dc279dfd6e77eb09dd05b61321'
            '4df6930caad3eb93337d1d18b6e622265f3dafa8e51e5e8bbb276aca8f84b561'
            '9967cab88d7ac8ea56f3525cd025103f79bd5bce2a4471c62c526bf64e90259f'
            '48fc778b0c8c9874dbb21b91b1ab81fa6d4fd6c51fb49099e28d6ffe18cc48d6'
            'aba10fe7bdcf2c292211cfd49c1041f7b9c1a782a0f3a8e4f701aa70cd5e607f'
            '64f62919b95f0b942aa59670a9c6691e43f50c562120636f1841b9e12f6d2354'
            'e19ce00fe1e074cc54ffd198dda6c6f1ec389e5c913134adc8795f2c5e63883c'
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
