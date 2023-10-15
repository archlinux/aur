# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-battery-health-charging-git
_uuid=Battery-Health-Charging@maniacx.github.com
pkgver=r295.72edc97
pkgrel=2
pkgdesc="An extension to maximize the battery life of laptops by setting their charging threshold/modes."
arch=('any')
url="https://github.com/maniacx/Battery-Health-Charging"
license=('unknown')
depends=('gnome-shell' 'polkit')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=battery-health-charging.install
source=('git+https://github.com/maniacx/Battery-Health-Charging.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Battery-Health-Charging"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/Battery-Health-Charging"
  gnome-extensions pack ./ \
    --extra-source=devices/ \
    --extra-source=icons/ \
    --extra-source=lib/ \
    --extra-source=preferences/ \
    --extra-source=resources/ \
    --extra-source=tool/ \
    --extra-source=ui/ \
    --podir=po \
    --force
}

package() {
  cd "$srcdir/Battery-Health-Charging"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}"
  bsdtar xvf "${_uuid}.shell-extension.zip" -C \
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/" --no-same-owner

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/org.gnome.shell.extensions.Battery-Health-Charging.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
