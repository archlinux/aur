# Maintainer:  Raansu <Gero3977@gmail.com>
# Contributor: David Strobach <lalochcz@gmail.com>
# Contributor: Leslie P. Polzer <polzer@gnu.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Allan McRae <allan@archlinux.org>
# Contributor: Andreas Radke <andyrtr@archlinux.org>

pkgname=db5.1
pkgver=5.1.29
pkgrel=2
pkgdesc="The Berkeley DB embedded database system 5.1"
arch=('any')
license=('custom')
url="http://www.oracle.com/technology/software/products/berkeley-db/index.html"
depends=('gcc-libs')
options=('!libtool' '!makeflags')
source=(http://download.oracle.com/berkeley-db/db-${pkgver}.tar.gz
        'db-atomic.patch'
        'CVE-2017-10140-cwd-db_config.patch')
md5sums=('a94ea755ab695bc04f82b94d2e24a1ef'
         'd56cef85d0fc9432b54a32993d4c9f06'
         'f961c86ffd1d92da87be2eb9742d1d72')
sha256sums=('a943cb4920e62df71de1069ddca486d408f6d7a09ddbbb5637afe7a229389182'
            '7ab718c5624b4724a585c91f4cfdcd3830cfaf0ce1e865a4a79b316ba35990c0'
            'b315706d1cfc5b20f291a2994f6e3c8fe7b10e2f3d6ef92a07d890381e296e40')

prepare() {
  cd "$srcdir/db-$pkgver/"

  cd "src/"
  patch -p1 < "$srcdir"/db-atomic.patch

  patch -u -p2 < "$srcdir"/CVE-2017-10140-cwd-db_config.patch
}

build() {
  cd "$srcdir/db-$pkgver/"

  cd "build_unix"
  ../dist/configure --prefix=/usr --enable-compat185 --enable-shared --enable-static --enable-cxx
  make LIBSO_LIBS=-lpthread || return 1
}

package() {  
  cd "$srcdir/db-$pkgver/"
  
  cd "build_unix"
  make prefix="$pkgdir/usr" includedir="$pkgdir/usr/include/db5.1" install

# Remove documents to save space, these can be found online if needed.
  rm -rf "$pkgdir/usr/docs"

# Remove conflicting symlinks created by make, should never overwrite 
# main libdb symlinks to current version. Programs that need or use 
# db5.1 should be able to find it.
  rm -f ${pkgdir}/usr/lib/libdb{,_cxx}.{a,so}
  rm -f ${pkgdir}/usr/lib/libdb{,_cxx}-5.{a,so}

# Rename db5.1 bin files to not conflict with current db version 
# installed. Programs that need or use db5.1 should be aware of this 
# name change. 
  cd "${pkgdir}/usr/bin"
  for i in *; do
    mv $i db5.1_${i/db_/}
  done

# Install license.
  install -Dm644 "$srcdir/db-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
