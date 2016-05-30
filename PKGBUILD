# Maintainer: M0Rf30

pkgname=namecoin-core
pkgver=0.12.0
pkgrel=2
pkgdesc="namecoin Core headless P2P node"
arch=('i686' 'x86_64')
url="https://namecoin.org"
depends=('boost'
         'boost-libs'
         'zeromq')
makedepends=('autoconf'
             'automake'
             'binutils'
             'gcc'
             'libtool'
             'm4'
             'make'
             'pkg-config')
optdepends=('miniupnpc: build with support for UPnP')
license=('MIT')
source=(${pkgname%-core}-$pkgver.tar.gz::https://codeload.github.com/namecoin/namecoin-core/tar.gz/v$pkgver
        namecoin.conf
        namecoin.logrotate
        namecoin.service
        namecoin-reindex.service)
backup=('etc/namecoin/namecoin.conf'
        'etc/logrotate.d/namecoin')
provides=('namecoin-cli' 'namecoin-daemon' 'namecoin-tx')
conflicts=('namecoin-cli' 'namecoin-daemon' 'namecoin-qt' 'namecoin-tx')
install=namecoin.install

build() {
  cd "$srcdir/${pkgname}-$pkgver"

  msg2 'Building...'
  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib/namecoin \
    --sysconfdir=/etc \
    --sharedstatedir=/usr/share/namecoin \
    --localstatedir=/var/lib/namecoin \
    --enable-hardening \
    --with-gui=no \
    --disable-wallet \
    --with-gnu-ld
  make
}

package() {
  cd "$srcdir/${pkgname}-$pkgver"

  msg2 'Installing license...'
  install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/${pkgname%-core}"

  msg2 'Installing documentation...'
  install -dm 755 "$pkgdir/usr/share/doc/namecoin"
  for _doc in \
    $(find doc -maxdepth 1 -type f -name "*.md" -printf '%f\n') \
    release-notes; do
      cp -dpr --no-preserve=ownership doc/$_doc \
        "$pkgdir/usr/share/doc/namecoin/$_doc"
  done

  msg2 'Installing namecoin...'
  make DESTDIR="$pkgdir" install

  msg2 'Installing namecoin.conf...'
  install -Dm 600 "$srcdir/namecoin.conf" -t "$pkgdir/etc/namecoin"

  msg2 'Installing namecoin.service...'
  install -Dm 644 "$srcdir/namecoin.service" -t "$pkgdir/usr/lib/systemd/system"
  install -Dm 644 "$srcdir/namecoin-reindex.service" \
    -t "$pkgdir/usr/lib/systemd/system"

  msg2 'Installing namecoin.logrotate...'
  install -Dm 644 "$srcdir/namecoin.logrotate" "$pkgdir/etc/logrotate.d/namecoin"

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}

md5sums=('887e618fa025e98e1c7d6f88facadee2'
         '85dbcf29d1dade4df781a95c6b502220'
         '2ca92d94c329bf54b8df70f22c27ba98'
         'd4694928d3e62f9215ce641663564eee'
         '1f3e4182d57987e4f42962cd2da94661')
