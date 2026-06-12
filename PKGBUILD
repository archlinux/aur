# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-o-tiling
pkgver=2.8.17
pkgrel=1
pkgdesc="Auto-tiling extension for GNOME Shell with active hint border, customizable workspace overview and theme consistency."
arch=('any')
url="https://github.com/oliwebd/o-tiling"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'jq'
  'pnpm'
  'zip'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('25393670ae9f280e708df0f8b254f7a7764414c4448786493a1dc0d5be7a70b8')

prepare() {
  cd "o-tiling-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  pnpm install --frozen-lockfile
}

build() {
  cd "o-tiling-$pkgver"
  export PNPM_HOME="$srcdir/pnpm-home"
  make build
  make pack
}

package() {
  cd "o-tiling-$pkgver"
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
