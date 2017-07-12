# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Westminboy <westminboy@gmail.com>

pkgname=sylpheed-lite
_pkgname=sylpheed
pkgver=3.6.0
pkgrel=1
pkgdesc="Lightweight in lightweight and user-friendly e-mail client"
arch=('i686' 'x86_64')
url="http://sylpheed.sraoss.jp/en/"
license=('GPL')
depends=('gpgme' 'desktop-file-utils')
makedepends=('openssl')
options=('!libtool')
conflicts=('sylpheed')
source=("http://sylpheed.sraoss.jp/$_pkgname/v${pkgver%.*}/$_pkgname-$pkgver.tar.gz"
    "http://sylpheed.sraoss.jp/$_pkgname/v${pkgver%.*}/$_pkgname-$pkgver.tar.gz.asc")
validpgpkeys=('8CF3A5AC417ADE72B0AA4A835024337CC00C2E26') # Hiroyuki Yamamoto
sha256sums=('126caae4188e41869966e43df8b948955d9555f58752c5576134ff2831b7fbaf'
            'SKIP')


build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr \
    --disable-compface \
    --disable-gtkspell \
    --disable-ipv6 \
    --disable-updatecheck
  make

  # Build Attachment-Tool Plug-in
  cd plugin/attachment_tool && make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  # Install Attachment-Tool Plug-in
  cd plugin/attachment_tool
  make DESTDIR="$pkgdir/" install-plugin
}
