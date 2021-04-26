# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>

pkgname=zulu-embedded-jdk11
pkgver=11.0.11
pkgrel=1
pkgdesc='Zulu Embedded is a certified build of OpenJDK for Armv8/v7/v6 devices.'
arch=('armv6h' 'armv7h' 'armv8h' 'aarch64' 'i686' 'x86_64')
url='https://www.azul.com/products/zulu-embedded'
license=('custom')
install=jdk.install
options=(!strip)
provides=("java-environment=11" "java-runtime=11" "java-runtime-headless=11")
depends=('java-runtime-common>=3' 'java-environment-common=3'
         'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet'
         'freetype2' 'giflib' 'libelf')

case "$CARCH" in
    armv?h) _arch='aarch32hf'
        _build=11.48.21
        sha256sums=('a32954f3377978819701c6f8aa847cf6ccea05cd427a8a98091246ee58ae0048')
        source=(${source:-"https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz"})
        ;;
    aarch64) _arch='aarch64'
        _build=11.48.21
        sha256sums=('717866e68577e039d9f05511d845452c9225474c7352f3d23fad78fce6749276')
        source=(${source:-"https://cdn.azul.com/zulu-embedded/bin/zulu${_build}-ca-jdk${pkgver}-linux_${_arch}.tar.gz"})
        ;;
    i686) _arch='i686'
        _build=11.48.21
        sha256sums=('620f49eb34f9144fa6c93625e86b3c21504ea5d8bbf9a7924d84fda0bdaac347')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_i686.tar.gz")
        ;;
    x86_64) _arch='x64'
        _build=11.48.21
        sha256sums=('172449e998afbb59a961598330a3438dbe9f188910cdeb14d0a6457421541134')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_x64.tar.gz")
esac

_archive=${source[0]/.tar.gz/}
_jvmdir="usr/lib/jvm/zulu-embedded-${pkgver%%.*}"

package() {
    cd "$(basename $_archive)"

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
        install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu11.1}"
    done
    rm -rf "${pkgdir}/${_jvmdir}/man"
    ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

    # Link JKS keystore from ca-certificates-utils
    rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
