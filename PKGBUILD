pkgname=jdk-zulu-fx-bin
pkgver=27.30.109
pkgrel=1
pkgdesc='Azul Zulu JDK with JavaFX'
arch=(
    'x86_64'
    'aarch64'
)
url='https://www.azul.com/downloads'
license=('custom')

_jvm='java-zulu-fx'
_javaver=27
_zuluver=27.30.109
_jdkver=27.0.1.0.3
_sha256_x86_64='d3c292cedfd0fed36454601916982b77a907fe95d97afc3e88669934a70e8fb6'
_sha256_aarch64='9b0a7574fbb061c128859f2c859a75f040dbf5cc016394ae44d1db21f3016642'

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
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_aarch64.tar.gz")
sha256sums_aarch64=("${_sha256_aarch64}")

case "$CARCH" in
    x86_64)
        _filename="zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64"
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
    local conf_dir="${pkgdir}/etc/${pkgname}"
    local license_dir="${pkgdir}/usr/share/licenses/${pkgname}"
    local man_dir="${pkgdir}/usr/share/man/man1"

    install -d "${install_dir}"
    cp -a "${srcdir}/${_filename}/." "${install_dir}/"

    install -d "${conf_dir}"
    cp -a "${install_dir}/conf/." "${conf_dir}/"
    rm -r "${install_dir}/conf"
    ln -s "/etc/${pkgname}" "${install_dir}/conf"

    install -d "${license_dir}"
    cp -a "${install_dir}/legal/." "${license_dir}/"
    mv "${install_dir}/OPENJFX_LICENSE" "${license_dir}/"
    mv "${install_dir}/DISCLAIMER" "${license_dir}/"
    rm -r "${install_dir}/legal"
    ln -s "/usr/share/licenses/${pkgname}" "${install_dir}/legal"

    install -d "${man_dir}"

    for man_page in "${install_dir}"/man/man1/*.1; do
        local man_name="${man_page##*/}"
        mv "${man_page}" "${man_dir}/${man_name%.1}-zulu${_javaver}.1"
    done

    rm -r "${install_dir}/man"
    ln -s "/usr/share/man" "${install_dir}/man"
}
