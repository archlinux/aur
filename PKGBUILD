# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=dislocker
pkgver=0.7.4
pkgrel=1
pkgdesc="Read/write BitLocker-encrypted volumes"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Aorimn/dislocker"
license=('GPL2')
depends=('fuse3' 'mbedtls3' 'ruby')
makedepends=('make' 'cmake')
conflicts=('dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=($url/archive/v$pkgver.tar.gz)
sha256sums=('c39261727a4993af13f90beec5ce1b56932f8a6d813df26e437ed0a668cf4141')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DMbedTLS_DIR=/usr/lib/mbedtls3/cmake/MbedTLS \
        -Dlibdir=/usr/lib \
        -DCRYPTO_BACKEND=mbedtls \
        -DWITH_RUBY=ON \
        -DBUILD_TESTING=ON \
        -DWARN_FLAGS:STRING="-Wall -Wextra" \

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
