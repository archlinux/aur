# Maintainer: 
pkgname=eprosima-fast-dds-gen
pkgver=2.1.3
pkgrel=1
pkgdesc="Fast-DDS IDL code generator tool"
arch=('any')
url="https://github.com/eProsima/Fast-DDS-Gen"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('gradle' 'git' 'jdk11-openjdk')
optdepends=()
noextract=()
_idl_parser_revision=7b9865409aafc4dee82fc2adaf2bbb181836b8b0

source=(
    "https://github.com/eProsima/Fast-DDS-Gen/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/eProsima/IDL-Parser/archive/${_idl_parser_revision}.zip"
)

sha256sums=(
    '77cc48e7140d55e27d90fb55453f8c606c9262e2df2dce4753dcdfa354c14145'
    '2d19bd338d4848c1bae822ac1dfb6b06a70ace2c9ff0630cb0e389572fb4fd9a'
)

validpgpkeys=()

build() {
    export GRADLE_USER_HOME="${srcdir}/gradle"
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
    mkdir -p "${srcdir}"/{gradle,m2}
    rmdir "${srcdir}/Fast-DDS-Gen-${pkgver}"/thirdparty/idl-parser
    mv "${srcdir}"/IDL-Parser-${_idl_parser_revision} "${srcdir}/Fast-DDS-Gen-${pkgver}"/thirdparty/idl-parser
    cd "${srcdir}/Fast-DDS-Gen-${pkgver}"
    ./gradlew --no-daemon assemble
}

package() {
    cd "${srcdir}/Fast-DDS-Gen-${pkgver}"
    mkdir -p "gradle_home"
    ./gradlew --no-daemon install -g "${srcdir}/Fast-DDS-Gen/gradle_home" --install_path="${pkgdir}/usr/"
}
