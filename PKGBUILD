# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

pkgbase=clion-eap
pkgname=(clion-eap clion-eap-jre clion-eap-cmake clion-eap-gdb clion-eap-lldb)
_pkgname=clion
_dlname=CLion
pkgver=233.11799.238
_dlver=2023.3
pkgrel=1
pkgdesc="Cross-platform IDE for C and C++ from JetBrains. Early Access Program."
arch=('x86_64' 'aarch64')
options=(!strip)
url="http://www.jetbrains.com/${_pkgname}"
license=('custom')
makedepends=('rsync')
source=("jetbrains-${pkgbase}.desktop")
source_x86_64=("https://download.jetbrains.com/cpp/${_dlname}-${_dlver}.tar.gz")
source_aarch64=("https://download.jetbrains.com/cpp/${_dlname}-${_dlver}-aarch64.tar.gz")
sha256sums=('11ae3ce76677643e1b925eb5983adafbd05ffa38d6e0398b209ca6ff836db3ee')
sha256sums_x86_64=('0bfee58106140aeac826ee92faf7528ec30319c59a1c566d36f367a3251f2e70')
sha256sums_aarch64=('e83d3f9ebac39ee918d56d9611160bdb28eabe97b3cb1722f35ff5bc93e5f205')
noextract=("${_dlname}-${_dlver}.tar.gz"
           "${_dlname}-${_dlver}-aarch64.tar.gz")

build() {
    case "$CARCH" in
    x86_64)
        _tarname="${_dlname}-${_dlver}.tar.gz"
        ;;
    *)
        _tarname="${_dlname}-${_dlver}-${CARCH}.tar.gz"
        ;;
    esac

    rm -rf "${srcdir}/opt"
    mkdir -p "${srcdir}/opt/${pkgbase}"
    bsdtar --strip-components 1 -xf "$_tarname" -C "${srcdir}/opt/${pkgbase}"
}

package_clion-eap() {
    depends=('libdbusmenu-glib')
    optdepends=(
        'clion-eap-jre: JetBrains custom Java Runtime (Recommended)'
        'clion-eap-cmake: JetBrains packaged CMake tools'
        'clion-eap-gdb: JetBrains packaged GNU debugger'
        'clion-eap-lldb: JetBrains packaged LLVM debugger'
        'java-runtime: JRE - Required if clion-eap-jre is not installed'
        'cmake: Build system - Required if clion-eap-cmake is not installed'
        'gdb: native GNU debugger'
        'lldb: native LLVM debugger'
        'gcc: GNU compiler'
        'clang: LLVM compiler'
        'gtest: C++ testing'
        'swift-language: Swift programming language support (Also requires the plugin)'
        'python: Python 3 programming language support'
        'python2: Python 2 programming language support'
        'doxygen: Code documentation generation'
    )
    backup=("opt/${pkgbase}/bin/clion64.vmoptions"
            "opt/${pkgbase}/bin/idea.properties")

    rsync -rtl "${srcdir}/opt" "${pkgdir}" \
          --exclude=/opt/${pkgbase}/jbr \
          --exclude=/opt/${pkgbase}/bin/cmake \
          --exclude=/opt/${pkgbase}/bin/gdb \
          --exclude=/opt/${pkgbase}/bin/lldb

    mkdir -p "${pkgdir}/usr/bin/"
    mkdir -p "${pkgdir}/usr/share/applications/"
    mkdir -p "${pkgdir}/usr/share/pixmaps/"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgbase}"

    install -m 644 "${srcdir}/jetbrains-${pkgbase}.desktop" \
            "${pkgdir}/usr/share/applications/"

    ln -s "/opt/${pkgbase}/bin/${_pkgname}.svg" \
            "${pkgdir}/usr/share/pixmaps/${pkgbase}.svg"
    ln -s "/opt/${pkgbase}/license/CLion_Preview_License.txt" \
            "${pkgdir}/usr/share/licenses/${pkgbase}"
    ln -s "/opt/${pkgbase}/bin/${_pkgname}.sh" \
            "${pkgdir}/usr/bin/${pkgbase}"
}

package_clion-eap-jre() {
    pkgdesc="JetBrains custom Java Runtime for CLion EAP (Recommended)"
    url="https://github.com/JetBrains/JetBrainsRuntime"
    install -d -m755 "${pkgdir}/opt/${pkgbase}"
    rsync -rtl "${srcdir}/opt/${pkgbase}/jbr" "${pkgdir}/opt/${pkgbase}"
}

package_clion-eap-cmake() {
    pkgdesc="JetBrains packaged CMake tools for CLion EAP"
    install -d -m755 "${pkgdir}/opt/${pkgbase}/bin"
    rsync -rtl "${srcdir}/opt/${pkgbase}/bin/cmake" "${pkgdir}/opt/${pkgbase}/bin"
}

package_clion-eap-gdb() {
    pkgdesc="JetBrains packaged GNU Debugger for CLion EAP"
    install -d -m755 "${pkgdir}/opt/${pkgbase}/bin"
    rsync -rtl "${srcdir}/opt/${pkgbase}/bin/gdb" "${pkgdir}/opt/${pkgbase}/bin"
}

package_clion-eap-lldb() {
    pkgdesc="JetBrains packaged LLVM Debugger for CLion EAP"
    install -d -m755 "${pkgdir}/opt/${pkgbase}/bin"
    rsync -rtl "${srcdir}/opt/${pkgbase}/bin/lldb" "${pkgdir}/opt/${pkgbase}/bin"
}
