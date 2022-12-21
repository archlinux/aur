# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

pkgbase=clion-eap
pkgname=(clion-eap clion-eap-jre clion-eap-cmake clion-eap-gdb clion-eap-lldb)
_pkgname=clion
_dlname=CLion
pkgver=223.8214.51
_dlver=2022.3.1
pkgrel=1
pkgdesc="C/C++ IDE. 30-day evaluation."
arch=('x86_64' 'aarch64')
options=(!strip)
url="http://www.jetbrains.com/${_pkgname}"
license=('custom')
makedepends=('rsync')
source=("https://download.jetbrains.com/cpp/${_dlname}-${_dlver}.tar.gz"
        "jetbrains-${pkgbase}.desktop")
sha256sums=('cd057a0aa96cf5b4216a436136a1002e6f3dc578bcd8a69f98d6908381b03526'
            'e820de51d9083c5b8b7240ccd688085e11731ee36552783fa7089462cc5650d0')
noextract=("${_dlname}-${_dlver}.tar.gz")

build() {
    rm -rf "${srcdir}/opt"
    mkdir -p "${srcdir}/opt/${pkgbase}"
    bsdtar --strip-components 1 -xf "${_dlname}-${_dlver}.tar.gz" \
           -C "${srcdir}/opt/${pkgbase}"
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
        'biicode: C/C++ dependency manager'
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
    install -d -m755 "${pkgdir}/opt/${pkgbase}"
    rsync -rtl "${srcdir}/opt/${pkgbase}/jbr" "${pkgdir}/opt/${pkgbase}"
}

package_clion-eap-cmake() {
    install -d -m755 "${pkgdir}/opt/${pkgbase}/bin"
    rsync -rtl "${srcdir}/opt/${pkgbase}/bin/cmake" "${pkgdir}/opt/${pkgbase}/bin"
}

package_clion-eap-gdb() {
    install -d -m755 "${pkgdir}/opt/${pkgbase}/bin"
    rsync -rtl "${srcdir}/opt/${pkgbase}/bin/gdb" "${pkgdir}/opt/${pkgbase}/bin"
}

package_clion-eap-lldb() {
    install -d -m755 "${pkgdir}/opt/${pkgbase}/bin"
    rsync -rtl "${srcdir}/opt/${pkgbase}/bin/lldb" "${pkgdir}/opt/${pkgbase}/bin"
}
