# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=rubymine-eap
pkgver=211.5538.3
_pkgname=RubyMine
_pkgver=2021.1
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
        https://download.jetbrains.com/ruby/${_pkgname}-211.4961.28.tar.gz
        rubymine-eap.desktop
        rubymine.install)
sha256sums=('5ed476fd1c08f28068a7ea378ab4a7a0a11372f99145f8aa79397c31bbdddbd6'
            'b3a3ac38e902c609d02fe66aa6c4564b25e8f349e08486c60ab0dd8b13724d69'
            '02b32d973da26ef7d61e4c291fff71229729b203661dc75cc947c8098cb8e660'
            'fe42e281cdcaca5008d3f254a16974504c9271407800d0234ce06476ea9e3bdd')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"

    rm Install-Linux-tar.txt
    rm help/ReferenceCardForMac.pdf
    #Remove bin/libs if architecture doesn't match
    if [[ $CARCH = 'i686' ]]; then
        rm bin/fsnotifier64
        rm bin/libdbm64.so
        rm bin/rubymine64.vmoptions
        rm -rf lib/pty4j-native/linux/x86_64
    fi
    if [[ $CARCH = 'x86_64' ]]; then
        rm bin/fsnotifier
        rm bin/rubymine.vmoptions
        rm -rf lib/pty4j-native/linux/x86
    fi
    # The JBR of this version is broken, see https://youtrack.jetbrains.com/issue/JBR-3066
    rm -rf jbr
}

package() {
    cd "${srcdir}"
    [ $CARCH == "x86_64" ] && SUFFIX=64

    install -d ${pkgdir}/{opt,usr/share}

    #Pre-packaged program files
    cp --recursive "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"

    #Desktop application
    install -Dm644 "${pkgdir}/opt/${pkgname}/RMlogo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "rubymine-eap.desktop" "${pkgdir}/usr/share/applications/rubymine-eap.desktop"
    install -d -m 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/bin/rubymine.sh" "${pkgdir}/usr/bin/${pkgname}"

    #License
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    find "$srcdir/$_pkgname-$pkgver/license/" -type f -exec \
        install -Dm644 '{}' "$pkgdir/usr/share/licenses/$pkgname/" \;

    #Java config
    sed -i 's/lcd/on/' "${pkgdir}/opt/$pkgname/bin/rubymine${SUFFIX}.vmoptions"
    echo "-Dswing.aatext=true" >> "${pkgdir}/opt/$pkgname/bin/rubymine${SUFFIX}.vmoptions"

    echo 'Using the JBR from build 211.4961.28...'
    cp --recursive "${srcdir}/${_pkgname}-211.4961.28/jbr" "${pkgdir}/opt/${pkgname}/jbr"
}
