# Maintainer: Skydrome <skydrome at protonmail dot com>

pkgname=zulu-embedded-jdk11
pkgver=11.0.4
pkgrel=1
pkgdesc='Zulu Embedded is a certified build of OpenJDK for Armv8/v7/v6 devices.'
arch=('armv6h' 'armv7h' 'armv8h')
url='https://www.azul.com/products/zulu-embedded'
license=('custom')
install=jdk.install
options=(!strip)

depends=(
    'java-runtime-common>=3' 'java-environment-common=3'
    'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet' 'freetype2'
    'giflib' 'libelf'
)
provides=(
    "java-environment=11" "java-environment-openjdk=11"
    "java-runtime=11" "java-runtime-openjdk=11"
)

case "$CARCH" in
    arm*)
        _JARCH='aarch32hf'
        _zulu_build=11.33.21
        sha256sums=('5e7e76a46fe1cf614ddfd7efc3b139ace7ba3fb552a4d9bd5b4ea31dc28494a3')
        ;;
    aarch64)
        _JARCH='aarch64'
        _zulu_build=11.33.21
        sha256sums=('a5150033cc8912c0845d547eeea1e4577d6e438b95b106e429db0543d6605500')
        ;;
esac

_archive="zulu${_zulu_build}-ca-jdk${pkgver}-linux_${_JARCH}"
source=("http://cdn.azul.com/zulu-embedded/bin/${_archive}.tar.gz")

_jvmdir="/usr/lib/jvm/zulu-embedded-11"

package() {
    cd "$_archive"

    install -dm 755 "${pkgdir}/${_jvmdir}"
    cp -a . "${pkgdir}/${_jvmdir}/"

    # Conf
    install -dm 755 "${pkgdir}/etc"
    cp -r conf "${pkgdir}/etc/${pkgname}"
    rm -rf "${pkgdir}/${_jvmdir}/conf"
    ln -s "/etc/${pkgname}" "${pkgdir}/${_jvmdir}/conf"

    # Legal
    install -dm 755 "${pkgdir}/usr/share/licenses"
    cp -r legal "${pkgdir}/usr/share/licenses/${pkgname}"
    rm -rf "${pkgdir}/${_jvmdir}/legal"
    ln -s "/usr/share/licenses/${pkgname}" "${pkgdir}/${_jvmdir}/legal"

    # Man pages
    for f in man/man1/*; do
      install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu-11.1}"
    done
    rm -rf "${pkgdir}/${_jvmdir}/man"
    ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

    # Link JKS keystore from ca-certificates-utils
    rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
