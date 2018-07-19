# Maintainer: hashworks <mail@hashworks.net>

_pkgname=aria2
pkgname=libaria2
pkgver=1.34.0
pkgrel=2
pkgdesc='Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink. Build with --enable-libaria2'
arch=('x86_64')
url='http://aria2.sourceforge.net/'
license=('GPL')
conflicts=('aria2')
provides=('aria2')
depends=('gnutls' 'libxml2' 'sqlite' 'c-ares' 'ca-certificates' 'libssh2')
checkdepends=('cppunit')
source=("https://github.com/tatsuhiro-t/aria2/releases/download/release-$pkgver/aria2-$pkgver.tar.xz")
sha512sums=('80bc43e242c06acc95030021cb347b4ec230729f3d7e512ca1932941b34ef95c312a34007a226869e5d720839a400e66cdb072ccab5d42228d8cf3d828723dcc')

build() {
  cd $_pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
    --enable-libaria2

  make
}

check() {
  cd $_pkgname-$pkgver
  make check
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # add bash completion
  install -d "$pkgdir"/usr/share/bash-completion/completions
  install -m644 "$pkgdir"/usr/share/doc/aria2/bash_completion/aria2c \
    "$pkgdir"/usr/share/bash-completion/completions
  rm -rf "$pkgdir"/usr/share/doc/aria2/bash_completion
}

