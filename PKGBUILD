# Maintainer: Dan Johansen <strit@strits.dk>

_pkgname=dbusqt
pkgname=wayfire-plugins-dbusqt
pkgver=0.8.0
pkgrel=4
pkgdesc="Wayfire plugin to expose a few internal features via DBus. This plugin is a temporary waypoint until protocols are developed to cater to all the needs"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
makedepends=('meson' 'ninja' 'glm' 'wayfire' 'qt5-base' 'libdbusmenu-qt5')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz"
        "https://gitlab.com/wayfireplugins/dbusqt/-/commit/68f4844e5dfb71b809266896393817d50813a174.patch")
        #"glm.pc") #not used anymore, but kept in repo as a backup if it's needed again
md5sums=('e6776eafd520529b59baa547942022fc'
         '565e4ab49a66828694113f933b4f06bd')

prepare() {
  cd "${_pkgname}-v${pkgver}"
  patch -Np1 -i ../68f4844e5dfb71b809266896393817d50813a174.patch #fix compilation against wlroots 0.17
}

build() {
  cd "${_pkgname}-v${pkgver}"
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build

}

package() {
  depends=('wayfire' 'qt5-base' 'libdbusmenu-qt5')
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}
