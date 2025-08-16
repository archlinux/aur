# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Philip Goto <philip.goto@gmail.com>
pkgname=gnome-shell-extension-transparent-top-bar-git
pkgver=r79.d0a3f83
pkgrel=1
pkgdesc="GNOME Shell extension that brings back the transparent top bar when free-floating"
arch=('any')
url="https://github.com/lamarios/gnome-shell-extension-transparent-top-bar"
license=('LicenseRef-unknown')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
  'ruby-sass'
  'zip'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/lamarios/gnome-shell-extension-transparent-top-bar.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  sed -i 's/com.ftpix/ftpix.com/g' Makefile
}

build() {
  cd "${pkgname%-git}"
  make
}

package() {
  cd "${pkgname%-git}"
  _uuid=$(jq -r .uuid src/metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvzf "build/${_uuid}.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  install -Dvm644 src/schemas/*.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rfv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"
}
