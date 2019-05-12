# Maintainer: Daniel Gray <dng@disroot.org>
_libname=sejda
pkgname=java-${_libname}
pkgver=3.2.73
pkgrel=1
pkgdesc="An extendible and configurable PDF manipulation layer library written in java"
arch=('any')
url="https://github.com/torakiki/sejda"
license=('AGPL3')
depends=('java-runtime-headless')
makedepends=('maven')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/torakiki/sejda/archive/v${pkgver}.tar.gz")
sha256sums=('70e265edbe3620f1080bd69e2d16affda4032e7adf175e9b0667b2c6c064f922')
_M2_REPO=$(mktemp -d)

build() {
    cd "${srcdir}/${_libname}-${pkgver}"
    mvn -Dmaven.repo.local="${_M2_REPO}" \
    clean \
    package \
    -Dmaven.test.skip=true
}

package() {
    sed -i ':a;N;$!ba;s/REPO=\n/REPO=\/usr\/share\/java\/sejda\n/' \
           "${srcdir}/${_libname}-${pkgver}"/sejda-console/target/assembled/bin/sejda-console

    install -Dm755 "${srcdir}/${_libname}-${pkgver}"/sejda-console/target/assembled/bin/sejda-console \
                    -t "${pkgdir}"/usr/bin

    install -Dm644 "${srcdir}/${_libname}-${pkgver}"/sejda-console/target/assembled/lib/*.jar \
                    -t "${pkgdir}"/usr/share/java/sejda

    install -Dm644 "${srcdir}/${_libname}-${pkgver}"/LICENSE \
                    "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE
}
