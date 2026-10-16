pkgname=zulu-25-jdk-fx
pkgver=25.36.205
pkgrel=4
pkgdesc='Azul Zulu JDK 25 with JavaFX'
arch=(
    'x86_64'
    'aarch64'
)
url='https://www.azul.com/downloads'
license=('custom')

_jvm='java-25-zulu-fx'
_javaver=25
_zuluver=25.36.205
_jdkver=25.0.4.1
_sha256_x86_64='dc541c82220402985ef4f646246235a55920f4493d79670eddaf33fa45a5c73c'
_sha256_aarch64='5485d8302d3ef7a4c8e6baf9f914b5698fe9602226bdb30e5a5dd0c7975eaca2'

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

case "$CARCH" in
    x86_64)
        _filename="zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_x64"
        _sha256="${_sha256_x86_64}"
        ;;
    aarch64)
        _filename="zulu${_zuluver}-ca-fx-jdk${_jdkver}-linux_aarch64"
        _sha256="${_sha256_aarch64}"
        ;;
    *)
        printf 'Unsupported architecture: %s\n' "$CARCH" >&2
        exit 1
        ;;
esac

source=("https://cdn.azul.com/zulu/bin/${_filename}.tar.gz")
sha256sums=("${_sha256}")

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
