# Maintainer: gudzpoz <gudzpoz at live dot com>

# This PKGBUILD heavily borrows from jdk17-temurin on AUR maintained by:
# Michael Lass <bevan at bi-co dot net>

_major=25
_minor=6.5.1

# In the versioning scheme of GraalVM since JDK 25, three version numbers are
# relevant:
# - GraalVM release version: "GraalVM 25 Innovation 6" or 25i6
# - Graal compiler version: "graal 25.6.5.1"
# - Base JDK version: "jdk 25.0.5.1"
# We track Graal compiler version with this package since it is what they use in
# their release notes <https://www.graalvm.org/release-notes/25.6/>.

_release=25i6
_jdkver=25.0.5.1
_build=+4.1

pkgname="jdk${_major}-graalvm-bin"
pkgver="${_major}.${_minor}"
pkgrel=1
pkgdesc="Advanced JDK with ahead-of-time Native Image compilation"
arch=('x86_64' 'aarch64')
url='https://www.graalvm.org/'
license=('custom')

depends=(
    'ca-certificates-java' 'java-runtime-common' 'java-environment-common'
    'freetype2' 'glibc' 'libgcc' 'libstdc++' 'libz.so'
)
optdepends=(
    'alsa-lib: for basic sound support'
    'libx11: for AWT support'
    'libxext: for AWT support'
    'libxi: for AWT support'
    'libxrender: for AWT support'
    'libxtst: for AWT support'
)
provides=("java-runtime=${_major}" "java-runtime-headless=${_major}" "java-environment=${_major}")
options=('staticlibs' !debug !strip)
install=install_jdk25-graalvm.sh
source_x86_64=("https://gds.oracle.com/download/graal/${_release}/archive/graalvm-jdk-${_release}-${_jdkver}_linux-x64_bin.tar.gz")
source_aarch64=("https://gds.oracle.com/download/graal/${_release}/archive/graalvm-jdk-${_release}-${_jdkver}_linux-aarch64_bin.tar.gz")
sha256sums_x86_64=('c258365739c022ee2189bc83dac72c3627f34cb0b02668e4bd3969380ed54b69')
sha256sums_aarch64=('aa02942ba8a8860e330737919d5b77c28489fc56661d500bdb1436ab96d11799')

_jvmdir=/usr/lib/jvm/java-${_major}-graalvm
_jdkdir="graalvm-${pkgver}${_build}"

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
