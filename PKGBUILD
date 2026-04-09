# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: skrewball <aur at joickle dot com> gitlab.com/skrewball/aur
# Contributor: malacology <guoyizhang at malacology dot net>
pkgname=gnome-shell-extension-blur-my-shell
pkgver=72
pkgrel=1
pkgdesc="Extension that adds a blur look to different parts of the GNOME Shell"
arch=('any')
url="https://github.com/aunetx/blur-my-shell"
license=('MIT')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
)
optdepends=('gnome-rounded-blur: help fix the corners issue found while using dynamic blur')
source=("git+https://github.com/aunetx/blur-my-shell.git#tag=v$pkgver")
sha256sums=('75e1519568d201220a598933b3084a15fea9166dade317cb9ffb54afaf1df2c0')

prepare() {
  cd blur-my-shell
}

build() {
  cd blur-my-shell
  make
}

package() {
  cd blur-my-shell
   _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "build/${_uuid}.shell-extension.zip" \
    -C "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share"

  install -Dm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
