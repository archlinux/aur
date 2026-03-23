# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Igor Dyatlov <dyatlov.igor@protonmail.com>
pkgname=gnome-shell-extension-wintile
pkgver=2026.03.22
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
source=("wintile-$pkgver-1.tar.gz::https://github.com/fmstrat/wintile/archive/v$pkgver-1.tar.gz")
sha256sums=('ec0c6cb8f965a70b2b893f6d475c51817bb9f2e247db66fba3aeffbe388f866a')

build() {
  cd "wintile-$pkgver-1"
  sh build.sh
}

package() {
  cd "wintile-$pkgver-1"
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf dist/G45/${_uuid}.zip -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}" --no-same-owner

  install -Dvm644 dist/G45/build/schemas/*.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
