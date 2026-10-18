pkgname=jdk11-zulu-fx-bin
pkgver=11.90.205
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
_zuluver=11.90.205
_jdkver=11.0.32.1
_sha256_x86_64='ee90afd42c2e3e2cab7e1f1d64c0ea8ff43064aa2caa9903fb305bedd6d41961'
_sha256_i686='714d619bd180eb8cf71e817bcffc3eadcdc2cd12d433fd940886fb506b16be79'
_sha256_aarch64='b6c9d7709660369e77d783aa6bcd88717c94b84914c5364e52a1e9f0d9ad4bf5'

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
