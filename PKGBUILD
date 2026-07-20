# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-o-tiling
pkgver=2.9.17
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
sha256sums=('00847b2276e51b88ec63dbb12d600a5088e7a4c485bfedd8ca7588215a4a6a19')

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
