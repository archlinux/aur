# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  Nixugea
# Maintainer:  holybaechu <holybaechu@proton.me>

_pkgname="labymodlauncher"
pkgname="${_pkgname}-appimage"
pkgver=2.1.12
pkgrel=1
pkgdesc="A launcher for LabyMod, a Minecraft client that adds a bunch of useful features"
arch=('x86_64')
url="https://www.labymod.net"
license=('custom:Proprietary')
depends=('glibc' 'zlib') # 'hicolor-icon-theme'
provides=("${_pkgname}" 'labymod-appimage')
conflicts=("${_pkgname}" 'labymod-appimage')
replaces=('labymod-appimage')
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.AppImage::https://releases.r2.labymod.net/launcher/linux/x64/LabyMod%20Launcher-${pkgver}.AppImage")
b2sums_x86_64=('7d674fd12280de813fdca96beb49eae753fa19acc3ce5df544d6d49d06d798ce8700c78498c5cf2654d6274f371394a99b56cc193903f1473ce55004a633a749')
options=('!strip' '!debug')

prepare() {
  cd "${srcdir}"
  chmod +x "${_pkgsrc}-${CARCH}.AppImage"
  ./"${_pkgsrc}-${CARCH}.AppImage" --appimage-extract > /dev/null

  rm -rf "${_pkgsrc}-${CARCH}"
  mv -f "squashfs-root" "${_pkgsrc}-${CARCH}"
}

build() {
  cd "${srcdir}"
  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX "${_pkgsrc}-${CARCH}"/
}

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"

  cd "${srcdir}/${_pkgsrc}-${CARCH}"
  install -vDm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # find "usr/share" -type f -exec \
  #   install -vDm644 "{}" "${pkgdir}/{}" \;

  cd "resources/icons"
  install -vDm644 "icon.png" "${pkgdir}/usr/share/pixmaps/${_pkgname}.png"

  install -vdm755 "${pkgdir}/usr/bin"
  ln -vsf "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
}
