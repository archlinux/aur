# Maintainer: John Ramsden <johnramsden [at] riseup [dot] net>

pkgname=zectl
pkgver=0.1.1
pkgrel=4
pkgdesc="ZFS Boot Environment manager."
url="http://github.com/johnramsden/${pkgname}"
arch=('any')
license=('MIT')
depends=('zfs')
makedepends=('make' 'cmake')
conflicts=("${pkgname}-git")
provides=("zectl")

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/johnramsden/${pkgname}/archive/v${pkgver}.tar.gz"
    "0001-Remove-libspl-no-longer-needed.patch"
)

sha256sums=('3103d955b990c9b67ba1c7b50b4c712a7edea605f37ff167c4f71a6756f13cf8'
            '6d826973996382d893df5958c6aeaed237aed4077b6e12bcbeb97e578d86c3ee')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch --forward --strip=1 --input="${srcdir}/0001-Remove-libspl-no-longer-needed.patch"
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    CFLAGS+=" -fmacro-prefix-map=$PWD/=" cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DPLUGINS_DIRECTORY=/usr/share/zectl/libze_plugin .
    make VERBOSE=1
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/docs/zectl.8" "${pkgdir}/usr/share/man/man8/zectl.8"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
