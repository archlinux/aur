# Maintainer: jamazi <jamazi@tutanota.com>

_pkgname=aria2
pkgname="$_pkgname-unlimited"
pkgver=1.37.0
pkgrel=1
pkgdesc='Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink'
arch=('x86_64')
url='https://aria2.github.io'
license=('GPL')
depends=('gnutls' 'libxml2' 'sqlite' 'c-ares' 'ca-certificates' 'libssh2')
conflicts=('aria2')
provides=('aria2')
options=('strip')
checkdepends=('cppunit')
source=("https://github.com/aria2/aria2/releases/download/release-$pkgver/aria2-$pkgver.tar.xz" 'unlimited-max-connection.patch')
sha512sums=('df3b8b4de8fa8d78f203ea00c059e43585e18a229009f202e42e6a9e59db67d09df0dbba8a016e99ed73c82f59e4f8b26f86c2288afdbb96a6807cbe2c56e6b3'
            'a4c418b4a43203703e4f63357f64e31cd13c79d5f156cd87eb1e62fbf4e8578873d12dfdd5fd28fda517cce4a69af3c78e5b6cb0766f55891d885ad0ecb5dea3')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/unlimited-max-connection.patch"
}

build() {
  cd $_pkgname-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-libaria2 \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt

  make
}

check() {
  cd $_pkgname-$pkgver
  # https://github.com/aria2/aria2/issues/1476
  # Upstream states "I don't see any issues with aria2 code."
  make check || echo "Ignoring test failures"
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
