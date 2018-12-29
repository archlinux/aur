# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgbasename=libsecret
pkgname=lib32-$_pkgbasename
pkgver=0.18.7
pkgrel=1
pkgdesc="Library for storing and retrieving passwords and other secrets (32-bit)"
arch=('x86_64')
license=('LGPL')
url="https://wiki.gnome.org/Projects/Libsecret"
depends=('lib32-glib2' 'lib32-libgcrypt' "${_pkgbasename}")
makedepends=('gcc-multilib' 'intltool' 'gobject-introspection' 'vala' 'git' 'gtk-doc')
optdepends=('gnome-keyring: key storage service (or use any other service implementing org.freedesktop.secrets)')
_commit=c5b734f4e86a8c25d5afa6525ca0513768fc2832  # tags/0.18.7^0
source=("git+https://git.gnome.org/browse/libsecret#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgbasename}"
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd "${srcdir}/${_pkgbasename}"
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd "${srcdir}/${_pkgbasename}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH=/usr/lib32/pkgconfig
  export LDFLAGS+=' -m32'
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --disable-static --enable-gtk-doc --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}"
  make DESTDIR="$pkgdir" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
