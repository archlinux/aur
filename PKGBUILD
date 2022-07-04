# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
pkgname=showmethekey
pkgver=1.7.2
pkgrel=1
pkgdesc="A screenkey alternative that works under Wayland via libinput."
arch=("x86_64" "i686" "aarch64" "armv7h" "armv6h")
url="https://showmethekey.alynx.one/"
license=("Apache")
depends=("libevdev" "udev" "libinput" "glib2" "gtk4" "json-glib" "cairo" "pango" "libxkbcommon" "polkit")
makedepends=("meson")
source=("https://github.com/AlynxZhou/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('33ab29ac3906239bbe93ed753389ad0f2ce226692c0d34c134493ac775424424a37a9b5b809ac037b66e94949da7d83fd05de404cb6930d2ceda5bba1f313ed9')

prepare() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
}

build() {
  cd "${pkgname}-${pkgver}/build"
  arch-meson . ..
  meson compile
}

package() {
  cd "${pkgname}-${pkgver}/build"
  meson install --destdir "${pkgdir}"
  # Meson sets 755 for dirs, but polkit is 750.
  install -d -o root -g 102 -m 750 "$pkgdir/usr/share/polkit-1/rules.d"
}
