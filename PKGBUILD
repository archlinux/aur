# Maintainer: Mike Roll <scaryspiderpig@gmail.com>

_pkgname=monogame
pkgname="${_pkgname}-bin"
pkgver=3.6
pkgrel=1
pkgdesc="Open Source implementation of the Microsoft XNA 4 Framework (official binary build)."
arch=('x86_64')
url="http://www.monogame.net/"
license=('custom', 'MIT')
depends=('mono'
         'gtk-sharp-3'
         'openal')
optdepends=('monodevelop: to use the bundled IDE addin'
            'mono-pcl: to use the PCL template')
conflicts=("${_pkgname}" 'tao-framework' 'tao-framework-svn')
provides=("${_pkgname}")
install="monogame.install"
source=("http://www.monogame.net/releases/v${pkgver}/monogame-sdk.run"
        "https://raw.githubusercontent.com/mono/MonoGame/develop/LICENSE.txt"
        "MonogamePipeline.desktop"
        "monogame-pipeline-tool"
        "mgcb")
md5sums=('68d6b7a7403f718d2502250231db82f4'
         '2c8089207448fa9571c65eb00f0c9cd1'
         '587c27465d575e4522de212346f3f5a0'
         'e2e0f2a74547318fc0fa7dc76e79bba8'
         'b972af897b3607d2e14bb8b51655d549')

prepare() {
	sh monogame-sdk.run --noexec --target "${_pkgname}-${pkgver}"
}

package() {
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
    install -D -m775 "../monogame-pipeline-tool" "${pkgdir}/usr/bin/monogame-pipeline-tool"
    install -D -m775 "../mgcb" "${pkgdir}/usr/bin/mgcb"

    # Monogame icon
    install -D -m664 "Main/monogame.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/mimetypes/monogame.svg"

    # MIME type
    install -D -m664 "Main/mgcb.xml" "${pkgdir}/usr/share/mime/packages/mgcb.xml"

    # Application launcher
    install -D -m664 "../MonogamePipeline.desktop" "${pkgdir}/usr/share/applications/MonogamePipeline.desktop"

    # Monodevelop AddIn
    mkdir -p "${pkgdir}/usr/lib/monodevelop/AddIns/MonoDevelop.MonoGame"
    unzip -qo -d "${pkgdir}/usr/lib/monodevelop/AddIns/MonoDevelop.MonoGame" Main/MonoDevelop.MonoGame.mpack
}
