# Maintainer: Will Price <will.price94@gmail.com>
# Maintainer: tee < teeaur at duck dot com >

# Inspired by https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=jetbrains-toolbox
# and https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=hyper-appimage

pkgname=gingko
pkgver=2.4.15
pkgrel=1
pkgdesc='Gingko is a new kind of tool, that lets you shape your ideas with lists, outlines and cards, all in the same clean interface.'
arch=('x86_64' 'i686')
url='https://gingko.io/'
license=('Commercial')
depends=()
options=('!strip')
source=("https://github.com/gingko/client/releases/download/v${pkgver}/Gingko-${pkgver}.AppImage"
        "gingko.desktop")
b2sums=('ea4893b5456ff634428825e90a92fe855fc0986c9857e886fb64052e34941332d025314df3ca085b049e9c79e2a3a2c6d0a0bacf39543486c6be5280c43a0d3c'
        '1ecd3d282a6e8ba58373546ea3a6d285edbe06c3f74c1fe67064e3d0cc395af4d249e5f446f088e5778d318fdd540843a8b6787c7faa36e18214142985541e33')

prepare() {
    chmod +x "${srcdir}/Gingko-${pkgver}.AppImage"
    "${srcdir}/Gingko-${pkgver}.AppImage" --appimage-extract
}

package() {
  install -d -m 755 "${pkgdir}/usr/bin/"
  install -d -m 755 "${pkgdir}/opt/${pkgname}"
  cp -Rr "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}"

  install -d -m755 "${pkgdir}/usr/share/icons/hicolor"
  cp -Rr "${srcdir}/squashfs-root/usr/share/icons/hicolor/" \
         "${pkgdir}/usr/share/icons/"

  install -D -m 644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/${pkgname}"

  # fix file permissions - all files as 644 - directories as 755
  # by default directories come out as 700
  find "${pkgdir}/"{opt,usr} -type d -exec chmod 755 {} \;
  for exe in AppRun gingko-client; do
      chmod +x "${pkgdir}/opt/${pkgname}/$exe"
  done
}
