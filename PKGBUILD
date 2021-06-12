# Contributor : Ionut Biru <ibiru@archlinux.org>
# Contributor: Daniel Balieiro <daniel@balieiro.com>
# Contributor: Rodrigo L. M. Flores <mail@rodrigoflores.org>
# Contributor: K900 <me@0upti.me>
# Original patch by Leonid Evdokimov
# https://launchpad.net/~darkk/+archive/ubuntu/cisco-gabble
_pkgname=telepathy-gabble
pkgname=$_pkgname-cisco
pkgver=0.18.4
pkgrel=1
pkgdesc="A Jabber/XMPP connection manager for Telepathy, patched to connect to Cisco Jabber servers"
arch=(x86_64)
url="https://telepathy.freedesktop.org"
groups=(telepathy)
license=(LGPL2.1)
depends=(telepathy-glib libsoup libnice)
makedepends=(libxslt python gnome-common)
source=(https://telepathy.freedesktop.org/releases/telepathy-gabble/telepathy-gabble-$pkgver.tar.gz
	cisco-jabber-workaround.patch
        telepathy-gabble-0.18.4-python3.patch)
install=telepathy-gabble.install
sha256sums=('115c91572c72d4a40f0b25b606167b4f2f09441dc7bf1036ccbb1450f1a4969c'
            '1396e516e30394b0cbcc6fcd80e64fbfe8fa0929ce78130e85f66409785b1a45'
            '2873cdb3b65deab1418acd25fc5ec4bf120f52dcceda129ae7ac315026ea2749')
provides=('telepathy-gabble')
conflicts=('telepathy-gabble')

prepare() {
  cd $_pkgname-$pkgver
  patch -p1 -i ../cisco-jabber-workaround.patch
  # port to python3, patch taken from Fedora
  patch -Np1 -i ../telepathy-gabble-0.18.4-python3.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr \
    --libexecdir=/usr/lib/telepathy \
    --disable-Werror --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
