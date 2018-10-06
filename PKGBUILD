# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sebastien Binet <binet@cern.ch>

pkgname=waf
pkgver=2.0.12
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
md5sums=('36f831e315cb98157f84eaf5f9c3323e'
         'ff472805caa81e02cb15bcf87031f722'
         '3cd6a727719e0984f2d4e1a4998c259d')
sha256sums=('38984a3a0697f5b869454e05b1e9ad392c0e60f1da7e65fd2b00cd3856edc6bb'
            '432fb8e21fe31047e16ac068b761961f1a3965785e570bf54aca1c4c07d253f4'
            'b51599dc1d56b2b89a45ec62a87b62955f34c594a381a36747c4a17171dd8414')

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
