# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=waf
pkgver=1.8.20
pkgrel=2
pkgdesc='General-purpose build system modelled after Scons'
url='http://waf.io/'
arch=('any')
license=('BSD')
depends=('python')
makedepends=('unzip')
provides=('python-waf')
source=("https://waf.io/${pkgname}-${pkgver}.tar.bz2")
md5sums=('1e188c5179f47964050b08863e9026a0')
sha256sums=('881dc5d30e9a73a19da8187a97c8afe85a5007f486afce3453401f6b0391ba6e')

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

  local revision="waf3-$pkgver-$(grep -aPom1 '(?<=^REVISION=")[[:xdigit:]]*(?="$)' "$pkgdir/usr/bin/waf")"
  local libdir="$pkgdir/usr/lib"
  local wafdir="$libdir/waf"
  install -dm755 "$libdir"/{waf,"$revision"}
  ln -s ../waf "$libdir/$revision/waflib"
  bsdtar -xf zip/waflib.zip -s '/^waflib.//' -C "$wafdir"

  # compile all python sources for once to be used after installation.
  python -OOm compileall "$wafdir"
}

# vim:set ts=2 sw=2 et:
