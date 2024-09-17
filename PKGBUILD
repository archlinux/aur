# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

pkgname=phoc-git
_pkgname=phoc
pkgver=r2478.16a01a7
pkgrel=2
pkgdesc='Display compositor designed for phones'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/Phosh/phoc'
license=(GPL3)
depends=(gnome-desktop wlroots0.17 gsettings-desktop-schemas pixman libinput libxcb libxkbcommon
	 json-glib glib2 dconf cairo wayland libgmobile)
checkdepends=(xorg-server-xvfb xorg-xauth mutter pixman)
makedepends=(cmake meson git wayland-protocols python-jinja python-pygments python-typogrify libgirepository glib2-devel)
optdepends=('xorg-wayland: run X clients under phoc')
source=("git+$url.git")
sha256sums=('SKIP')
provides=(phoc)
conflicts=(phoc)

pkgver() {
  cd phoc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
}

build() {
  export PKG_CONFIG_PATH='/usr/lib/wlroots0.17/pkgconfig'
  arch-meson "${_pkgname}" build -Dembed-wlroots=disabled
  meson compile -C build
}

check() {
  LC_ALL=C.UTF-8 WLR_RENDERER=pixman xvfb-run meson test -C build --print-errorlogs
}

package() {
  depends+=(libwlroots.so=12)
  DESTDIR="${pkgdir}" meson install -C build
}

