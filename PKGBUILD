# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=dino-im
pkgver=0.0+274+gee5c838
pkgrel=1
pkgdesc='Modern Jabber/XMPP client written in GTK+/Vala'
arch=(i686 x86_64)
url=https://github.com/dino/dino
license=(GPL3)
depends=(glib2 glib-networking gtk3 gpgme libgee libgcrypt libsoup sqlite)
makedepends=(git cmake vala ninja)
optdepends=('libcanberra: audio notification support')
conflicts=(dino-git)
source=(git+$url#commit=ee5c838a6ba85c9d6e72ac2941a7994505aaa4fc)
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
