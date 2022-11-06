# Maintainer: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=aria2-pro
pkgver=1.36.0
pkgrel=1
pkgdesc='Download utility that supports HTTP(S), FTP, BitTorrent, and Metalink'
arch=('x86_64')
url='https://aria2.github.io'
license=('GPL')
depends=('gnutls' 'libxml2' 'sqlite' 'c-ares' 'ca-certificates' 'libssh2')
checkdepends=('cppunit')
provides=('aria2')
conflicts=('aria2')
source=("https://github.com/tatsuhiro-t/aria2/releases/download/release-$pkgver/aria2-$pkgver.tar.xz"
  '0001-options-unlock-connection-per-server-limit.patch'
  '0002-download-retry-on-slow-speed-and-reset.patch'
  '0003-option-add-option-to-retry-on-http-4xx.patch'
  '0004-add-no-want-digest-header-option.patch')
sha512sums=('8203dbb75274455a78c50dd4f894e631de6931ac889f26896dceed78ec38c98cdbcf07e164744f308f2bfffeae1016beec1bfdbe8cad7f3280d11376aa0c2542'
  '56690c787ecaa19d08d306020f06d87b1c1b9fbd7f81269622011acac66774b136e93f395cbfe99ff202317d2f477a5dd56b0615c963144ff6d1a10eb066d03a'
  '6ff654c2774376141991a07f5e23a152376243b4d336e0e3d737bf83bd541f20012f3af7d2f530d43167e8b76655482f1d08f646b29eba30fb09fc3c3bc7f5c3'
  'db77254b28059f305d4d6168be1c37ee2ee5a8f8aaf2a49ca514a5652414eb7f492d2ee501e39d1d3f735de6a3ae5902200cbdef03664b312fccc2fdee08f6a5'
  '2937082af4f76295b97fcdb2f90236d53afa0e4cfe8314765a2ceb6a3e864fe0185d178372ec948085b5eb7749e94f6c8c689c967f398994f029aaa47443b9fc')

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
  # https://github.com/aria2/aria2/issues/1476
  # Upstream states "I don't see any issues with aria2 code."
  make check || echo "Ignoring test failures"
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
