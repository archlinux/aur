# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=waf
pkgver=1.8.11
pkgrel=1
pkgdesc='General-purpose build system modelled after Scons'
url='http://waf.io/'
arch=('any')
license=('BSD')
depends=('python')
provides=('python-waf')
source=("https://waf.io/${pkgname}-${pkgver}.tar.bz2")
md5sums=('6394d8b3c022cfe7dddc3a9321efb4ca')
sha256sums=('9bf276b2c7ff60bcf6b8727a2ebdbdbba741f01ceb95022bd39d64cf7235bab8')

prepare() {
  cd "$pkgname-$pkgver"

  # Extract license
  head -n 30 waf | tail -n 25 > LICENSE

  # Python 3 fix
  sed -i '0,/env python/s//python3/' waf
}

build() {
  cd "$pkgname-$pkgver"
  ./waf-light \
    configure --prefix=/usr \
    build --make-waf --tools='compat,compat15,ocaml,go,cython,scala,erlang,cuda,gcj,boost,pep8,eclipse'
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 waf "$pkgdir/usr/bin/waf"

  local waflib="$pkgdir/usr/lib/waf3-$pkgver-$(grep -aPom1 '(?<=^REVISION=")[[:xdigit:]]*(?="$)' "$pkgdir/usr/bin/waf")"
  install -dm755 "$waflib"
  unzip -d "$waflib" zip/waflib.zip

  # compile all python sources for once to be used after installation.
  python -m compileall "$waflib"
}

# vim:set ts=2 sw=2 et:
