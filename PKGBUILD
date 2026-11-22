pkgname=jdk8-zulu-fx-bin
pkgver=8.98.0.201
pkgrel=1
pkgdesc='Azul Zulu JDK 8 with JavaFX'
arch=(
    'x86_64'
    'i686'
    'aarch64'
)
url='https://www.azul.com/downloads'
license=('custom')

_jvm='java-8-zulu-fx'
_javaver=8
_zuluver=8.98.0.201
_jdkver=8.0.514
_sha256_x86_64='8eadc06f4225cdb7580a91042a6008ed63d8d53615d4fad7255fa0e1dff63b78'
_sha256_i686='992487cae384e46a036886ff647762fcdd4871403634e51d3121c5dd3d94692d'
_sha256_aarch64='ef32638c2c3ecbd059d87571b4481e97dcbd80d26d8c1eacc8b17fa6c06b10f5'

depends=(
    'java-runtime-common'
    'java-environment-common'
)
provides=(
    "java-environment=${_javaver}"
    "java-environment-openjdk=${_javaver}"
    "java-runtime=${_javaver}"
    "java-runtime-openjdk=${_javaver}"
    "java-runtime-headless=${_javaver}"
    "java-runtime-headless-openjdk=${_javaver}"
    "java-openjfx=${_javaver}"
)
install="${pkgname}.install"
options=('!strip')

source_x86_64=("https://cdn.azul.com/zulu/bin/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64.tar.gz")
sha256sums_x86_64=("${_sha256_x86_64}")
source_i686=("https://cdn.azul.com/zulu/bin/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_i686.tar.gz")
sha256sums_i686=("${_sha256_i686}")
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_aarch64.tar.gz")
sha256sums_aarch64=("${_sha256_aarch64}")

case "$CARCH" in
    x86_64)
        _filename="zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64"
        ;;
    i686)
        _filename="zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_i686"
        ;;
    aarch64)
        _filename="zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_aarch64"
        ;;
    *)
        printf 'Unsupported architecture: %s\n' "$CARCH" >&2
        exit 1
        ;;
esac

package() {
    local install_dir="${pkgdir}/usr/lib/jvm/${_jvm}"
    local license_dir="${pkgdir}/usr/share/licenses/${pkgname}"
    local man_dir="${pkgdir}/usr/share/man/man1"

    install -d "${install_dir}"
    cp -a "${srcdir}/${_filename}/." "${install_dir}/"

    install -d "${license_dir}"
    mkdir "${license_dir}/jre"
    mv "${install_dir}/jre/ASSEMBLY_EXCEPTION" "${license_dir}/jre/"
    mv "${install_dir}/jre/LICENSE" "${license_dir}/jre/"
    mv "${install_dir}/ASSEMBLY_EXCEPTION" "${license_dir}/"
    mv "${install_dir}/DISCLAIMER" "${license_dir}/"
    mv "${install_dir}/LICENSE" "${license_dir}/"
    mv "${install_dir}/OPENJFX_LICENSE" "${license_dir}/"

    install -d "${man_dir}"

    for man_page in "${install_dir}"/man/man1/*.1; do
        local man_name="${man_page##*/}"
        mv "${man_page}" "${man_dir}/${man_name%.1}-zulu${_javaver}.1"
    done

    rm -r "${install_dir}/man"
    ln -s "/usr/share/man" "${install_dir}/man"
}
