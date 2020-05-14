# Maintainer: Christoph Scholz <christoph.scholz@gmail.com>

pkgname=zulu-embedded-jdk8
pkgver=8.0.252
pkgrel=1
pkgdesc='Zulu Embedded is a certified build of OpenJDK for Armv8/v7/v6 devices.'
arch=('armv6h' 'armv7h' 'armv8h' 'aarch64' 'i686' 'x86_64')
url='https://www.azul.com/products/zulu-embedded'
license=('custom')
install=jdk.install
options=(!strip)
provides=("java-environment=8" "java-runtime=8" "java-runtime-headless=8")
depends=('java-runtime-common>=3' 'java-environment-common=3'
         'ca-certificates-utils' 'nss' 'libjpeg-turbo' 'lcms2' 'libnet'
         'freetype2' 'giflib' 'libelf')

case "$CARCH" in
    armv?h) _arch='aarch32hf'
        _build=8.46.0.225
        sha256sums=('6b8b860f4ad73d70391676bef6eeac14893220c8c2d7bf7f1200e327f2ff600e')
        ;;
    aarch64) _arch='aarch64'
        _build=8.46.0.225
        sha256sums=('504188a49b353ff9424d2ddedc73f9b827c435f6eb5518cd7d592afbb7468152')
        ;;
    i686) _arch='i686'
        _build=8.46.0.19
        sha256sums=('bba0ec1606823515172e3eee9fcaa9ea29d51be49ee903c4b1e708af3e60a29f')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_i686.tar.gz")
        provides=("java-environment=8" "java-runtime=8")
        ;;
    x86_64) _arch='x64'
        _build=8.46.0.19
        sha256sums=('ab8a4194006f12dd48bf7f176ca7879706d3f8fc7d3208313a46cc9ee2270716')
        source=("https://cdn.azul.com/zulu/bin/zulu${_build}-ca-jdk${pkgver}-linux_x64.tar.gz")
        provides=("java-environment=8" "java-runtime=8")
esac

_archive="zulu${_build}-ca-jdk${pkgver}-linux_${_arch}"
source=(${source:-"https://cdn.azul.com/zulu-embedded/bin/${_archive}.tar.gz"})

_jvmdir="usr/lib/jvm/zulu-embedded-${pkgver%%.*}"

package() {
    cd "$_archive"

    install -dm 755 "${pkgdir}/${_jvmdir}"
    cp -a . "${pkgdir}/${_jvmdir}/"

    # Man pages
    for f in man/man1/*; do
      install -Dm 644 "${f}" "${pkgdir}/usr/share/${f/\.1/-zulu.1}"
    done
    rm -rf "${pkgdir}/${_jvmdir}/man"
    ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

    # Link JKS keystore from ca-certificates-utils
    rm -f "${pkgdir}/${_jvmdir}/jre/lib/security/cacerts"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/jre/lib/security/cacerts"
}
