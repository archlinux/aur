_pkgname=follow
_Pkgname=Follow
_disname=Follow
major_version=0
minor_version=1
patch_version=2
phase='beta.0'

pkgname="${_pkgname}"-appimage
pkgver="${major_version}.${minor_version}.${patch_version}_${phase}"
pkgrel=1
pkgdesc="🧡 Next generation information browser"
arch=('x86_64')
url="https://github.com/RSSNext/follow"
license=('GPL-3')
options=('!strip' '!debug')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
provides=('follow')

source_x86_64=("${_Pkgname}-${major_version}.${minor_version}.${patch_version}_${phase}-linux-amd64.AppImage::https://github.com/RSSNext/follow/releases/download/v${major_version}.${minor_version}.${patch_version}-${phase}/${_Pkgname}-${major_version}.${minor_version}.${patch_version}-${phase}-linux-x64.AppImage")
sha256sums_x86_64=("61afeee5f5aeed662f56330b1a300e0bc4d55a266a0f67f0c9f85102b8a0cbc9")

_appimage="${_Pkgname}-${major_version}.${minor_version}.${patch_version}_${phase}-linux-amd64.AppImage"
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
    -e "s|Exec=Follow --no-sandbox --disable-setuid-sandbox %u|Exec=follow --no-sandbox --disable-setuid-sandbox %u|" \
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
