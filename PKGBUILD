# Contributor: éclairevoyant
# Contributor: Ben Brown <ben at demerara dot io>
# Contributor: PedroHLC <root@pedrohlc.com>
# Contributor: Moritz Poldrack <moritz at poldrack dot dev>
# Contributor: dnkl

_pkgname=yambar
pkgname="${_pkgname}-git"
pkgver=1.11.0.r15.g739dc30
pkgrel=1
pkgdesc='Modular status panel for X11 and Wayland, inspired by polybar (source from git)'
arch=(x86_64 aarch64)
url="https://codeberg.org/dnkl/yambar"
license=("MIT")
depends=(fcft libpulse libudev.so libxcb libyaml libpipewire-0.3.so pipewire pixman
         wayland xcb-util xcb-util-cursor xcb-util-wm)
makedepends=(git meson scdoc tllist wayland-protocols xorgproto)
optdepends=('alsa-lib: ALSA module'
            'json-c: XKB module'
            'libmpdclient: MPD module'
            'xcb-util-errors: better X error messages')
provides=("${_pkgname}=$pkgver")
conflicts=("${_pkgname}")
source=("git+https://codeberg.org/dnkl/yambar.git")
b2sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/[^-]*-g/r&/;s/-/./g'
}

build() {
  meson setup --buildtype=release --prefix=/usr \
    --wrap-mode=nofallback \
    -Db_lto=true \
    -Dbackend-x11=enabled -Dbackend-wayland=enabled \
    ${_pkgname} build
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -d "$pkgdir/usr/share/licenses/$_pkgname/"
  ln -s '/usr/share/doc/yambar/LICENSE' "$pkgdir/usr/share/licenses/$_pkgname/"
}
