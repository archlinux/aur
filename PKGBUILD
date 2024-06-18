# Maintainer: devome <evinedeng@hotmail.com>

_pkgname=photoprism-tensorflow
pkgname="${_pkgname}-cpu-bin"
pkgver="1.15.2"
pkgrel=1
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgdesc="PhotoPrism Tensorflow 1.15 with cpu base support"
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/tensorflow/tensorflow"
license=('Apache-2.0')
source_x86_64=("https://dl.photoprism.org/tensorflow/amd64/libtensorflow-amd64-${pkgver}.tar.gz")
source_arm=("https://dl.photoprism.org/tensorflow/arm/libtensorflow-arm-${pkgver}.tar.gz")
source_aarch64=("https://dl.photoprism.org/tensorflow/arm64/libtensorflow-arm64-${pkgver}.tar.gz")
sha256sums_x86_64=("6d9002dcf271a9c8ee18ce1170db7362d920dc50f74ab3b96de0ec3e829e9f37")
sha256sums_arm=("a7685f592fb6491610d001154678a28cec77ca1f8710cac12f77ac02ea2ac01d")
sha256sums_aarch64=("aa78f8be149682b93c4888f3207d7fe3068cc4cb31314bea75864f6926942519")

prepare() {
    case $CARCH in
        x86_64|aarch64)
            mv include/tensorflow/c/LICENSE LICENSE
            ;;
        arm)
            mv -f "lib/libtensorflow.so.${pkgver}" lib/libtensorflow.so
            mv -f "lib/libtensorflow_framework.so.${pkgver}" lib/libtensorflow_framework.so
            ;;
    esac
}

package() {
    install -Dm644 *"LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    find include -type f -exec install -Dm644 {} "${pkgdir}/usr/"{} \;
    for so in libtensorflow.so libtensorflow_framework.so; do
        install -Dm755 "lib/${so}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver}"
        ln -s "${so}.${pkgver}"     "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%.*}"
        ln -s "${so}.${pkgver%.*}"  "${pkgdir}/usr/lib/${_pkgname}/${so}.${pkgver%%.*}"
        ln -s "${so}.${pkgver%%.*}" "${pkgdir}/usr/lib/${_pkgname}/${so}"
    done
}
