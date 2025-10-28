# Maintainer: gudzpoz <gudzpoz at live dot com>

# This PKGBUILD heavily borrows from jdk17-temurin on AUR maintained by:
# Michael Lass <bevan at bi-co dot net>

_major=25
_minor=0.1
_build=+8.1

pkgname="jdk${_major}-graalvm-ce-bin"
pkgver="${_major}.${_minor}"
pkgrel=1
pkgdesc="Advanced JDK with ahead-of-time Native Image compilation (Community Edition)"
arch=('x86_64' 'aarch64')
url='https://www.graalvm.org/'
license=('custom')

depends=('ca-certificates-java' 'java-runtime-common' 'java-environment-common')
provides=("java-runtime=${_major}" "java-runtime-headless=${_major}" "java-environment=${_major}")
options=('staticlibs' !debug !strip)
install=install_jdk25-graalvm-ce.sh
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${pkgver}/graalvm-community-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-${pkgver}/graalvm-community-jdk-${pkgver}_linux-aarch64_bin.tar.gz")
sha256sums_x86_64=('01e39fe1a87f28b842a3e4e3b77be9b544dca3a58fa6e93b924a6106c8bac7fb')
sha256sums_aarch64=('7aa0b9935a80e67f37c6025678393dbd123bb6f2226811decbc1a13093fc8ae2')

_jvmdir=/usr/lib/jvm/java-${_major}-graalvm-ce
_jdkdir="graalvm-community-openjdk-${pkgver}${_build}"

package() {

    install -dm 755 "${pkgdir}${_jvmdir}"
    cp -a "${srcdir}/${_jdkdir}"/* "${pkgdir}${_jvmdir}"

    cd "${pkgdir}${_jvmdir}"

    # Conf
    install -dm 755 "${pkgdir}/etc"
    mv conf "${pkgdir}/etc/java-${_major}-graalvm-ce"
    ln -sf "/etc/java-${_major}-graalvm-ce" conf

    # Legal
    install -dm 755 "${pkgdir}/usr/share/licenses"
    mv legal "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sf "/usr/share/licenses/${pkgname}" legal
    # Other licenses
    mv LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
    mv THIRD_PARTY_LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_LICENSE.txt"
    cp LICENSE_NATIVEIMAGE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_NATIVEIMAGE.txt"
    rm LICENSE_NATIVEIMAGE.txt # symlink

    # Man pages
    for f in man/man1/*; do
        install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-graalvm-ce${_major}.1}"
    done
    rm -rf man
    ln -sf /usr/share/man man

    # Link JKS keystore from ca-certificates-utils
    rm -f lib/security/cacerts
    ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

}
