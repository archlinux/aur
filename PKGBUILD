# Maintainer: Felipe BF <fprgw32 at gmail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>

_name=paexec
pkgname="${_name}-git"
pkgver=1.1.6.r1.eb4e1d4
pkgrel=1
pkgdesc="Parallel executor, distributes tasks over network or CPUs (bleeding-edge version)"
arch=('i686' 'x86_64')
url="https://github.com/cheusov/${_name}"
license=('MIT')
depends=('runawk' 'bash' 'glibc' 'libmaa' 'gawk')
makedepends=('git' 'bmake' 'mk-configure' 'clang')

source=("${_name}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${_name}"
  git describe --tags --long | sed "s/\-/.r/;s/\-g/./"
}

prepare() {
  cd "${_name}"

  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man CC=clang
  export SUBPRJ_DFLT='paexec paargs doc examples'

  mkc_compiler_settings
}

build() {
  cd "${_name}"

  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man CC=clang
  export SUBPRJ_DFLT='paexec paargs doc examples'

  CFLAGS+=" -Wno-unused-but-set-global"
  mkcmake all
}

check() {
  cd "${_name}"

  mkcmake test
}

package() {
  cd "${_name}"

  export PREFIX=/usr SYSCONFDIR=/etc MANDIR=/usr/share/man
  export SUBPRJ_DFLT='paexec paargs doc examples'

  mkcmake DESTDIR="$pkgdir" install

  install -Dm644 <(sed -n '45,64p' Makefile) "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

