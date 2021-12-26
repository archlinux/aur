# Maintainer: 
pkgname=eprosima-fast-dds-gen
pkgver=2.1.0
pkgrel=1
pkgdesc="Fast-DDS IDL code generator tool"
arch=('any')
url="https://github.com/eProsima/Fast-DDS-Gen"
license=('Apache')
depends=('java-environment' 'bash')
makedepends=('gradle' 'git' 'jdk11-openjdk')
optdepends=()
noextract=()
_idl_parser_revision=7f03d2271b1a27c8549f98399d461581d5984484

source=(
    "https://github.com/eProsima/Fast-DDS-Gen/archive/refs/tags/v${pkgver}.tar.gz"
    "https://github.com/eProsima/IDL-Parser/archive/${_idl_parser_revision}.zip"
)

sha256sums=(
    'e1ac8ae496ca5c6a4f8902212486611ca57fd7829289f6fa909070f909861701'
    '573f1e51477fb74adb1e11397b93d02a49cb16856623aa07962192d71047c05d'
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
