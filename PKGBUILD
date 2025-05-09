# Maintainer: Dan Johansen <strit@archlinux.org>

_pkgname=wf-config-hjson
pkgname=wayfire-plugins-wfconfig-hjson
pkgver=0.9.0.1
pkgrel=1
pkgdesc="Wayfire plugin to read/write the configuration in the hjson format. Usage: wayfire --backend hjson-config-backend --config /path/to/config/file.hjson"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/wayfireplugins/${_pkgname}"
license=('MIT')
depends=(
        'wayfire'
        'wlroots0.17'
)
makedepends=('meson'
            'ninja'
            'glm')
source=("https://gitlab.com/wayfireplugins/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
sha256sums=('e73ca51a2ff4aaf771a2a4a36a0f8962a3dc5e322f0a870af4d312f603d00434')

prepare() {
  cd "${_pkgname}-v${pkgver}"
  #fix building against wlroots 0.17
  sed -i 's/wlroots-0.18/wlroots/g' meson.build
  sed -i 's/>=0.18.2/>=0.17.4/g' meson.build
}
build() {
  cd "${_pkgname}-v${pkgver}"
  PKG_CONFIG_PATH=/usr/lib/wlroots0.17/pkgconfig \
  meson setup .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

