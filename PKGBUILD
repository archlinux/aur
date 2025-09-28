# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-xwayland-indicator
pkgver=49.0
pkgrel=1
pkgdesc="Determine whether a window in GNOME uses xwayland"
arch=('any')
url="https://codeberg.org/swsnr/gnome-shell-extension-xwayland-indicator"
license=('EUPL-1.2')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
  'just'
  'npm'
)
source=("git+https://codeberg.org/swsnr/gnome-shell-extension-xwayland-indicator.git#tag=v$pkgver")
sha256sums=('3a986c22a4ed3c9c2160bb320de5263bea1ef0f43125383a0deb80e3a4962bfc')

build() {
  cd "$pkgname"
  export npm_config_cache="$srcdir/npm_cache"
  npm install
  just pack
}

package() {
  cd "$pkgname"
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar -xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
