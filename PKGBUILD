# Maintainer: Jeremy Gust <jeremy AT plasticsoup DOT net>
# Contributor: Carson Rueter <swurl at swurl dot xyz>
# Contributor: tinywrkb <tinywrkb@gmail.com>
# Contributor: Morten Linderud <foxboron@archlinux.org>
# Contributor: Maxim Baz <rofi at maximbaz dot com>
# Contributor: Anatol Pomozov
# Contributor: Benjamin Chrétien <chretien + aur [at] lirmm [dot] fr>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Rasi <rasi@xssn.at>
# Contributor: Sean Pringle <sean.pringle@gmail.com>
# Contributor: SanskritFritz (gmail)
pkgname=rofi-lbonn-wayland
pkgver=1.7.5+wayland2
pkgrel=1
pkgdesc='A window switcher, run dialog and dmenu replacement - fork with wayland support'
arch=(x86_64)
url="https://github.com/lbonn/rofi"
license=(MIT)
depends=(libxdg-basedir
         libxkbcommon-x11
         librsvg
         startup-notification
         wayland
         xcb-util-cursor
         xcb-util-wm
         xcb-util-xrm)
makedepends=(check
             meson
             wayland-protocols)
provides=(rofi)
conflicts=(rofi)
source=("${url}/releases/download/${pkgver}/${pkgname%-lbonn-wayland}-${pkgver}.tar.gz")
sha256sums=('025a390469008179eaffaa599e2eabbd81a77f7141d9038e008304673ba19843')

prepare() {
   cd ${pkgname%-lbonn-wayland}-${pkgver}
   sed -i "s/xfce4-terminal.wrapper/xfce4-terminal/g" script/rofi-sensible-terminal
   # This is copied from the offical Arch rofi PKGBUILD.
   # I do not use xfce, so if this causes any issue please let me know.
}
build() {
   local meson_options=(-Dwayland=enabled -Dcheck=enabled)
   cd ${pkgname%-lbonn-wayland}-${pkgver}
   arch-meson build #"${meson_options[@]}"
   meson compile -C build
}

check() {
   cd ${pkgname%-lbonn-wayland}-${pkgver}
   LC_ALL=C meson test -C build
}

package() {
   cd ${pkgname%-lbonn-wayland}-${pkgver}
   meson install -C build --destdir="${pkgdir}"
   install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
   install -Dm755 Examples/*.sh -t "$pkgdir/usr/share/doc/${pkgname%-lbonn-wayland}/examples"
}
