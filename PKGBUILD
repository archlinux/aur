# Maintainer: Allen Wild <allenwild93 at gmail dot com>
# Contributor: mrxx <mrxx at cyberhome dot at>

_name=dislocker
pkgname=${_name}-noruby
pkgver=0.7.3
pkgrel=2
pkgdesc="Read/write BitLocker-encrypted volumes (no ruby bindings/dependency)"
arch=('i686' 'x86_64')
url="https://github.com/Aorimn/dislocker"
license=('GPL2')
depends=('fuse' 'mbedtls2')
makedepends=('make' 'cmake')
provides=('dislocker')
conflicts=('dislocker' 'dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        "no-ruby.patch::${url}/commit/05cd96b1890d3bd4c6ea472edcc2e7b329e4e2e4.patch")
sha256sums=('8d5275577c44f2bd87f6e05dd61971a71c0e56a9cbedf000bd38deadd8b6c1e6'
            '6c911d7ba4c66ec1e97f63caed3e84be75188c7ff5fbcf6b834047068aec8952')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  patch -p1 -i "$srcdir/no-ruby.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"

  cmake -S. -Bbuild \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        -DWITH_RUBY=OFF \
        -DPOLARSSL_INCLUDE_DIRS=/usr/include/mbedtls2 \
        -DPOLARSSL_LIBRARIES=/usr/lib/mbedtls2/libmbedcrypto.so
  cmake --build build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_name}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${_name}/LICENSE
}

# vim: ft=sh et sw=2 sts=2
