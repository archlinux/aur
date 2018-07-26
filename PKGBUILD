# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=dino-im
pkgver=0.0+270+g063d014
pkgrel=1
pkgdesc='Modern Jabber/XMPP client written in GTK+/Vala'
arch=(i686 x86_64)
url=https://github.com/dino/dino
license=(GPL3)
depends=(glib2 glib-networking gtk3 gpgme libgee libgcrypt libsoup sqlite)
makedepends=(git cmake vala ninja)
optdepends=('libcanberra: audio notification support')
conflicts=(dino-git)
source=(git+$url#commit=063d0146f922b1ed6388f40e05ae8eb0c547083d)
sha512sums=(SKIP)

pkgver() {
  cd dino
  git describe --tags | sed 's/v//;s/-/+/g'
}

build() {
  cd dino
  #_enable="--enable-plugin='notification-sound'"
  #_disable="--disable-plugin='omemo;openpgp;http-files'"
  ./configure $_enable $_disable --prefix=/usr --with-tests
  make
}

package() {
  cd dino
  make DESTDIR="$pkgdir" install
}

check() {
  cd dino/build
  msg2 'Running xmpp-vala-test...'
  ./xmpp-vala-test
  msg2 'Running signal-protocol-vala-test...'
  ./signal-protocol-vala-test
}
