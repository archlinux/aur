# Maintainer: 
pkgname=eprosima-fast-dds-gen
pkgver=3.0.1
pkgrel=1
pkgdesc="Fast-DDS IDL code generator tool"
arch=('any')
url="https://github.com/eProsima/Fast-DDS-Gen"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('gradle' 'git' 'jdk17-openjdk')
optdepends=()
noextract=()
_idl_parser_revision=896804850eb763b1f64ee751e6e2fc1558d2cb7e

source=(
    "https://github.com/eProsima/Fast-DDS-Gen/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/eProsima/IDL-Parser/archive/${_idl_parser_revision}.zip"
)

sha256sums=(
    '2688e5621e8daaa4746d40178f9c0c540d649902fcdcc31bc67d42ffeb62dd75'
    'ccc9237660d682b450fe582da7f77e54f8447cb7dc8497fa395594dd081f5227'
)

validpgpkeys=()

build() {
    export GRADLE_USER_HOME="${srcdir}/gradle"
    export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
    mkdir -p "${srcdir}"/{gradle,m2}
    rm -r "${srcdir}/Fast-DDS-Gen-${pkgver}"/thirdparty/idl-parser
    mv "${srcdir}"/IDL-Parser-${_idl_parser_revision} "${srcdir}/Fast-DDS-Gen-${pkgver}"/thirdparty/idl-parser
    cd "${srcdir}/Fast-DDS-Gen-${pkgver}"
    ./gradlew --no-daemon assemble
}

package() {
    cd "${srcdir}/Fast-DDS-Gen-${pkgver}"
    mkdir -p "gradle_home"
    ./gradlew --no-daemon install -g "${srcdir}/Fast-DDS-Gen/gradle_home" --install_path="${pkgdir}/usr/"
}
