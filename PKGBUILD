# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=waf
pkgver=1.8.16
pkgrel=1
pkgdesc='General-purpose build system modelled after Scons'
url='http://waf.io/'
arch=('any')
license=('BSD')
depends=('python')
makedepends=('unzip')
provides=('python-waf')
source=("https://waf.io/${pkgname}-${pkgver}.tar.bz2")
md5sums=('c68227e4d40c0bdd0aadab22a7a27a44')
sha256sums=('5188b5a4246ba3c7a2abbf4ddcb3b3457430166244035bf3c70036fb08944846')

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
