# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-gnome-ui-tune-git
_uuid=gnome-ui-tune@itstime.tech
pkgver=1.7.3.r0.gc03e0e0
pkgrel=1
pkgdesc="Tunes GNOME Overview UI to make it more usable."
arch=('any')
url="https://github.com/axxapy/gnome-ui-tune"
license=('GPL3')
depends=('gnome-shell')
makedepends=('git' 'jq')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/axxapy/gnome-ui-tune.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/gnome-ui-tune
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/gnome-ui-tune
  make gettext
  make dist
}

package() {
  cd $srcdir/gnome-ui-tune
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/org.gnome.shell.extensions.gnome-ui-tune.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas/"

  rm "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/LICENSE"
}
