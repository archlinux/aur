# Maintainer: Chris Severance aur.severach AatT spamgourmet.com
# Contributor: Jan de Groot https://www.archlinux.org/packages/extra/x86_64/libgxps/
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

set -u
_pkgname='libgxps'
pkgname='libgxps-git'
pkgver=0.3.0.r0.g762b302
pkgrel=1
pkgdesc='An XPS Documents library'
arch=('i686' 'x86_64')
url="https://git.gnome.org/browse/${_pkgname}/"
license=('GPL')
depends=('gtk3' 'libarchive' 'libjpeg-turbo' 'libtiff' 'lcms2' 'glib2' 'openssl-1.0')
makedepends=('gobject-introspection' 'gtk-doc' 'git' 'meson' 'gnome-common')
provides=("${_pkgname}=${pkgver%.r*}")
conflicts=("${_pkgname}")
_verwatch=("${url}" "/browse/${_pkgname}/snapshot/${_pkgname}-\([0-9\.]\+\)\.tar\.xz" 'l')
source=("git://git.gnome.org/${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  set -u
  cd "${_pkgname}"
  git describe --tags --long | sed -E -e 's/([^-]*-g)/r\1/;s/-/./g;s/v//'
  set +u
}

prepare() {
  set -u
  mkdir 'build'
  cd "${_pkgname}"
  set +u
}

build() {
  set -u
  cd 'build'
  if [ ! -s 'config.h' ]; then
    meson --prefix='/usr' --buildtype='release' "../${_pkgname}" -Denable-gtk-doc='true' -Denable-man='true'
  fi
  ninja
  set +u
}

check() {
  set -u
  cd 'build'
  meson test
  set +u
}

package() {
  set -u
  cd 'build'
  DESTDIR="${pkgdir}" ninja install
  set +u
}
set +u
