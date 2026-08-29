# Maintainer: Allen Wild <allenwild93 at gmail dot com>
# Contributor: mrxx <mrxx at cyberhome dot at>

_name=dislocker
pkgname=${_name}-noruby
pkgver=0.7.3
pkgrel=4
pkgdesc="Read/write BitLocker-encrypted volumes (no ruby bindings/dependency)"
arch=('i686' 'x86_64')
url="https://github.com/Aorimn/dislocker"
license=('GPL-2.0-or-later')
depends=('fuse' 'mbedtls3')
makedepends=('cmake' 'git' 'ninja')
provides=('dislocker')
conflicts=('dislocker' 'dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=("git+${url}.git#tag=v${pkgver}"
        "cmake-4.patch")
b2sums=('41b5ce92607cd4d087fc26ffdbeb05e258f2a0633d779d25caed1b6c439b90969a5dd7cf3c0d424f80f53e957bc8f4a49c0580be7d6cdb9fa1768acbd478b317'
        'b694ae1e368ebe81a81ae376d84e4f293571d357f489bf06c4509718cce04e590668a7dbe16c5ef5080afe264ec4cb9ff5b7dc926aa1f8938bb814ef789f4873')

prepare() {
  cd "$srcdir/$_name"

  # cmake: allow explicitly disabling Ruby bindings
  git cherry-pick -n 05cd96b1890d3bd4c6ea472edcc2e7b329e4e2e4
  # Support mbedtls 3
  git cherry-pick -n 2cfbba2c8cc07e529622ba134d0a6982815d2b30
  git rm cmake/FindPolarSSL.cmake
  git cherry-pick -n e749eade55f242d03fb9d10c05ff4b11c66dcbbe

  patch -Np1 -i "$srcdir/cmake-4.patch"
}

build() {
  cd "$srcdir/$_name"

  export CFLAGS="$CFLAGS -std=gnu17"
  cmake -S. -Bbuild -GNinja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Dlibdir=/usr/lib \
        -DMbedTLS_ROOT=/usr/lib/mbedtls3/cmake \
        -DWITH_RUBY=OFF
  cmake --build build
}

package() {
  cd "$srcdir/$_name"
  DESTDIR="$pkgdir" cmake --install build

  install -Dm644 README.md ${pkgdir}/usr/share/doc/${_name}/README
  install -Dm644 CHANGELOG.md ${pkgdir}/usr/share/doc/${_name}/CHANGELOG
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${_name}/LICENSE
}

# vim: ft=sh et sw=2 sts=2
