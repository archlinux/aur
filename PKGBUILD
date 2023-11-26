# Maintainer: Aviana Cruz <gwencroft <at> proton <dot> me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=aria2-pro
pkgver=1.37.0
pkgrel=2
pkgdesc='Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink (with Aria2 Pro patches)'
arch=('x86_64')
url='https://github.com/P3TERX/Aria2-Pro-Core'
license=('GPL')
depends=('openssl' 'libxml2' 'sqlite' 'c-ares' 'ca-certificates' 'libssh2')
makedepends=('patch')
checkdepends=('cppunit')
provides=('aria2')
conflicts=('aria2')
source=("https://github.com/tatsuhiro-t/aria2/releases/download/release-$pkgver/aria2-$pkgver.tar.xz"
  '0001-options-unlock-connection-per-server-limit.patch'
  '0002-download-retry-on-slow-speed-and-conection-close.patch'
  '0003-option-add-option-to-retry-on-http-400-403-406-or-un.patch')
sha512sums=('df3b8b4de8fa8d78f203ea00c059e43585e18a229009f202e42e6a9e59db67d09df0dbba8a016e99ed73c82f59e4f8b26f86c2288afdbb96a6807cbe2c56e6b3'
  '8e6e9d6827f12012733e1368872b72bc69965cc880fea35167d1edb1b1de92085dc683f2e56847159372f12dc8f979912efbfebe3915ffd08a09054632c784b2'
  'f146dad5d4ee39ca6350ca4a911615eaf295fc3b512ad6ae463a0d16d16a805e1d820ae38516e1a4822e6d2292a69a6df56713a4013da52e3b8e282ff6b9802f'
  'c5810f6bcc3e280471b894129fd641bcab75a3d0e933ba1ee884078828c2a2c5c70453f386b1d2f322ca8e66d7499c6fb23a867c2c1078de320c0c8b8e867185')

prepare() {
  cd aria2-$pkgver

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src == *.patch ]] || continue
    patch -Np1 <"../$src"
  done
}

build() {
  cd aria2-$pkgver

  ./configure \
    --prefix=/usr \
    --enable-libaria2 \
    --with-ca-bundle=/etc/ssl/certs/ca-certificates.crt \
    --without-gnutls \
    --with-openssl

  make
}

check() {
  cd aria2-$pkgver
  make check
}

package() {
  cd aria2-$pkgver
  make DESTDIR="$pkgdir" install

  # add bash completion
  install -d "$pkgdir"/usr/share/bash-completion/completions
  install -m644 "$pkgdir"/usr/share/doc/aria2/bash_completion/aria2c \
    "$pkgdir"/usr/share/bash-completion/completions
  rm -rf "$pkgdir"/usr/share/doc/aria2/bash_completion
}
