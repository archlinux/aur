# Maintainer: Allen Wild <allenwild93 at gmail dot com>
# Contributor: mrxx <mrxx at cyberhome dot at>

_name=dislocker
pkgname=${_name}-noruby
pkgver=0.7.1
pkgrel=1
pkgdesc="Read BitLocker encrypted volumes under Linux (no ruby bindings/dependency)"
arch=('i686' 'x86_64')
url="http://www.hsc.fr/ressources/outils/dislocker"
license=('GPL2')
depends=('fuse' 'mbedtls')
makedepends=('cmake')
provides=('dislocker')
conflicts=('dislocker' 'dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=(https://github.com/Aorimn/dislocker/archive/v$pkgver.tar.gz
        no-ruby.patch)
sha1sums=('0c5c62f63ba587663eb0474f1bd6ca7e345fe977'
          '0c47520eae3f9536cf7a54abc6bb244290e413d6')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  patch -p1 -i "$srcdir/no-ruby.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        -D WARN_FLAGS:STRING="-Wall -Wextra" \
        -DWITH_RUBY=OFF \
        .
  make
}

package() {
  cd "$srcdir/$_name-$pkgver"
  make DESTDIR="$pkgdir/" install

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_name}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${_name}/LICENSE
}

# vim: ft=sh et sw=2 sts=2
