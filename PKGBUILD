# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=gnome-shell-extension-mullvad-indicator-git
pkgver=42.r5.g7ca8fd6
pkgrel=1
pkgdesc="GNOME extension to track Mullvad connectivity"
arch=('any')
url="https://github.com/Pobega/gnome-shell-extension-mullvad-indicator"
license=('Apache')
depends=('gnome-shell')
makedepends=('git' 'zip')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/Pobega/gnome-shell-extension-mullvad-indicator.git'
        'https://github.com/Pobega/gnome-shell-extension-mullvad-indicator/pull/24.patch')
sha256sums=('SKIP'
            '4992e560e1f14e475ec1d9313eeb201f31b1bca8b9d00417bd7c7d40ff2e0220')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"

  # Port to GNOME 43
  git am ../24.patch
}

build() {
  cd "$srcdir/${pkgname%-git}"
#  make genlocale
  make zip
}

package() {
  _uuid='mullvadindicator@pobega.github.com'

  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
  bsdtar -xvf $_uuid.zip -C "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"

  install -Dm644 schemas/org.gnome.Shell.Extensions.MullvadIndicator.gschema.xml -t \
    "$pkgdir/usr/share/glib-2.0/schemas"

  rm -rf "$pkgdir/usr/share/gnome-shell/extensions/$_uuid/schemas/"
}
