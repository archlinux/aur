# Maintainer: jtts
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Franco Tortoriello <franco.tortoriello@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

_pkgbasename=libtirpc
pkgname=lib32-$_pkgbasename
pkgver=0.3.2
pkgrel=2
pkgdesc="Transport Independent RPC library (SunRPC replacement) (32-bit)"
arch=(x86_64)
url="http://libtirpc.sourceforge.net/"
license=(BSD)
depends=(lib32-krb5 $_pkgbasename)
makedepends=(gcc-multilib)
#backup=('etc/netconfig')
source=(http://downloads.sourceforge.net/sourceforge/libtirpc/$_pkgbasename-$pkgver.tar.bz2
        fix_missing_rpc_get_default_domain.patch)
sha1sums=('af9b74d0c4d1499a7b1a43e396e5b7d62180ea65'
          'ab3b6a2e0beb255a82dcbf02c915076b8fe43e5a')

prepare() {
  cd $_pkgbasename-$pkgver
  patch -Np1 -i $srcdir/fix_missing_rpc_get_default_domain.patch
}

build() {
  cd $_pkgbasename-$pkgver
  ./configure --prefix=/usr --sysconf=/etc \
      --libdir=/usr/lib32 CC="gcc -m32"
  make
}

package() {
  cd $_pkgbasename-$pkgver
  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir"/{etc,usr/{include,share}}
  install -dm755 "$pkgdir"/usr/share/licenses/
  ln -s $_pkgbasename "$pkgdir"/usr/share/licenses/$pkgname
}
