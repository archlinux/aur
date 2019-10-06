# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=dino
pkgver=0.0+r549+g7adb0e8
_commit=7adb0e82fba1afc62689797be6c9491ad15d03bf
pkgrel=1
pkgdesc='Modern XMPP (Jabber) chat client written in GTK+/Vala'
arch=(i686 x86_64)
url=https://dino.im
license=(GPL3)
depends=(glib2 glib-networking gpgme gtk3 libgcrypt libgee libsoup qrencode sqlite)
makedepends=(git cmake ninja vala)
source=(git+https://github.com/dino/dino#commit=$_commit)
sha512sums=('SKIP')

pkgver() {
  cd dino
  git describe --tags | sed 's#-#+#g;s#+#+r#'
}

build() {
  cd dino

  # Modify either of the following variables as desired
  _enable=--enable-plugin='notification-sound'
  #_disable=--disable-plugin='omemo;openpgp;http-files'

  ./configure --prefix=/usr --with-tests $_enable $_disable
  make
}

check() {
  cd dino/build
  ./xmpp-vala-test
  ./signal-protocol-vala-test
}

package() {
  cd dino
  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/dino
}
