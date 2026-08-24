#Maintainer: Mian <docgoosenn@gmail.com>

pkgname=funsync-player-bin
_pkgname=FunSync-Player
pkgver=0.9.2
pkgrel=1
pkgdesc="Local desktop video player with device integration for synchronized funscript playback"
arch=('x86_64')
url="https://github.com/DaveMakesWaves/funsync-player"
license=('GPL-3.0-or-later')
depends=('fuse')
optdepends=('intel-media-driver: hardware video acceleration support for Intel'
	    'nouveau: hardware video acceleration support for NVIDIA'
            'mesa: hardware video acceleration support for AMD'
            'libva-nvidia-driver: hardware video acceleration support for NVIDIA')
options=(!strip)
source_x86_64=("${_pkgname}-${pkgver}.AppImage::https://github.com/DaveMakesWaves/funsync-player/releases/download/v${pkgver}/${_pkgname}-${pkgver}.AppImage"
              )
noextract=("${_pkgname}-${pkgver}.AppImage")
sha256sums_x86_64=('2574f712a8c19ef1506471c94c596d48fc51973aeae22f40f320b22ba7ed0472')

prepare() {
	chmod +x "${srcdir}/${_pkgname}-${pkgver}.AppImage"
	"${srcdir}/${_pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
   install -dm755 "${pkgdir}/opt/${pkgname}"
   cp -a squashfs-root/* "${pkgdir}/opt/${pkgname}/"
   chmod -R u+rwX,go+rX "${pkgdir}/opt/${pkgname}"
   chmod +x "${pkgdir}/opt/${pkgname}/funsync-player"
   
   install -dm755 "$pkgdir/usr/bin"
   ln -s "/opt/${pkgname}/funsync-player" \
        "${pkgdir}/usr/bin/funsync-player"

    #install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/opt/${_pkgname}/LICENSE"

    # Symlink license
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    #ln -s "/opt/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"

    install -Dm644 squashfs-root/funsync-player.desktop \
	    "${pkgdir}/usr/share/applications/funsync-player.desktop"
    
    sed -i 's|^Exec=.*|Exec=/usr/bin/funsync-player|' \
        "${pkgdir}/usr/share/applications/funsync-player.desktop"
    
    install -Dm644 squashfs-root/funsync-player.png \
	    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/funsync-player.png"
}
