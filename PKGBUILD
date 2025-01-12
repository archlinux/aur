# Maintainer: Mario Blättermann <mario.blaettermann@gmail.com>
# Contributor: Scott Lawrence <bytbox@gmail.com>
# Maintainer: Leandro Cunha <leandrocunha016@gmail.com>

pkgname=doclifter
pkgver=2.21
pkgrel=1
pkgdesc="Lift documents in {n,t}roff markups to XML-DocBook"
arch=('any')
url="http://www.catb.org/~esr/doclifter/"
license=('BSD-2-Clause' 'MIT-0')
depends=('python')
makedepends=('python' 'xmlto' 'gzip')
optdepends=('groff: troff level support' 'plotutils: plotting utilities')
source=("http://www.catb.org/~esr/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "default-to-py3k.patch"
        "manlifter-outdir.patch")
sha256sums=('df36fe1ffad1994f3b2d6874fa442d891319e09c09ded56bb7cbd0fc478ac7c4'
            'f484edc6f54c2c538c3c2ea271f8d0eb48c3ad65f78b243f8a7a7b4926934e8b'
            'a833dd01d240dbadca25b1a70a114916a4076bb62e869a6cbf3a926b39dabc87')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -p1 < "${srcdir}/default-to-py3k.patch"
  patch -p1 < "${srcdir}/manlifter-outdir.patch"
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"

  install -dm755 "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"

  make PREFIX="$pkgdir/usr" MANDIR="$pkgdir/usr/share/man/man1" install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/${pkgname}/COPYING"
}

check() {
  cd "${pkgname}-${pkgver}"
  make check || true
}
