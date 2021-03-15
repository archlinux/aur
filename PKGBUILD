# Maintainer: Axel Navarro <navarroaxel at gmail>
pkgname=rubymine-eap
pkgver=211.6432.10
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
        rubymine-eap.sh
        rubymine-eap.desktop
        rubymine.install)
sha256sums=('54bd3f96cc757b8c9f509db1fd4acb1a431c12fe7673147ddcb0d6b95a04f245'
            '58d6286630f34e28e9938bbbd7cc7e208e78ba5e368c0eba63a52e3a3e7d1ca7'
            '188794662d469fc9704cd819803a21a8b10a8ad73341196880f5a67db011859a'
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
}

package() {
    cd "${srcdir}"
    [ $CARCH == "x86_64" ] && SUFFIX=64

    install -d ${pkgdir}/{opt,usr/share}

    # Pre-packaged program files
    cp --recursive "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"

    # Install binary
    install -Dm 755 "rubymine-eap.sh" "${pkgdir}/usr/bin/${pkgname}"

    # Desktop file
    install -Dm644 "${pkgdir}/opt/${pkgname}/RMlogo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
    install -Dm644 "rubymine-eap.desktop" "${pkgdir}/usr/share/applications/rubymine-eap.desktop"

    # License
    install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
    find "$srcdir/$_pkgname-$pkgver/license/" -type f -exec \
        install -Dm644 '{}' "$pkgdir/usr/share/licenses/$pkgname/" \;

    # Java config
    sed -i 's/lcd/on/' "${pkgdir}/opt/$pkgname/bin/rubymine${SUFFIX}.vmoptions"
    echo "-Dswing.aatext=true" >> "${pkgdir}/opt/$pkgname/bin/rubymine${SUFFIX}.vmoptions"
}
