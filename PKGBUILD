pkgname=postsrsd
pkgver=2.1.0
pkgrel=1
pkgdesc="Provides the Sender Rewriting Scheme (SRS) via TCP-based lookup tables for Postfix"
arch=('i686' 'x86_64' 'armv7h')
depends=('glibc' 'systemd')
makedepends=('cmake' 'git' 'help2man')
optdepends=('redis: Store envelope senders in Redis')
backup=("etc/$pkgname/$pkgname.conf" "etc/$pkgname/$pkgname.secret" "etc/$pkgname/$pkgname")    #last entry is legacy from version 1
url="https://github.com/roehling/$pkgname"
install=$pkgname.install
license=(GPL-3.0-only)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/roehling/$pkgname/archive/refs/tags/${pkgver}.tar.gz"
        "${pkgname}.install" "sysusers.d-$pkgname.conf" "tmpfiles.d-$pkgname.conf") # "FC_version_fixes.patch")
sha256sums=('58f6d193ba5390298bba6513428e5963e328cd5769a9bc90d93ec74fe83ad284'
            'f0e50360ee5761ab4ccd550e32a386d33fd07b30228b8450d199594e67bdf767'
            'f3d61362ed64e9ad33427b23b471c028b613b7eedd51dc01a203c8ba1c0e3427'
            '8613b3c1a6eec65d0137d97781c8919a84879c49be137b48f8bd29ee3b96cd08')
#            'cb5bd6ef34ffb959a2bf545a6b7936d43a5140ca1c023462957a9f061da533bc')

#prepare() {
#  cd "$srcdir/$pkgname-$pkgver"
#  patch -Np0 -i "$srcdir/FC_version_fixes.patch"
#}

check() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make test
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  [[ -d build ]] && rm -rf build
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
            -DCMAKE_BUILD_TYPE=Release \
            -DGENERATE_SRS_SECRET=OFF \
            -DCONFIG_DIR=/etc/$pkgname \
            -DINIT_FLAVOR=systemd \
            -DTESTS_WITH_ASAN=OFF \
            -DWITH_MILTER=ON \
            -DWITH_SQLITE=ON \
            -DWITH_REDIS=ON
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"
  make DESTDIR="$pkgdir/" install

  # dont use sbin anymore
  mv "$pkgdir/usr/sbin" "$pkgdir/usr/bin"

  # install configs
  install -Dm644 "$srcdir/sysusers.d-$pkgname.conf" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$srcdir/tmpfiles.d-$pkgname.conf" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
  install -Dm644 "$srcdir/$pkgname-$pkgver/build/$pkgname.conf" "$pkgdir/etc/$pkgname/$pkgname.conf"

  # patch config
  sed -i "s#/etc/$pkgname.conf#/etc/$pkgname/$pkgname.conf#g" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  sed -i "s#sbin#bin#g" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  sed -i "s#/etc/$pkgname.secret#/etc/$pkgname/$pkgname.secret#g" "$pkgdir/etc/$pkgname/$pkgname.conf"
}
