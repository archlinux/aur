# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

pkgbase=clion-eap
pkgname=(clion-eap clion-eap-jre clion-eap-cmake clion-eap-gdb clion-eap-lldb)
_pkgname=clion
_dlname=CLion
pkgver=183.4886.39
_dlver=2018.3.2
pkgrel=1
pkgdesc="C/C++ IDE. 30-day evaluation."
arch=('x86_64')
options=(!strip)
url="http://www.jetbrains.com/${_pkgname}"
license=('custom')
makedepends=('rsync')
source=("https://download.jetbrains.com/cpp/${_dlname}-${_dlver}.tar.gz"
        "jetbrains-${pkgbase}.desktop")
sha256sums=('b42557e2b09383121a4347fc74c1f903fe08607ef0f3ceb279dd20c519e583e5'
            'deb1e9f90e99f2ac00b5c31581fe6148712ecfa25f7290a39ae71443978cd539')
noextract=("${_dlname}-${_dlver}.tar.gz")

build() {
    rm -rf "${srcdir}/opt"
    mkdir -p "${srcdir}/opt/${pkgbase}"
    bsdtar --strip-components 1 -xf "${_dlname}-${_dlver}.tar.gz" \
           -C "${srcdir}/opt/${pkgbase}"

    rm -f "${srcdir}/opt/${pkgbase}/bin/libyjpagent-linux.so"
    rm -f "${srcdir}/opt/${pkgbase}/bin/fsnotifier"
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
        'swift: Swift programming language support (Also requires the plugin)'
        'python: Python 3 programming language support'
        'python2: Python 2 programming language support'
        'doxygen: Code documentation generation'
    )
    backup=("opt/${pkgbase}/bin/clion64.vmoptions")

    rsync -rtl "${srcdir}/opt" "${pkgdir}" \
          --exclude=/opt/${pkgbase}/jre64 \
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
    rsync -rtl "${srcdir}/opt/${pkgbase}/jre64" "${pkgdir}/opt/${pkgbase}"
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
