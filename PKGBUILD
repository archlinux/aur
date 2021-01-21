# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Gleb Sinyavsky <zhulik dot gleb at gmail dot com>
# Contributor: Mario Finelli <mario dot finelli at yahoo dot com>
# Contributor: Tom Richards <tom at tomrichards dot net>
# Contributor: Alexsandr Pavlov <kidoz at mail dot ru>
# Contributor: Ernie Brodeur <ebrodeur at ujami dotnet>
# Contributor: Rogof <fake dot bios at gmail dot com>
# Contributor: m4.rc0 <m4 dot rc0 at o2 dot pl>

pkgname=rubymine7
_pkgname=RubyMine
pkgver=7.1.5
pkgrel=1
pkgdesc="Ruby and Rails IDE with the full stack of essential developer tools. 7 version"
arch=('i686' 'x86_64')
options=(!strip)
url="https://www.jetbrains.com/ruby/"
license=('custom')
depends=('java-environment' 'desktop-file-utils' 'gtk-update-icon-cache')
optdepends=('ruby: Ruby run/debug support')
install=rubymine.install
source=(https://download.jetbrains.com/ruby/${_pkgname}-${pkgver}.tar.gz
        rubymine.desktop
        rubymine.install)
sha256sums=('b43448c542adf82774a584f25924cdaa896b44d2a100c76bafe92ada83eccc11'
            '82b7415d984ac1e7b0ace8b0ce4de8d33471483077d7fab4ca75a835384beaf2'
            '678ec0038b54e760d19c8967d92eb1781da12e7a1818faff3f489e65330dbba9')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    # Remove junk
    rm "build.txt"
    rm "Install-Linux-tar.txt"

    #Remove non-linux libs
    rm -rf "lib/libpty/macosx"
    rm -rf "lib/libpty/win"

    #Remove bin/libs if architecture doesn't match
    if [[ $CARCH = 'i686' ]]; then
        rm -f "bin/fsnotifier64"
        rm -f "bin/libbreakgen64.so"
        rm -f "bin/libyjpagent-linux64.so"
        rm -f "bin/rubymine64.vmoptions"
        rm -rf "lib/libpty/linux/x86_64"
    fi
    if [[ $CARCH = 'x86_64' ]]; then
        rm -f "bin/fsnotifier"
        rm -f "bin/libbreakgen.so"
        rm -f "bin/libyjpagent-linux.so"
        rm -f "bin/rubymine.vmoptions"
        rm -rf "lib/libpty/linux/x86"
    fi
}

package() {
    cd "${srcdir}"
    [ $CARCH == "x86_64" ] && SUFFIX=64

    #Pre-packaged program files
    install -d -m 755 "${pkgdir}/usr/share"
    cp -a "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/usr/share/${pkgname}"

    #Desktop application
    install -Dm644 "${pkgdir}/usr/share/${pkgname}/bin/RMlogo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "rubymine.desktop" "${pkgdir}/usr/share/applications/rubymine.desktop"
    install -d -m 755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/bin/rubymine.sh" "${pkgdir}/usr/bin/jetbrains-${pkgname}"

    #License
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/license/${_pkgname}_license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"

    #Java config
    sed -i 's/lcd/on/' "${pkgdir}/usr/share/${pkgname}/bin/rubymine${SUFFIX}.vmoptions"
    echo "-Dswing.aatext=true" >> "${pkgdir}/usr/share/${pkgname}/bin/rubymine${SUFFIX}.vmoptions"
}
