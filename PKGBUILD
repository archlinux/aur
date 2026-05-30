# Maintainer: AkitaOnRails <fabio.akita@gmail.com>
pkgname=mangaplus-reader-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Personal-use desktop reader for MANGA Plus (talks to the official API with your own deviceSecret)"
arch=('x86_64')
url="https://github.com/akitaonrails/frank_mangaplus"
license=('MIT')
depends=('webkit2gtk-4.1' 'hicolor-icon-theme' 'fuse2')
provides=('mangaplus-reader')
conflicts=('mangaplus-reader')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/FRANK.MANGA+_${pkgver}_amd64.AppImage")
sha256sums=('06cbf56315e63a34ed667fa6a866869f807bd353728d1a77d9b81b5e7730ac69')
noextract=("${pkgname}-${pkgver}.AppImage")

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/mangaplus-reader/mangaplus-reader.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/mangaplus-reader/mangaplus-reader.AppImage "${pkgdir}/usr/bin/mangaplus-reader"

    if [[ -f "${srcdir}/squashfs-root/usr/share/applications/mangaplus-desktop.desktop" ]]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/mangaplus-desktop.desktop" \
  "${pkgdir}/usr/share/applications/mangaplus-reader.desktop"
        sed -i 's|Exec=mangaplus-desktop|Exec=mangaplus-reader|g' \
  "${pkgdir}/usr/share/applications/mangaplus-reader.desktop"
    fi

    for size in 32x32 128x128 256x256; do
        for cand in "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}/apps/"*.png; do
  [[ -f "$cand" ]] || continue
  install -Dm644 "$cand" \
      "${pkgdir}/usr/share/icons/hicolor/${size}/apps/mangaplus-reader.png"
  break
        done
    done
}
