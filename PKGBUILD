# Maintainer: solonovamax <solonovamax@12oclockpoint.com>
# Contributors: Felix Golatofski <contact@xdfr.de>, Philippe Hürlimann <p@hurlimann.org>
pkgname=kotlin-native
pkgver=1.6.10
pkgrel=1
pkgdesc="An LLVM based backend for the Kotlin compiler and native implementation of the Kotlin standard library"
arch=("x86_64")
url="https://github.com/JetBrains/kotlin"
license=("Apache")
options=("staticlibs" "libtool" "!strip")
depends=("java-environment" "ncurses5-compat-libs")
provides=("kotlin-native")
conflicts=("kotlin-native-bin" "kotlin-native-git")
source=(
    "https://github.com/JetBrains/kotlin/archive/refs/tags/v${pkgver}.tar.gz"
    "local.properties"
)
sha512sums=(
    "9157871c53a7c78a0cdd512c984f385cbcb6e9a930faa279623902dff1dfc8e788d6e20a940d2c19d3ffc3519f632e0e87605c38b5f5fe24eea921ca74672611"
    "88cae75baaacdbe35fb421a00fae0994fc0728f1b8ee1af3c111fbd0fc135db2c03965ac1ae19580eea1400805852cd04b3da0d7c379b0add90c85b05ee34f26"
)

prepare() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"

    # Copy local.properties
    cp "${srcdir}/local.properties" "./local.properties"

    ./gradlew -M sha256,md5 :kotlin-native:dependencies:update
}

build() {
    cd ${srcdir}/${_pkgname}-${_pkgver}
    ./gradlew :kotlin-native:bundle
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

#    install -D -m644 "license/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd "kotlin-native/"

    install -m755 -d "${pkgdir}/opt/kotlin-native/"
    install -m755 -d "${pkgdir}/usr/bin/"

    cp -R "kotlin-native/dist" "${pkgdir}/opt/kotlin-native/"

    ln -s "/opt/kotlin-native/bin/cinterop" "${pkgdir}/usr/bin/cinterop"
    ln -s "/opt/kotlin-native/bin/generate-platform" "${pkgdir}/usr/bin/generate-platform"
    ln -s "/opt/kotlin-native/bin/jsinterop" "${pkgdir}/usr/bin/jsinterop"
    ln -s "/opt/kotlin-native/bin/klib" "${pkgdir}/usr/bin/klib"
    ln -s "/opt/kotlin-native/bin/konanc" "${pkgdir}/usr/bin/konanc"
    ln -s "/opt/kotlin-native/bin/konan-lldb" "${pkgdir}/usr/bin/konan-lldb"
    ln -s "/opt/kotlin-native/bin/kotlin-native" "${pkgdir}/usr/bin/kotlinc-native"
    ln -s "/opt/kotlin-native/bin/run_konan" "${pkgdir}/usr/bin/run_konan"
}
