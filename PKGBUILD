# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=(mmixware{,-docs,-src})
pkgver=20160804
pkgrel=3
pkgdesc="MMIX assembler and simulator"
arch=('i686' 'x86_64')
url="http://mmix.cs.hm.edu/"
license=('custom')
makedepends=('texlive-core')
source=("http://mmix.cs.hm.edu/src/mmix-$pkgver.tgz"
        LICENSE)
b2sums=('8bbde51921fe23f016e35bd51346e6445d530815e5e87bff44cf17e081c6b8e55dd6bd24f1ce1621851d2eac309fa44d71aa33d93d3ddfce5213c6643181d38c'
        'bb974d6a345c83dab1f874a0288f4bde646d2f4db1aee7761c0c6a515012ceaf52b7be41037086a239176a16921c136626a5c36baa3d67e8c5d7c7efca562cfb')
options=('!buildflags')
noextract=("mmix-${pkgver}.tgz")

prepare() {
  mkdir "$pkgname-$pkgver"
  bsdtar -C "$pkgname-$pkgver" -xf "../mmix-$pkgver.tgz"
  cd "$pkgname-$pkgver"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done
}

build() {
  cd "$pkgname-$pkgver"

  unset MAKEFLAGS
  make {mmixal,mmix-{arith,config,doc,io,mem,pipe,sim},mmmix,mmotype}.pdf
  make CFLAGS="-Wl,-allow-multiple-definition" all
}

package_mmixware() {
  cd "$pkgname-$pkgver"

  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install abstime mmix mmixal mmmix mmotype "$pkgdir/usr/bin"
  install -m644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname"
}

package_mmixware-docs() {
  pkgdesc="MMIX documentation"
  arch=('any')

  cd "$pkgbase-$pkgver"

  install -d "$pkgdir/usr/share/doc/$pkgbase"
  install -m644 *.pdf "$pkgdir/usr/share/doc/$pkgbase"
}

package_mmixware-src() {
  pkgdesc="MMIX sources"
  arch=('any')

  cd "$pkgbase-$pkgver"

  install -d "$pkgdir/usr/src/$pkgbase"
  bsdtar --no-same-owner -C "$pkgdir/usr/src/$pkgbase" -xf "../mmix-$pkgver.tgz"
}
