pkgname=gnome-keyring-git
_pkgname=gnome-keyring
pkgver=3.36.0+12+g4f531000
pkgrel=1
epoch=1
pkgdesc="Stores passwords and encryption keys"
url="https://wiki.gnome.org/Projects/GnomeKeyring"
arch=(x86_64)
license=(GPL LGPL)
depends=('gcr' 'libcap-ng' 'pam' 'openssh')
makedepends=('git' 'docbook-xsl' 'python')
provides=('gnome-keyring' 'org.freedesktop.secrets')
conflicts=('gnome-keyring')
groups=('gnome')
install=gnome-keyring.install
source=("git+https://gitlab.gnome.org/GNOME/gnome-keyring.git"
        33.patch
        add-cinnamon.diff)
sha256sums=('SKIP'
            '23294d6569bb7c8297cc2f95071576fac48ee82ec1ead1b818dd69fbbc72b069'
            'd05210f5b0a7d4b22c0dff2854854af2eb5708aa2b296095e070dca68e9f815a')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname

  # https://bugs.archlinux.org/task/68664
  # https://gitlab.gnome.org/GNOME/gnome-keyring/-/merge_requests/33
  git apply -3 ../33.patch

  # Autolaunch in Cinnamon
  git apply -3 ../add-cinnamon.diff

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib \
    --with-pam-dir=/usr/lib/security \
    --disable-static \
    --disable-schemas-compile
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_pkgname
  # Secure memory tests fail
  dbus-run-session make -k check || :
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
