# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Maintainer:  Nixugea
# Maintainer:  holybaechu <holybaechu@proton.me>

_pkgname="labymodlauncher"
pkgname="${_pkgname}-appimage"
pkgver=2.1.10
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
b2sums_x86_64=('6986ff9ce0c41602fb2599f86fa880e6eaf16732e57af1bdb436216a70eaed4af1fe178c0bd50469459680af00245199b1f56d1a76365a08c1c0e482f2838d88')
options=('!strip')

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
