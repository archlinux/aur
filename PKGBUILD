# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_name=runawk
pkgname="${_name}-git"
pkgver=1.7.0.r1.f2755d4
pkgrel=2
pkgdesc="AWK wrapper that provides support for modules"
arch=('i686' 'x86_64')
url="https://github.com/cheusov/${_name}"
license=('MIT')
provides=("${_name}")
conflicts=("${_name}")
depends=('bash')
makedepends=('git' 'bmake' 'mk-configure')

source=("${_name}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${_name}"
  git describe --tags --long --match="runawk-*" \
      | sed 's/^runawk-//;s/-/.r/;s/-g/./'
}

prepare() {
  cd "$srcdir/${_name}"

  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='runawk modules examples a_getopt doc'
  
  mkc_compiler_settings
}

build() {
  cd "$srcdir/${_name}"

  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='runawk modules examples a_getopt doc'
  
  mkcmake all
}

check() {
  cd "$srcdir/${_name}"

  mkcmake test
}

package() {
  cd "$srcdir/${_name}"

  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='runawk modules examples a_getopt doc'
  
  mkcmake DESTDIR="$pkgdir" install

  install -Dm644 <(sed -n '2,22p' "${_name}/${_name}.c" | sed 's/^.\*.//; s/^.\*//') "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

