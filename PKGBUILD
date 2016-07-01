# Maintainer: M0Rf30

pkgname=namecoin-core-git
pkgver=r11557.38d71f5
pkgrel=1
pkgdesc="namecoin Core headless P2P node"
arch=('i686' 'x86_64')
url="https://namecoin.org"
depends=('boost'
         'libevent'
         'zeromq'
         'miniupnpc')
makedepends=('autoconf'
             'automake'
             'binutils'
             'gcc'
             'libtool'
             'm4'
             'make'
             'pkg-config')
license=('MIT')
source=("${pkgname%-core}::git+https://github.com/namecoin/namecoin-core.git"
        namecoin.conf
        namecoin.logrotate
        namecoin.service
        namecoin-reindex.service)
backup=('etc/namecoin/namecoin.conf'
        'etc/logrotate.d/namecoin')
provides=('namecoin-cli' 'namecoin-daemon' 'namecoin-tx')
conflicts=('namecoin-cli' 'namecoin-daemon' 'namecoin-qt' 'namecoin-tx')
install=namecoin.install

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname}"

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
  cd "$srcdir/${pkgname}"

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

sha256sums=('SKIP'
            '97e7b8e5d402eef231e20b62436d830a955c87f389b20ea663bf5a6b8f7b0ff7'
            '45f70de4b665fc598420494b5af4982e737f3353b20b0a7c0829e35610aadfc9'
            '88bec6b0289babad8bf53669a9c9caea1f6890e824fa0482da7a9506cd0ffd8e'
            '2ba4020a9d696c485d69446ceb72a9dd41a0af6dda8d07b9d521426913b41478')
