# Contributor: Lex Black <autumn-wind at web dot de>
# Contributor: Westminboy <westminboy@gmail.com>

pkgname=sylpheed-lite
_pkgname=sylpheed
pkgver=3.5.0
pkgrel=2
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
sha256sums=('75bcc631eb6a7c8c46fb3f5cd18d509e794a7974302d5e5bd3950599e7686983'
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
