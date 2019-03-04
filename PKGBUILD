# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libsecret
pkgname=lib32-$_pkgbasename
pkgver=0.18.8
pkgrel=2
pkgdesc="Library for storing and retrieving passwords and other secrets (32-bit)"
url="https://wiki.gnome.org/Projects/Libsecret"
arch=('x86_64')
license=('LGPL')
depends=('lib32-glib2' 'lib32-libgcrypt' "${_pkgbasename}")
makedepends=('gcc-multilib' 'intltool' 'gobject-introspection' 'vala' 'git' 'gtk-doc' 'meson' 'valgrind')
optdepends=('gnome-keyring: key storage service, or use any other service implementing org.freedesktop.secrets')
_commit=b5442654d483e959ac9ecd3a3fb9eebc8d9d8399  # tags/0.18.8^0
source=("git+https://git.gnome.org/browse/libsecret#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/${_pkgbasename}"
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"
  export LDFLAGS+=" -m32"

  CFLAGS+=" -DHAVE_MLOCK" # https://gitlab.gnome.org/GNOME/libsecret/issues/23
  arch-meson "${srcdir}/${_pkgbasename}" build -Ddocs=false --libdir=/usr/lib32
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
