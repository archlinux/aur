# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=gnome-shell-extension-wintile
pkgver=2026.05.26
pkgrel=2
_rev=2
pkgdesc="Windows 10 window tiling for GNOME"
arch=('any')
url="https://nowsci.com/wintile"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'jq'
  'zip'
)
source=("wintile-$pkgver-${_rev}.tar.gz::https://github.com/fmstrat/wintile/archive/v$pkgver-${_rev}.tar.gz")
sha256sums=('49395d804860845784f6aa6c72eee949e07cab69a634f9a0125e964d0b2fbc8d')

build() {
  cd "wintile-$pkgver-${_rev}"
  sh bin/build.sh
}

package() {
  cd "wintile-$pkgver-${_rev}"
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf dist/G45/${_uuid}.zip -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" --no-same-owner

  install -Dvm644 dist/G45/build/schemas/*.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
