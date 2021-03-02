# Maintainer: taotieren <admin@taotieren.com>

_pkgname=Mark-Mind
_gitpkgname=Mark.Mind
_oldpkgname=mind
pkgname=mark-mind
pkgver=1.1.9
pkgrel=1
pkgdesc="Mark Mind — Next generation mind map editor"
arch=('any')
url="https://github.com/MarkMindLtd/Mark-Mind"
license=('MIT')
provides=(${pkgname})
conflicts=(${pkgname})
replaces=(${pkgname})
depends=()
makedepends=('coreutils')
backup=()
options=('!strip')
source=("${_pkgname}-${pkgver}.AppImage::https://github.com/MarkMindLtd/${_pkgname}/releases/download/v${pkgver//_/-}/${_gitpkgname}-${pkgver}.AppImage"
    "${pkgname}.desktop")
sha256sums=(
      'b1bfeb234778cb53c1c40d25ea72a01e3aa238f3badb1555caac7f44593ec59e'  
    'e726247f694723f9c8cec971efa8eabe321b4341df06c0de6157581ecb285764'
)

prepare() {
    chmod u+x ${srcdir}/${_pkgname}-${pkgver}.AppImage

    ${srcdir}/${_pkgname}-${pkgver}.AppImage --appimage-extract
}

package() {
    find ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
    find ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +

    install -d ${pkgdir}/opt/${pkgname}
    cp -r ${srcdir}/squashfs-root/* ${pkgdir}/opt/${pkgname}

    # remove broken or unused files and directories
    rm -r ${pkgdir}/opt/${pkgname}/usr/
    rm ${pkgdir}/opt/${pkgname}/AppRun
    rm ${pkgdir}/opt/${pkgname}/${_oldpkgname}.desktop
    rm ${pkgdir}/opt/${pkgname}/${_oldpkgname}.png

    find ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +

    install -d ${pkgdir}/usr/share/icons
    cp -r ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

    install -d ${pkgdir}/usr/bin
    ln -s ../../opt/${pkgname}/${_oldpkgname} ${pkgdir}/usr/bin/${pkgname}

    install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
