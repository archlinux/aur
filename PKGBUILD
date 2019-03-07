# Maintainer: Andrew Armstrong <smarttechmale31@yahoo.com>
# Contributor: Mike Roll <scaryspiderpig@gmail.com>

_pkgname=monogame
pkgname="${_pkgname}-bin"
pkgver=3.7.1	
pkgrel=1
pkgdesc="Open Source implementation of the Microsoft XNA 4 Framework (official binary build)."
arch=('x86_64')
url="http://www.monogame.net/"
license=('custom', 'MIT')
depends=('mono'
         'gtk-sharp-3'
         'openal'
	 'unzip')
optdepends=('monodevelop: to use the bundled IDE addin'
            'mono-pcl: to use the PCL template'
	    'visual-studio-code-bin: Editor for building and debugging modern web and cloud application')
conflicts=("${_pkgname}" 'tao-framework' 'tao-framework-svn')
provides=("${_pkgname}")
install="monogame.install"
source=("https://github.com/MonoGame/MonoGame/releases/download/v${pkgver}/monogame-sdk.run"
        "https://raw.githubusercontent.com/MonoGame/MonoGame/v${pkgver}/LICENSE.txt"
        "MonogamePipeline.desktop"
        "monogame-pipeline-tool"
        "mgcb")
md5sums=('6047c8051c3563dd5af92cffb4bf887d'
         'c491255ec0d1735cfeecad47ce7efae1'
         '587c27465d575e4522de212346f3f5a0'
         'cf3315b4e5d22d3e7e6ca1717612d080'
         '7e1cfadd88e42bac7fc5739a512e1ce4')


prepare() {
	sh monogame-sdk.run --noexec --target "${_pkgname}-${pkgver}"
}

package() {
    # License
    install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"

    cd "${_pkgname}-${pkgver}"
    mgroot="/opt/monogame"
    mglink="/usr/lib/mono/xbuild/MonoGame/v3.7.1"
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
    install -D -m664 "Main/x-mgcb.xml" "${pkgdir}/usr/share/mime/packages/mgcb.xml"

    # Application launcher
    install -D -m664 "../MonogamePipeline.desktop" "${pkgdir}/usr/share/applications/MonogamePipeline.desktop"

    # Monodevelop AddIn
    mkdir -p "${pkgdir}/usr/lib/monodevelop/AddIns/MonoDevelop.MonoGame"
    unzip -qo -d "${pkgdir}/usr/lib/monodevelop/AddIns/MonoDevelop.MonoGame" "Main/MonoDevelop.MonoGame.mpack"
}
