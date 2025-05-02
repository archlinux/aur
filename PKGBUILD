_pkgname=follow
_Pkgname=Folo
_disname=Folo
major_version=0
minor_version=4
patch_version=4
# phase='beta.0'

pkgname="${_pkgname}"-appimage
pkgver="${major_version}.${minor_version}.${patch_version}"
pkgrel=1
pkgdesc="🧡 Next generation information browser"
arch=('x86_64')
url="https://github.com/RSSNext/Folo"
license=('GPL-3')
options=('!strip' '!debug')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('follow')

source_x86_64=("${_Pkgname}-${major_version}.${minor_version}.${patch_version}-linux-amd64.AppImage::https://github.com/RSSNext/follow/releases/download/v${major_version}.${minor_version}.${patch_version}/${_Pkgname}-${major_version}.${minor_version}.${patch_version}-linux-x64.AppImage")
sha256sums_x86_64=("09b8810fc4949207a3eb4096227f2b3fd55608e9241346bc874a4fbfcbaf9207")

_appimage="${_Pkgname}-${major_version}.${minor_version}.${patch_version}-linux-amd64.AppImage"
noextract=("${_appimage}")

prepare() {
  chmod +x "${_appimage}"
  ./"${_appimage}" --appimage-extract
}

build() {
  # Adjust .desktop so it will work outside of AppImage container
  sed -i \
    -e "s|Icon=.*|Icon=/usr/share/icons/${_pkgname}.png|" \
    "squashfs-root/${_disname}.desktop"
  # Change Exec
  sed -i \
    -e "s|Exec=Folo --no-sandbox --disable-setuid-sandbox %u|Exec=follow --no-sandbox --disable-setuid-sandbox %u|" \
    "squashfs-root/${_disname}.desktop"

  # Fix permissions; .AppImage permissions are 700 for all directories
  chmod -R a-x+rX squashfs-root/usr
}

package() {
  # AppImage
  install -Dm755 "${_appimage}" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_disname}.desktop" \
    "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon images
  install -dm755 "${pkgdir}/usr/share/"
  cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share/"
  ln -s "$(realpath ${srcdir}/squashfs-root/${_disname}.png --relative-to ${srcdir}/squashfs-root/usr/share/icons)" \
    "${pkgdir}/usr/share/icons/${_pkgname}.png"

  # Symlink executable
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"

  # Symlink license
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/"
  ln -s "/opt/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
