# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-gnome-ui-tune-git
pkgver=1.10.2.r0.g03706f7
pkgrel=1
pkgdesc="Tunes GNOME Overview UI to make it more usable."
arch=('any')
url="https://github.com/axxapy/gnome-ui-tune"
license=('GPL-3.0-or-later')
depends=('gnome-shell')
makedepends=(
  'git'
  'jq'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/axxapy/gnome-ui-tune.git')
sha256sums=('SKIP')

pkgver() {
  cd gnome-ui-tune
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd gnome-ui-tune
  make gettext
  make dist
}

package() {
  cd gnome-ui-tune
  _uuid=$(jq -r .uuid metadata.json)

  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dvm644 schemas/*.gschema.xml -t "$pkgdir/usr/share/glib-2.0/schemas/"

  rm -rv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
  rm -v "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/LICENSE"
}
