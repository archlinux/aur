# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=rubymine-eap
pkgver=212.4746.90
_pkgname=RubyMine
_pkgver=2021.2
pkgrel=1
pkgdesc="Ruby and Rails IDE with the full stack of essential developer tools (EAP)."
arch=('i686' 'x86_64')
options=('!strip')
url="http://www.jetbrains.com/ruby/"
license=('custom')
depends=('desktop-file-utils' 'gtk-update-icon-cache')
optdepends=('ruby: Ruby run/debug support')
install=rubymine.install
source=(https://download.jetbrains.com/ruby/${_pkgname}-${_pkgver}.tar.gz
        rubymine-eap.desktop
        rubymine.install)
sha256sums=('9147865bcf4f564ff799ac237ffb6f01b2633d22e57f98ed0d76204a46d33299'
            '02b32d973da26ef7d61e4c291fff71229729b203661dc75cc947c8098cb8e660'
            'fe42e281cdcaca5008d3f254a16974504c9271407800d0234ce06476ea9e3bdd')

prepare() {
    cd "${srcdir}/${_pkgname}-${_pkgver}"

    rm Install-Linux-tar.txt
    rm help/ReferenceCardForMac.pdf
}

package() {
    cd "${srcdir}"
    [ $CARCH == "x86_64" ] && SUFFIX=64

    install -d ${pkgdir}/{opt,usr/share}

    # Pre-packaged program files
    cp --recursive "${srcdir}/${_pkgname}-${_pkgver}" "${pkgdir}/opt/${pkgname}"

    # Desktop file
    install -Dm644 "${pkgdir}/opt/${pkgname}/RMlogo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "rubymine-eap.desktop" "${pkgdir}/usr/share/applications/rubymine-eap.desktop"
    install -d -m 755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/bin/rubymine.sh" "${pkgdir}/usr/bin/${pkgname}"

    # License
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    find "$srcdir/$_pkgname-$_pkgver/license/" -type f -exec \
        install -Dm644 '{}' "$pkgdir/usr/share/licenses/$pkgname/" \;

    # Java config
    sed -i 's/lcd/on/' "${pkgdir}/opt/$pkgname/bin/rubymine${SUFFIX}.vmoptions"
    echo "-Dswing.aatext=true" >> "${pkgdir}/opt/$pkgname/bin/rubymine${SUFFIX}.vmoptions"
}
