# Maintainer: William Marcq <william@marcq.me>

_pkgname=code-notes
pkgname="${_pkgname}-appimage"
pkgver=1.2.4
pkgrel=1
pkgdesc="A simple code snippet & gist manager for developers built with Electron & Vue.js"
arch=(x86_64)
url="https://github.com/lauthieb/code-notes"
license=(MIT)
depends=()
makedepends=()
provides=("$_pkgname")
conflicts=()
_filename="${_pkgname}-${pkgver}-${arch}.AppImage"
source=(
  "https://github.com/lauthieb/code-notes/releases/download/${pkgver}/${_filename}"
)

# Mandatory parameters
sha512sums=(SKIP)
noextract=("$_filename")
options=(!strip)

prepare() {
  chmod +x ${_filename}
  ./${_filename} --appimage-extract "usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
  ./${_filename} --appimage-extract "${_pkgname}.desktop"
  sed -ri "s|Exec=AppRun|Exec=/usr/bin/${_pkgname}|" "squashfs-root/${_pkgname}.desktop"
}

package() {
  install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png" -t "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
  install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm755 "${_filename}" "${pkgdir}/usr/bin/${_pkgname}"
}
