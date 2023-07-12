# Maintainer: 
pkgname=eprosima-micro-xrce-dds-gen
pkgver=2.0.1
pkgrel=0
pkgdesc="DDS-XRCE IDL code generator tool"
arch=('any')
url="https://github.com/eProsima/Micro-XRCE-DDS-Gen"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('gradle' 'git' 'jdk17-openjdk')
optdepends=()
noextract=()
_idl_parser_revision=958c52041dd8c2c95adcdc7f570585f5e5ff53b3

source=(
    "https://github.com/eProsima/Micro-XRCE-DDS-Gen/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/eProsima/IDL-Parser/archive/${_idl_parser_revision}.zip"
)

sha512sums=(
    '8cd1e7df5105c8472a5558e91545651577b51ac63a31bd08de67e9e1b78626a493e7dca692131d04527e7a72d82c2788b333921791ca9e749108fee7e7936cad'
    '56c3a957455dc6fb3528992f39565c023282879737f2c63c86a7fa698a8361cf6884cd18caf7d7adcbbaffc39015ee443031e5cf3272a5c0bfd3ff7a2dac337b'
)

validpgpkeys=()

build() {
    export GRADLE_USER_HOME="${srcdir}/gradle"
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
    mkdir -p "${srcdir}"/{gradle,m2}
    rm -r -f "${srcdir}/Micro-XRCE-DDS-Gen-${pkgver}"/thirdparty/IDL-Parser
    mv "${srcdir}"/IDL-Parser-${_idl_parser_revision} "${srcdir}/Micro-XRCE-DDS-Gen-${pkgver}"/thirdparty/IDL-Parser

    cd "${srcdir}/Micro-XRCE-DDS-Gen-${pkgver}"
    ./gradlew --no-daemon assemble
}

package() {
    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/usr/share/microxrcedds/
    cp -ar "${srcdir}"/Micro-XRCE-DDS-Gen-${pkgver}/scripts/microxrceddsgen "${pkgdir}"/usr/bin
    cp -ar "${srcdir}"/Micro-XRCE-DDS-Gen-${pkgver}/share/microxrcedds/microxrceddsgen.jar "${pkgdir}"/usr/share/microxrcedds/microxrceddsgen.jar
}
