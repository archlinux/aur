# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=gnome-shell-extension-battery-health-charging-git
_uuid=Battery-Health-Charging@maniacx.github.com
pkgver=r278.73e683b
pkgrel=1
pkgdesc="An extension to maximize the battery life of laptops by setting their charging threshold/modes."
arch=('any')
url="https://github.com/maniacx/Battery-Health-Charging"
license=('unknown')
depends=('gnome-shell<=1:44.6' 'polkit')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=battery-health-charging.install
source=('git+https://github.com/maniacx/Battery-Health-Charging.git#branch=GN44-main')
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
    "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/"

  mv "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/locale" "$pkgdir/usr/share/"

  install -Dm644 schemas/org.gnome.shell.extensions.Battery-Health-Charging.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas/"
  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/${_uuid}/schemas"
}
