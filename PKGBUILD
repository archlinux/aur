# Maintainer: gudzpoz <gudzpoz at live dot com>

# This PKGBUILD heavily borrows from jdk17-temurin on AUR maintained by:
# Michael Lass <bevan at bi-co dot net>

_major=25
_minor=0.2
_build=+10.1

pkgname="jdk${_major}-graalvm-bin"
pkgver="${_major}.${_minor}"
pkgrel=1
pkgdesc="Advanced JDK with ahead-of-time Native Image compilation"
arch=('x86_64' 'aarch64')
url='https://www.graalvm.org/'
license=('custom')

depends=('ca-certificates-java' 'java-runtime-common' 'java-environment-common')
optdepends=('onnxruntime: machine learning-driven static profiling')
provides=("java-runtime=${_major}" "java-runtime-headless=${_major}" "java-environment=${_major}")
options=('staticlibs' !debug !strip)
install=install_jdk25-graalvm.sh
source_x86_64=("https://download.oracle.com/graalvm/25/archive/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/25/archive/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")
sha256sums_x86_64=('af545b1bc12ecd24a5ba95e2370da2163e87c4cf13991a482d5b176bf4165c12')
sha256sums_aarch64=('e0e18106fa1d8628d8ba21f548865211d7c8608a3423f7b25cb2aa4eef9abf10')

_jvmdir=/usr/lib/jvm/java-${_major}-graalvm
_jdkdir="graalvm-jdk-${pkgver}${_build}"

package() {

    install -dm 755 "${pkgdir}${_jvmdir}"
    cp -a "${srcdir}/${_jdkdir}"/* "${pkgdir}${_jvmdir}"

    cd "${pkgdir}${_jvmdir}"

    # Conf
    install -dm 755 "${pkgdir}/etc"
    mv conf "${pkgdir}/etc/java-${_major}-graalvm"
    ln -sf "/etc/java-${_major}-graalvm" conf

    # Legal
    install -dm 755 "${pkgdir}/usr/share/licenses"
    mv legal "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sf "/usr/share/licenses/${pkgname}" legal
    # Other licenses
    mv LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    mv license-information-user-manual.zip "${pkgdir}/usr/share/licenses/${pkgname}/license-information-user-manual.zip"

    # Man pages
    for f in man/man1/*; do
        install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-graalvm${_major}.1}"
    done
    rm -rf man
    ln -sf /usr/share/man man

    # Link JKS keystore from ca-certificates-utils
    rm -f lib/security/cacerts
    ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

}
