# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=waf
pkgver=2.0.7
pkgrel=1
pkgdesc='General-purpose build system modelled after Scons'
url='http://waf.io/'
arch=('any')
license=('BSD')
depends=('python')
makedepends=('unzip')
provides=('python-waf')
source=("https://waf.io/${pkgname}-${pkgver}.tar.bz2"
        'wafdir.patch'
        'building-waf.md')
md5sums=('274855847a0a718e53555dd74042c693'
         'ff472805caa81e02cb15bcf87031f722'
         '93fd94b3dc4616c35e9bf13adc63b23c')
sha256sums=('00e188d18b5d160c20eeffb6638254ad9eea8cdb53ae7cd0e63ef657871e3580'
            '432fb8e21fe31047e16ac068b761961f1a3965785e570bf54aca1c4c07d253f4'
            '3103524b61ac3f3af9bb71f1ac8fcb836a1e67e2bfcf59150f08dbf70a595675')

prepare() {
  cd "$pkgname-$pkgver"

  patch -p1 -i ../wafdir.patch

  # Extract license
  head -n 30 waf | tail -n 25 > LICENSE

  # Python 3 fix
  sed -i '0,/env python/s//python3/' waf
}

build() {
  cd "$pkgname-$pkgver"
  ./waf-light \
    configure --prefix=/usr \
    build --make-waf --tools='compat,compat15,ocaml,go,cython,scala,erlang,cuda,gcj,boost,pep8,eclipse,qt4,kde4'

  # Strip packed library from binary. The plain files are installed separately.
  sed -i '/^#==>$/,/^#<==$/d' waf
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" building-waf.md

  cd "$pkgname-$pkgver"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dt "$pkgdir/usr/bin" waf
  install -Dm644 -t "$pkgdir/usr/share/$pkgname" wscript

  # Place waf library and tools.
  local wafdir="$pkgdir/usr/lib/waf"
  install -d "$wafdir"
  bsdtar -xf zip/waflib.zip -C "$wafdir"

  # compile all python sources for once to be used after installation.
  python -OOm compileall "$wafdir"
}

# vim:set ts=2 sw=2 et:
