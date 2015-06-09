# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgver=v1.0.r147.g6c31152
pkgname=erlexec-git
_pkgname=${pkgname%-git}
pkgrel=1
arch=('i686' 'x86_64')
license=('BSD')
pkgdesc="Execute and control OS processes from Erlang VM"
url="http://saleyn.github.com/erlexec/"
depends=('erlang-nox')
makedepends=('git' 'libcap')
source=('git+https://github.com/saleyn/erlexec.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/$_pkgname"
  mkdir -m755 -p $pkgdir/usr/lib/erlang/lib/$_pkgname
  tar cf - . \
    --exclude-vcs \
    --exclude="LICENSE" --exclude="TODO" --exclude="AUTHORS" \
    --exclude="core*" --exclude="erl_crash.dump" \
    --exclude="*.tgz" --exclude="*.swp" \
    --exclude="Makefile" --exclude="rebar.*" --exclude="*.mk" \
    --exclude="*.o" \
    $_pkgname \
  | tar xf - -C $pkgdir/usr/lib/erlang/lib/$_pkgname
}
