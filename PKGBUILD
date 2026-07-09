# Maintainer: Agastya <me@hanabi.in>

_pkgname=Gitpulsar
pkgname=gitpulsar-appimage
pkgver=1.1.0
pkgrel=1
pkgdesc="A lightweight, GNOME-native Git GUI built with Rust, GTK4, and libadwaita"
arch=('x86_64')

url="https://gitlab.com/ilshat-apps/gitpulsar"
license=('GPL-3.0-or-later')

depends=('hicolor-icon-theme')
provides=('gitpulsar')
conflicts=('gitpulsar')

options=('!strip')

_appname=${_pkgname}-v${pkgver}-x86_64.AppImage
source=("${_appname}::${url}/-/jobs/artifacts/v${pkgver}/raw/${_appname}?job=appimage")
sha256sums=('b1b6890ab4b9ac6e64b8d7501c03122d1f289a145befe0792a7c6b666319f036')

_desktop=io.gitlab.ilshat_apps.gitpulsar.desktop
_icon=io.gitlab.ilshat_apps.gitpulsar.svg

prepare() {
  chmod +x "${_appname}"
  "${srcdir}/${_appname}" --appimage-extract
}

package() {
  # Appimage
  install -Dm755 "${srcdir}/${_appname}" \
    "${pkgdir}/opt/${pkgname}/${_appname}"

  # Desktop file
  install -Dm644 "${srcdir}/squashfs-root/${_desktop}" \
    "${pkgdir}/usr/share/applications/${_desktop}"

  # Icons
  install -Dm644 \
    "${srcdir}/squashfs-root/usr/share/icons/hicolor/scalable/apps/${_icon}" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${_icon}" 

  # Symlink executable
  install -d "${pkgdir}/usr/bin"

  ln -s "/opt/${pkgname}/${_appname}" \
    "${pkgdir}/usr/bin/gitpulsar-gtk"
}
