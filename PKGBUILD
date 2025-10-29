# Maintainer: gudzpoz <gudzpoz at live dot com>

# This PKGBUILD heavily borrows from jdk17-temurin on AUR maintained by:
# Michael Lass <bevan at bi-co dot net>

_major=25
_minor=0.1
_build=+8.1

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
source_x86_64=("https://download.oracle.com/graalvm/25/archive/graalvm-jdk-${pkgver}_linux-x64_bin.tar.gz")
source_aarch64=("https://download.oracle.com/graalvm/25/archive/graalvm-jdk-${pkgver}_linux-aarch64_bin.tar.gz")
sha256sums_x86_64=('d4ab02ba1029e639f03374fdf91c242e1d0d49079880e1af1932ea7b7c431837')
sha256sums_aarch64=('edd77565c76570a6df5f38e53d54524102f2c1b1cf74eebd9f51e7fc19f667cd')

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
