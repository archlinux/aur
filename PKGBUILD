# Maintainer: Michael Hansen <zrax0111 gmail com>
# Contributor: Raphaël Doursenaud <rdoursenaud@gpcsolutions.fr>
# Contributor: Jesse Jaara <gmail.com: jesse.jaara>

# Too many users are getting confused by this...  If you really want to use
# an external JRE instead of the bundled JetBrains JRE, set this to 1
_external_jre=0

# Uncomment if you want to disable compressing the package to save some time.
#PKGEXT=.pkg.tar

pkgbase=clion-eap
pkgname=(clion-eap clion-eap-cmake clion-eap-gdb clion-eap-lldb)
_pkgname=clion
_dlname=CLion
pkgver=252.19874.7
_dlver=$pkgver
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
sha256sums_x86_64=('f31c083c33100c23e84330c704538562f10f5bbb16f830947da08afec10c410d')
sha256sums_aarch64=('76c8897558752e6475494cf5712fa0e350216d0e942e7ddcfceca92dc88cd737')
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
        'clion-eap-cmake: JetBrains packaged CMake tools'
        'clion-eap-gdb: JetBrains packaged GNU debugger'
        'clion-eap-lldb: JetBrains packaged LLVM debugger'
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
    conflicts=('clion-eap-jre')
    if (( $_external_jre )); then
        depends+=("java-runtime")
        install=clion-eap.install
        _exclude_jre=("--exclude=/opt/${pkgbase}/jbr")
    else
        _exclude_jre=()
    fi
    backup=("opt/${pkgbase}/bin/clion64.vmoptions"
            "opt/${pkgbase}/bin/idea.properties")

    rsync -rtl "${srcdir}/opt" "${pkgdir}" \
          "${_exclude_jre[@]}" \
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
    ln -s "/opt/${pkgbase}/bin/${_pkgname}" \
            "${pkgdir}/usr/bin/${pkgbase}"
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
