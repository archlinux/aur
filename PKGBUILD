# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=dino
pkgver=0.0+r497+g3ad2891
_commit=3ad2891eb80d9381fed8547d6429904120af1f3e
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

  # Uncomment/modify either of the following variables as desired
  _enable="--enable-plugin='notification-sound'"
  #_disable="--disable-plugin='omemo;openpgp;http-files'"

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
