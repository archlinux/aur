# Maintainer: Mike Roll <scaryspiderpig@gmail.com>

_pkgname=monogame
pkgname=("${_pkgname}-bin" "monodevelop-${_pkgname}-addin")
pkgver=3.5.1
pkgrel=1
pkgdesc="Open Source implementation of the Microsoft XNA 4 Framework."
arch=('x86_64')
url="http://www.monogame.net/"
license=('custom', 'MIT')
source=("http://www.monogame.net/releases/v${pkgver}/monogame-sdk.run"
        "https://raw.githubusercontent.com/mono/MonoGame/develop/LICENSE.txt"
        "Monogame Pipeline.desktop")
md5sums=('3cf5ca64bd9cb62db5d83066df568727'
         '2c8089207448fa9571c65eb00f0c9cd1'
         'a8fd2a407aef36d2209faad11ae7b186')

prepare() {
	sh monogame-sdk.run --noexec --target "${_pkgname}-${pkgver}"
}

package_monogame-bin() {
    depends=('mono')
    conflicts=("${_pkgname}" 'tao-framework' 'tao-framework-svn')
    provides=("${_pkgname}")
    install="monogame.install"

    # License
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    cd "${_pkgname}-${pkgver}"
    mgroot="/opt/monogame"
    mglink="/usr/lib/mono/xbuild/MonoGame/v3.0"
    mkdir -p "${pkgdir}/${mgroot}"
    mkdir -p "$(dirname ${pkgdir}/${mglink})"
    ln -s "${mgroot}" "${pkgdir}/${mglink}"

    # SDK
    cp -rf "MonoGameSDK/." "${pkgdir}${mgroot}"
    rm -f "${pkgdir}${mgroot}/uninstall.sh"

    # Bundled tools
    chmod +x "${pkgdir}${mgroot}/Tools/ffmpeg"
    chmod +x "${pkgdir}${mgroot}/Tools/ffprobe"

    # Pipeline tools
    install -D -m775 "Main/monogame-pipeline" "${pkgdir}/usr/bin/monogame-pipeline"
    install -D -m775 "Main/mgcb" "${pkgdir}/usr/bin/mgcb"

    # Monogame icon
    install -D -m664 "Main/monogame.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/monogame.svg"

    # MIME type
    install -D -m664 "Main/mgcb.xml" "${pkgdir}/usr/share/mime/packages/mgcb.xml"

    # Application launcher
    install -D -m664 "../Monogame Pipeline.desktop" "${pkgdir}/usr/share/applications/Monogame\ Pipeline.desktop"
}

package_monodevelop-monogame-addin() {
    depends=('monodevelop')

    # License
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    cd "${_pkgname}-${pkgver}"

    # Monodevelop AddIn
    mkdir -p "${pkgdir}/usr/lib/monodevelop/AddIns/MonoDevelop.MonoGame"
    unzip -qo -d "${pkgdir}/usr/lib/monodevelop/AddIns/MonoDevelop.MonoGame" Main/MonoDevelop.MonoGame.mpack
}
