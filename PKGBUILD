# Maintainer: peippo <christoph+aur@christophfink.com>

pkgname=java-r5rcore
pkgver=0.7.0
pkgrel=1

pkgdesc="Rapid Realistic Routing with 'R5' (java engine for R package)"
url="https://github.com/ipeaGIT/r5r"
license=("MIT")

arch=("i686" "x86_64")

depends=("jdk11-openjdk" "java-r5" "java-environment")
makedepends=("git")

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ipeaGIT/r5r/archive/refs/tags/v${pkgver}.tar.gz"
    "01-gridpointset-extent-post-v6.4.patch"
)
sha512sums=(
    "5bbd5b6d0b5b6b8f53168df2ca1a3054c1e97ad9c564fa77790fdc9b7b8017a99d4a01e5ea10f48dffa6ee7f07474e3b7c9e27b2c4a9fad55152a38e3ad4fcf6"
    "414a5609c81a17f2f4e27d6338c5d5da7c229869a8471f531538ba590503e0d75d6611096c0ec125018db5e6e053f510409a3dcf0d6a697f90eac25b5b49506c"
)

prepare() {
    cd "r5r-${pkgver}/${pkgname}"
    for _patch in "${srcdir}/"[0-9][0-9]-*.patch; do
        patch --forward --strip=1 --input="${_patch}"
    done
}

build() {
    cd "r5r-${pkgver}/${pkgname}"

    javac \
        --class-path=/usr/share/java/r5/r5-all.jar \
        -d lib \
        $(find src -name "*.java")

    cd lib
    jar \
        -cf ../${pkgname}.jar \
        $(find . -name "*.class")
}

package() {
    cd "r5r-${pkgver}"

    install \
        -Dm0644 \
        "${pkgname}/${pkgname}.jar" \
        "${pkgdir}/usr/share/java/${pkgname}/${pkgname}.jar"

    install \
        -Dm0644 \
        LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
