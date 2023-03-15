# Maintainer: Jonathan Hudson <jh+github@daria.co.uk>

_pkgname=wayfarer
pkgname=wayfarer-git
pkgver=1.1.0.r72.20230304.b77ac60
pkgrel=1
pkgdesc='Screen recorder for GNOME / Wayland or X11 / Pipewire / XDG Portal'
arch=('i686' 'x86_64' 'arm' 'aarch64' 'armv7h' 'pentium4')
url='https://github.com/stronnag/wayfarer.git'
license=('GPL3')
makedepends=('git' 'vala' 'meson' 'gobject-introspection')
depends=('gtk4' 'libpulse')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe --tags | sed -E -e 's|^[vV]||' -e 's|\-g[0-9a-f]*$||' | tr '-' '+')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Could not determine version."
    return 1
  else
    printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd $_pkgname
  meson setup build --prefix=/usr --buildtype=release --strip
  meson compile -C build
}

package() {
  # executable
  cd $_pkgname
  DESTDIR="$pkgdir" meson install -C build
}
