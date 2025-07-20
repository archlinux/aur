_java_ver=17
_jdkname="zulu-${_java_ver}"
_zulu_build="${_java_ver}.60.17-ca"
pkgname="${_jdkname}-bin"
pkgver="${_java_ver}.0.16"
pkgrel=1
pkgdesc='Azul Zulu builds of OpenJDK are open source, TCK-tested and certified builds of OpenJDK.'
arch=('aarch64' 'i686' 'x86_64')
url='https://www.azul.com/downloads/'
license=('custom')
depends=(
    'java-environment-common>=3'
    'java-runtime-common>=3'
    'ca-certificates-utils'
)
provides=(
    "java-environment=$_java_ver"
    "java-environment-openjdk=$_java_ver"
    "java-runtime-headless=$_java_ver"
    "java-runtime-headless-openjdk=$_java_ver"
    "java-runtime=$_java_ver"
    "java-runtime-openjdk=$_java_ver"
)
install="$pkgname.install"
source_aarch64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jdk${pkgver}-linux_aarch64.tar.gz")
source_i686=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jdk${pkgver}-linux_i686.tar.gz")
source_x86_64=("https://cdn.azul.com/zulu/bin/zulu${_zulu_build}-jdk${pkgver}-linux_x64.tar.gz")
sha256sums_aarch64=('1cbb51dc9400814b8fbb79252762af5eba1f556e558128f2a4fca906b2ed04c8')
sha256sums_i686=('38c9435861639b21bbcd4cc5db4159ab10c16005a387bd7d4bda474f01bf777a')
sha256sums_x86_64=('e70822e4b77a9ffd57015b55f4bb645bba97b8f5247a792eceb95dbc7a5a55ab')

_jvmdir="/usr/lib/jvm/${_jdkname}"

package() {
    if [ "${CARCH}" = "aarch64" ]; then
        cd "$srcdir/zulu${_zulu_build}-jdk${pkgver}-linux_aarch64"
    elif [ "${CARCH}" = "i686" ]; then
        cd "$srcdir/zulu${_zulu_build}-jdk${pkgver}-linux_i686"
    else
        cd "$srcdir/zulu${_zulu_build}-jdk${pkgver}-linux_x64"
    fi

    install -dm 755 "${pkgdir}/${_jvmdir}"
    cp -a . "${pkgdir}/${_jvmdir}/"

    # based on java-openjdk package_jdk-openjdk
    # https://github.com/archlinux/svntogit-packages/blob/3f6aa8ddd98f728a9b0701288a933d16f0e8bbaf/trunk/PKGBUILD

    # Conf
    install -dm 755 "${pkgdir}/etc"
    cp -r conf "${pkgdir}/etc/${_jdkname}"
    rm -r "${pkgdir}/${_jvmdir}/conf"
    ln -s "/etc/${_jdkname}" "${pkgdir}/${_jvmdir}/conf"

    # Legal
    install -dm 755 "${pkgdir}/usr/share/licenses"
    cp -r legal "${pkgdir}/usr/share/licenses/${_jdkname}"
    rm -r "${pkgdir}/${_jvmdir}/legal"
    ln -s "/usr/share/licenses/${_jdkname}" "${pkgdir}/${_jvmdir}/legal"

    # Man pages
    for f in bin/*; do
        f=$(basename "${f}")
        _man=man/man1/"${f}.1"
        test -f "${_man}" && install -Dm 644 "${_man}" "${pkgdir}/usr/share/man/man1/${f}-${_jdkname}.1"
    done
    rm -r "${pkgdir}/${_jvmdir}/man"
    ln -s /usr/share/man "${pkgdir}/${_jvmdir}/man"

    # Link JKS keystore from ca-certificates-utils
    rm -f "${pkgdir}/${_jvmdir}/lib/security/cacerts"
    ln -sf /etc/ssl/certs/java/cacerts "${pkgdir}/${_jvmdir}/lib/security/cacerts"
}
