# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=rubymine-eap
pkgver=201.6487.23
_pkgname=RubyMine
_pkgver=2020.1
pkgrel=1
pkgdesc="Ruby and Rails IDE with the full stack of essential developer tools (EAP)."
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/ruby/"
license=('custom')
depends=('desktop-file-utils' 'gtk-update-icon-cache')
optdepends=('ruby: Ruby run/debug support')
install=rubymine.install
source=(https://download.jetbrains.com/ruby/${_pkgname}-${pkgver}.tar.gz
        rubymine-eap.desktop
        rubymine.install)
sha256sums=('c70b01d205e6d01576a5635696fd81ae65dc16d695c5627573d688fff77a5564'
            '3daf0808e001e780bf610e4c9726a0ed190ab6293a30d0ed13aa63d88209c954'
            'fe42e281cdcaca5008d3f254a16974504c9271407800d0234ce06476ea9e3bdd')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

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
    install -Dm644 "rubymine-eap.desktop" "${pkgdir}/usr/share/applications/rubymine-eap.desktop"
    install -d -m 755 "${pkgdir}/usr/bin"
    ln -s "/usr/share/${pkgname}/bin/rubymine.sh" "${pkgdir}/usr/bin/jetbrains-${pkgname}"

    #License
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    find "$srcdir/$_pkgname-$pkgver/license/" -type f -exec \
        install -Dm644 '{}' "$pkgdir/usr/share/licenses/$pkgname/" \;

    #Java config
    sed -i 's/lcd/on/' "${pkgdir}/usr/share/$pkgname/bin/rubymine${SUFFIX}.vmoptions"
    echo "-Dswing.aatext=true" >> "${pkgdir}/usr/share/$pkgname/bin/rubymine${SUFFIX}.vmoptions"
}
