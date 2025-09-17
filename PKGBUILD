# Maintainer: gudzpoz <gudzpoz at live dot com>

# This PKGBUILD heavily borrows from jdk17-temurin on AUR maintained by:
# Michael Lass <bevan at bi-co dot net>

_major=25
_minor=0.0
_build=+37.1

pkgname="jdk${_major}-graalvm-bin"
pkgver="${_major}.${_minor}"
pkgrel=1
pkgdesc="Advanced JDK with ahead-of-time Native Image compilation"
arch=('x86_64' 'aarch64')
url='https://www.graalvm.org/'
license=('custom')

depends=('ca-certificates-java' 'java-runtime-common' 'java-environment-common')
provides=("java-runtime=${_major}" "java-runtime-headless=${_major}" "java-environment=${_major}")
options=('staticlibs' !debug !strip)
install=install_jdk25-graalvm.sh
source_x86_64=("https://download.oracle.com/graalvm/25/archive/graalvm-jdk-25_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/25/archive/graalvm-jdk-25_linux-aarch64_bin.tar.gz")
sha256sums_x86_64=('04dba85ddce0df752d6d69e0476676fdad0998b7da5d3a0f9aad1fe6e3ffa1c5')
sha256sums_aarch64=('a468ab5483d74f3d29dfdaa9c9b29b29261a3a9e49786d21c4a9c00b06c156ea')

_jvmdir=/usr/lib/jvm/java-${_major}-graalvm
_jdkdir="graalvm-jdk-${_major}${_build}"

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
