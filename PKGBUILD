# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=waf
pkgver=1.8.15
pkgrel=1
pkgdesc='General-purpose build system modelled after Scons'
url='http://waf.io/'
arch=('any')
license=('BSD')
depends=('python')
makedepends=('unzip')
provides=('python-waf')
source=("https://waf.io/${pkgname}-${pkgver}.tar.bz2")
md5sums=('39baf71f2db83a8e2ec77a98ec2bf0d1')
sha256sums=('24fc7650a33549d5fb2429d3e1ff154be4a39880a9732d9b9fd17bd632291439')

prepare() {
  cd "$pkgname-$pkgver"

  # Extract license
  head -n 30 waf | tail -n 25 > LICENSE

  # Python 3 fix
  sed -i '0,/env python/s//python3/' waf

  # Fix spaces to tabs.
  find -iname '*.py' -exec sed -i 's/ \{8\}/\t/g' '{}' +
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
