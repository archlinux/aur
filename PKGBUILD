# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Roman Kyrylych <roman@archlinux.org>

_pkgname=gnome-user-share
pkgname="${_pkgname}-git"
pkgver=43.0+9+gab7aacf
pkgrel=1
pkgdesc="Easy to use user-level file sharing for GNOME"
arch=(
  x86_64
  i686
  pentium4
  aarch64
  armv7h
)
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
license=(GPL)
depends=(
  glib2
  dconf
  mod_dnssd
  systemd
)
makedepends=(
  git
  meson
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
groups=(gnome gnome-git)
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/^GNOME_USER_SHARE_//;s/_/./g;s/-/+/g'
}

build() {
  local meson_opts=(
    -D httpd=/usr/bin/httpd
    -D modules_path=/usr/lib/httpd/modules
  )
  arch-meson "${_pkgname}" build "${meson_opts[@]}"
  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
