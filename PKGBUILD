# $Id$
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
# Contributor: Vladimir Chizhov <jagoterr@gmail.com>
# Contributor: Henry Tang <henryykt@gmail.com>

_pkgname=phantomjs
pkgname=${_pkgname}-git
pkgver=2.1.0.r82.ge3f534e73
pkgrel=1
pkgdesc="Headless WebKit with JavaScript API"
url="http://phantomjs.org/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('qt5-webkit')
makedepends=('git')
source=("git+https://github.com/ariya/${_pkgname}.git"
        "build-qt58.patch"::"https://github.com/ariya/phantomjs/pull/15119.patch")
sha512sums=('SKIP'
            '903cac3e3659454fc0f6a61bc518bc8d6d631f2c59de541784da48e159a98adbf641450a51cfd25419cbfd94f157a9bc2626b4457c5959f41d0da27f96612f4d')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/$_pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd $_pkgname

  patch -Np1 -i ../build-qt58.patch

  qmake
}

build() {
  cd $_pkgname

  make
}

package() {
  cd $_pkgname

  make install INSTALL_ROOT="$pkgdir"

  install -Dm755 "$srcdir/$_pkgname/bin/phantomjs" "$pkgdir/usr/bin/phantomjs"

  mkdir -p "$pkgdir/usr/share/$_pkgname"
  cp -dr --no-preserve=ownership "$srcdir/$_pkgname/examples" "$pkgdir/usr/share/$_pkgname"/

  install -Dm644 "$srcdir/$_pkgname/LICENSE.BSD" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
  install -Dm644 "$srcdir/$_pkgname/third-party.txt" "$pkgdir/usr/share/licenses/$pkgname/third-party.txt"
}

