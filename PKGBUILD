# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=dislocker
pkgver=0.7.3
pkgrel=2
pkgdesc="Read/write BitLocker-encrypted volumes"
arch=('i686' 'x86_64')
url="https://github.com/Aorimn/dislocker"
license=('GPL2')
depends=('fuse' 'mbedtls' 'ruby')
makedepends=('make' 'cmake')
conflicts=('dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=($url/archive/v$pkgver.tar.gz)
sha1sums=('1b40d70030cf914e86da8960fac83e9922ede04a')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix inapt variable naming
  sed -i 's/true/trueval/g' src/config.c

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        -DC_INCLUDE_PATH="$C_INCLUDE_PATH:/usr/include/ruby-3.0.0/" \
        -D WARN_FLAGS:STRING="-Wall -Wextra" \
        .
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${pkgname}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${pkgname}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
