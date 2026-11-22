pkgname=jdk11-zulu-fx-bin
pkgver=11.92.201
pkgrel=1
pkgdesc='Azul Zulu JDK 11 with JavaFX'
arch=(
    'x86_64'
    'i686'
    'aarch64'
)
url='https://www.azul.com/downloads'
license=('custom')

_jvm='java-11-zulu-fx'
_javaver=11
_zuluver=11.92.201
_jdkver=11.0.33.1
_sha256_x86_64='6301181c5d69c06fadbcf1076dc8ebaf8c506c7c2a5340eca0d8be7c86167461'
_sha256_i686='9406e7fa656e0f70018dadd8d6828ac5cc96c970483628ea12e61990100de259'
_sha256_aarch64='bee83b1dd9a00e0a06d4e6278dfaebaf966a3ade9d8db7dd67aeaed1e047b793'

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
