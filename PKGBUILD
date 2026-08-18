# Maintainer: gudzpoz <gudzpoz at live dot com>

# This PKGBUILD heavily borrows from jdk17-temurin on AUR maintained by:
# Michael Lass <bevan at bi-co dot net>

_major=25
_minor=2.4

# In the versioning scheme of GraalVM since JDK 25, three version numbers are
# relevant:
# - GraalVM release version: "GraalVM 25 Innovation 2" or 25i2
# - Graal compiler version: "graal 25.2.4"
# - Base JDK version: "jdk 25.0.4"
# We track the first (Graal compiler version) with this package since it is what
# they use in their release notes <https://www.graalvm.org/release-notes/25.1/>.

_release=25i2
_jdkver=25.0.4
_build=+7.1

pkgname="jdk${_major}-graalvm-ce-bin"
pkgver="${_major}.${_minor}"
pkgrel=1
pkgdesc="Advanced JDK with ahead-of-time Native Image compilation (Community Edition)"
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
install=install_jdk25-graalvm-ce.sh
source_x86_64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${pkgver}/graalvm-community-jdk-${_release}-${_jdkver}_linux-x64_bin.tar.gz")
source_aarch64=("https://github.com/graalvm/graalvm-ce-builds/releases/download/graal-${pkgver}/graalvm-community-jdk-${_release}-${_jdkver}_linux-aarch64_bin.tar.gz")
sha256sums_x86_64=('3f4a89de8eaa96f2ed677f09957c7e872cd8467aad3537f8b5394c1b8c4b942e')
sha256sums_aarch64=('22286f7ecd21b9aedb3226b9bf797469e1bd3eefc491e12ef3dd49b452d230b7')

_jvmdir=/usr/lib/jvm/java-${_major}-graalvm-ce
_jdkdir="graalvm-community-${pkgver}${_build}"

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
