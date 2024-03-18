# Maintainer: fossdd <fossdd@pwned.life>
# Contributor: Sebastian Krzyszkowiak <dos@dosowisko.net>
# Contributor: Jelle van der Waa <jelle@archlinux.org>

libgmobile_commit=a3c67a1184bfa73c593edefabe77cce57a5e38f6

pkgname=phoc-git
_pkgname=phoc
pkgver=r2242.8dc3ed3
pkgrel=1
pkgdesc='Display compositor designed for phones'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/World/Phosh/phoc'
license=(GPL3)
depends=(gnome-desktop wlroots gsettings-desktop-schemas pixman libinput libxcb libxkbcommon
	 json-glib glib2 dconf cairo wayland)
checkdepends=(xorg-server-xvfb xorg-xauth mutter pixman)
makedepends=(cmake meson git wayland-protocols python-jinja python-pygments python-typogrify libgirepository)
optdepends=('xorg-wayland: run X clients under phoc')
source=("git+$url.git"
	https://gitlab.gnome.org/guidog/gmobile/-/archive/${libgmobile_commit}/gmobile-${libgmobile_commit}.tar.gz)
sha256sums=('SKIP'
            '1aeac55a790525c2028a66562de877a8f99ce391636d8e0e3d059b0899c7a7ec')
provides=(phoc)
conflicts=(phoc)

pkgver() {
  cd phoc
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mv "gmobile-${libgmobile_commit}" "${_pkgname}/subprojects/gmobile"
  cd "${_pkgname}"
}

build() {
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

