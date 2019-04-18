# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=dino
pkgver=0.0+435+gb0dde02
_commit=b0dde02bc9e5ff29025ff5fc70fd46d56df5d2ec
pkgrel=1
pkgdesc='Modern XMPP (Jabber) chat client written in GTK+/Vala'
arch=(i686 x86_64)
url=https://dino.im
license=(GPL3)
depends=(glib2 glib-networking gtk3 gpgme libgee libgcrypt qrencode libsoup sqlite)
makedepends=(git cmake gettext ninja vala)
conflicts=(dino-git)
source=(git+https://github.com/dino/dino#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd dino
  git describe --tags | sed 's#-#+#g'
}

build() {
  cd dino

  # Uncomment/modify either of the following variables as desired
  _enable="--enable-plugin='notification-sound'"
  #_disable="--disable-plugin='omemo;openpgp;http-files'"

  ./configure --prefix=/usr --with-tests $_enable $_disable
  make
}

check() {
  cd dino/build
  msg2 'Running xmpp-vala-test...'
  ./xmpp-vala-test
  msg2 'Running signal-protocol-vala-test...'
  ./signal-protocol-vala-test
}

package() {
  cd dino
  make DESTDIR="$pkgdir" install
}
