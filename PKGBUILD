# Maintainer: D. Can Celasun <can[at]dcc[dot]im>
# Contributor: tarball <bootctl@gmail.com>

_java=25

pkgname=mandrel-bin
pkgver=25.0.5.1
pkgrel=1
pkgdesc='Downstream distribution of GraalVM CE serving as the native-image builder for Quarkus'
arch=('x86_64' 'aarch64')
url='https://github.com/graalvm/mandrel'
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
provides=("java-runtime=${_java}" "java-runtime-headless=${_java}" "java-environment=${_java}" 'mandrel')
options=('staticlibs' !debug !strip)
install=install_mandrel.sh

_fullver="${pkgver}-Final"
_urlbase="https://github.com/graalvm/mandrel/releases/download/mandrel-${_fullver}/mandrel-java${_java}-linux"
source_x86_64=("${_urlbase}-amd64-${_fullver}.tar.gz")
source_aarch64=("${_urlbase}-aarch64-${_fullver}.tar.gz")
sha256sums_x86_64=('309f959bdc34f8e808e782079d84eb9f7dc16fb2115b2775f65143715a357bcf')
sha256sums_aarch64=('038ac5284a40b09eb7449018932279cb322c55023ed4de8f44283cbdc73cb89c')

_jvmdir=/usr/lib/jvm/java-${_java}-mandrel
_jdkdir="mandrel-java${_java}-${_fullver}"

package() {

    install -dm 755 "${pkgdir}${_jvmdir}"
    cp -a "${srcdir}/${_jdkdir}"/* "${pkgdir}${_jvmdir}"

    cd "${pkgdir}${_jvmdir}"

    # Conf
    install -dm 755 "${pkgdir}/etc"
    mv conf "${pkgdir}/etc/java-${_java}-mandrel"
    ln -sf "/etc/java-${_java}-mandrel" conf

    # Legal
    install -dm 755 "${pkgdir}/usr/share/licenses"
    mv legal "${pkgdir}/usr/share/licenses/${pkgname}"
    ln -sf "/usr/share/licenses/${pkgname}" legal
    # Other licenses
    mv LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    mv NOTICE "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
    mv THIRD_PARTY_LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRD_PARTY_LICENSE.txt"

    # Man pages
    for f in man/man1/*; do
        install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-mandrel${_java}.1}"
    done
    rm -rf man
    ln -sf /usr/share/man man

    # Link JKS keystore from ca-certificates-utils
    rm -f lib/security/cacerts
    ln -sf /etc/ssl/certs/java/cacerts lib/security/cacerts

}
