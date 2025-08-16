# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=gnome-shell-extension-wintile
_pkgver=2024.11.25-1
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Windows 10 window tiling for GNOME"
arch=('any')
url="https://nowsci.com/wintile"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'jq'
  'zip'
)
source=("wintile-${_pkgver}.tar.gz::https://github.com/fmstrat/wintile/archive/v${_pkgver}.tar.gz")
sha256sums=('ca96576bf9ea4c93d64d0b45365ed4a9dfda49d47b5e2e040872d46aa6f2557e')

build() {
  cd "wintile-${_pkgver}"
  sh build.sh
}

package() {
  cd "wintile-${_pkgver}"
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf dist/G45/${_uuid}.zip -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" --no-same-owner

  install -Dvm644 dist/G45/build/schemas/*.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
