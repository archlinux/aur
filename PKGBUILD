pkgname="techmino-client"
pkgver=0.17.8
pkgrel=1
pkgdesc="Techmino:方块研究所"
arch=('x86_64')
url="http://home.techmino.org"
license=('(L)GPL')
depends=(fuse xorg-xrandr)
makedepends=(curl gawk)
options=(!strip)
_pkgname="Techmino_Linux.AppImage"
_repo="26F-Studio/Techmino"
source=("https://github.com/${_repo}/releases/latest/download/${_pkgname}")
sha256sums=('SKIP')
_installdir=/opt/appimages
_installname=techmino

prepare() {
	cd ${srcdir}
	chmod a+x ${_pkgname}
	${srcdir}/${_pkgname} --appimage-extract
    sed -i "s+wrapper-love+env DESKTOPINTEGRATION=no ${_installdir}/${_installname}.AppImage+" "squashfs-root/Techmino.desktop"
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
