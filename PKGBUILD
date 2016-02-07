# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=waf
pkgver=1.8.19
pkgrel=1
pkgdesc='General-purpose build system modelled after Scons'
url='http://waf.io/'
arch=('any')
license=('BSD')
depends=('python')
makedepends=('unzip')
provides=('python-waf')
source=("https://waf.io/${pkgname}-${pkgver}.tar.bz2")
md5sums=('121e893c39012a828d839547103c7714')
sha256sums=('e5df90556d1f70aca82bb5c5f46aa68d2377bae16b0db044eaa0559df8668c6f')

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
  python -OOm compileall "$waflib"
}

# vim:set ts=2 sw=2 et:
