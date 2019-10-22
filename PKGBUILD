# Maintainer: Skydrome <skydrome at protonmail dot com>

pkgname=zulu-embedded-jdk11
pkgver=11.0.4
pkgrel=1
pkgdesc='Zulu Embedded is a certified build of OpenJDK for Armv8/v7/v6 devices.'
arch=('armv6h' 'armv7h' 'armv8h' 'i686')
url='https://www.azul.com/products/zulu-embedded'
license=('custom')
install=jdk.install
options=(!strip)
provides=("java-environment=11" "java-runtime=11")
depends=('java-runtime-common>=3' 'java-environment-common=3'
         'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet'
         'freetype2' 'giflib' 'libelf')

case "$CARCH" in
    armv?h) _arch='aarch32hf'
        _build=11.33.21
        sha256sums=('5E7E76A46FE1CF614DDFD7EFC3B139ACE7BA3FB552A4D9BD5B4EA31DC28494A3')
        ;;
    aarch64) _arch='aarch64'
        _build=11.33.21
        sha256sums=('A5150033CC8912C0845D547EEEA1E4577D6E438B95B106E429DB0543D6605500')
        ;;
    i686) _arch='i686'
        _build=13.28.11
        pkgver=13.0.1
        sha256sums=('8C134B1EFA452409FA3EBF6BCEF4DF6FD521C8B2A0D1D68DA7D3FFDCB5AB0C79')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_i686.tar.gz")
        provides=("java-environment=13" "java-runtime=13")
esac

_archive="zulu${_build}-ca-jdk${pkgver}-linux_${_arch}"
source=(${source:-"http://cdn.azul.com/zulu-embedded/bin/${_archive}.tar.gz"})

_jvmdir="usr/lib/jvm/zulu-embedded-${pkgver%%.*}"

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
      install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu.1}"
    done
    rm -rf "${pkgdir}/${_jvmdir}/man"
    ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

    # Link JKS keystore from ca-certificates-utils
    rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
