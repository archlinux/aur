pkgname="techmino-client"
pkgver=0.17.9
pkgrel=1
pkgdesc="Techmino:方块研究所"
arch=('x86_64')
url="http://home.techmino.org"
license=('(L)GPL')
depends=(fuse xorg-xrandr)
makedepends=(curl gawk)
options=(!strip)
_pkgname="Techmino_${pkgver}.Appimage"
_repo="26F-Studio/Techmino"
source=("${_pkgname}::https://github.com/${_repo}/releases/latest/download/Techmino_Linux.AppImage")
sha256sums=('SKIP')
_installdir=/opt/appimages
_installname=techmino

prepare() {
	cd ${srcdir}
	chmod a+x ${_pkgname}
	${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+Exec=app+Exec=env DESKTOPINTEGRATION=no ${_installdir}/${_installname}.AppImage+" "squashfs-root/Techmino.desktop"
    sed -i "s/[[:space:]]%U$//" "squashfs-root/Techmino.desktop"
}

package() {
    install -Dm755 "squashfs-root/icon.png" "${pkgdir}/usr/share/icons/icon.png"
    install -Dm755 ${_pkgname} "${pkgdir}/${_installdir}/${_installname}.AppImage"
    install -Dm644 "squashfs-root/Techmino.desktop" "${pkgdir}/usr/share/applications/${_installname}.desktop"
}

pkgver(){
     curl "https://api.github.com/repos/${_repo}/releases/latest" | awk -F '[",v]+' '/tag_name/{print $4}'
}
