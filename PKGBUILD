# Maintainer: Allen Wild <allenwild93 at gmail dot com>
# Contributor: mrxx <mrxx at cyberhome dot at>

_name=dislocker
pkgname=${_name}-noruby
pkgver=0.7.3
pkgrel=1
pkgdesc="Read/write BitLocker-encrypted volumes (no ruby bindings/dependency)"
arch=('i686' 'x86_64')
url="https://github.com/Aorimn/dislocker"
license=('GPL2')
depends=('fuse' 'mbedtls')
makedepends=('make' 'cmake')
provides=('dislocker')
conflicts=('dislocker' 'dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=($url/archive/v$pkgver.tar.gz
        no-ruby.patch)
sha256sums=('8d5275577c44f2bd87f6e05dd61971a71c0e56a9cbedf000bd38deadd8b6c1e6'
            '0b8d211cab004d17ec7a3841ca4597a909a5b61fe6197125d26a09f4ef669a85')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  patch -p1 -i "$srcdir/no-ruby.patch"
}

build() {
  cd "$srcdir/$_name-$pkgver"

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        -DC_INCLUDE_PATH="$C_INCLUDE_PATH:/usr/include/ruby-2.6.0/" \
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
