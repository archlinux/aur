# Maintainer: LSUtigers3131 
# Maintainer: Luke Short <ekultails at gmail dot com>

pkgname=libpamac-full-git
_pkgname=libpamac
pkgver=11.4.1.r1.ge2385b6
_pkgver=11.4.1
pkgrel=1
epoch=1
pkgdesc="Library for Pamac package manager based on libalpm - flatpak and snap support enabled"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://gitlab.manjaro.org/applications/libpamac"
license=('GPL3')
depends=('pacman>=6.0' 'pacman<6.1' 'flatpak' 'snapd' 'snapd-glib' 'archlinux-appstream-data-pamac')
makedepends=('gettext' 'itstool' 'vala' 'meson' 'ninja' 'gobject-introspection' 'xorgproto' 'asciidoc')
options=(!emptydirs)
conflicts=('libpamac-aur' 'libpamac-flatpak' 'libpamac' 'libpamac-full')
source=(git+https://gitlab.manjaro.org/applications/$_pkgname.git '0001-update-meson.build.patch')
sha256sums=('SKIP' '54ddfbdc4e2fd64f5343d34e7fee6c068efde9db3c4a74dda10cb0f8b0c38b24')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c1-48
}

prepare() {
  cd $_pkgname
  git am < "$srcdir"/0001-update-meson.build.patch
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
