# Maintainer: LSUtigers3131 
# Maintainer: Luke Short <ekultails at gmail dot com>

pkgname=libpamac-full-git
_pkgname=libpamac
pkgver=11.4.1.r0.g29d7180
_pkgver=11.4.1
pkgrel=1
epoch=1
pkgdesc="Library for Pamac package manager based on libalpm - flatpak and snap support enabled"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman>=6.0' 'pacman<6.1' 'flatpak' 'snapd' 'snapd-glib' 'archlinux-appstream-data-pamac')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc' 'git')
options=(!emptydirs)
conflicts=('libpamac-aur' 'libpamac-flatpak' 'libpamac' 'libpamac-full')
source=(git+https://gitlab.manjaro.org/applications/$_pkgname.git)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c1-48
}

build() {
  cd $_pkgname
  mkdir -p builddir
  cd builddir
  meson setup --prefix=/usr --sysconfdir=/etc -Denable-snap=true -Denable-flatpak=true --buildtype=release
  # build
  ninja
}

package() {
  backup=('etc/pamac.conf')
  cd $_pkgname
  cd builddir
  DESTDIR="$pkgdir" ninja install
}

#vim:set ts=2 sw=2 et:
