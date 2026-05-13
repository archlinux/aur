# Maintainer: Latte macchiato <contact@lattemacchiato.dev>

pkgname=sapmachine11-jdk
_majorver=11
pkgver=11.0.30
pkgrel=1
pkgdesc="SAP's patched build of OpenJDK 11"
arch=('x86_64')
url="https://sapmachine.io"
license=('GPL-2.0-only WITH Classpath-exception-2.0')
depends=('java-runtime-common' 'java-environment-common' 'glibc' 'zlib')
provides=("java-runtime=${_majorver}" "java-runtime-headless=${_majorver}" "java-environment=${_majorver}")
conflicts=("java-runtime<=${_majorver}" "java-environment<=${_majorver}")
backup=()
options=(!strip)
install=sapmachine-jdk.install
source=("https://github.com/SAP/SapMachine/releases/download/sapmachine-${pkgver}/sapmachine-jdk-${pkgver}_linux-x64_bin.tar.gz")
sha256sums=('123bcd0762ef46bbcb7e3ba6eb1c96db9feb31ca695a40c994a855fbe979b414')

_jvmdir=/usr/lib/jvm/java-${_majorver}-sapmachine

package() {
    cd "${srcdir}/sapmachine-jdk-${pkgver}"
    
    # Create destination directory
    install -d -m755 "${pkgdir}${_jvmdir}"
    
    # Copy all files
    cp -a * "${pkgdir}${_jvmdir}"
    
    # Remove Windows files if any
    rm -rf "${pkgdir}${_jvmdir}"/{*.exe,*.dll,*.bat}
    
    # Link JDK files to /usr/bin
    install -d -m755 "${pkgdir}/usr/bin"
    for bin in $(find "${pkgdir}${_jvmdir}/bin" -executable -type f); do
        _binname=$(basename "${bin}")
        ln -s "${_jvmdir}/bin/${_binname}" "${pkgdir}/usr/bin/${_binname}-${pkgname}"
    done
    
    # Link default java tools
    install -d -m755 "${pkgdir}/usr/lib/jvm"
    ln -s "java-${_majorver}-sapmachine" "${pkgdir}/usr/lib/jvm/java-${_majorver}-sapmachine-jdk"
    
    # Legal and license files
    install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
    cp -a legal/* "${pkgdir}/usr/share/licenses/${pkgname}/"
    
    # Man pages
    for man in $(find man -type f); do
        install -Dm644 "${man}" "${pkgdir}/usr/share/${man}"
    done
}
