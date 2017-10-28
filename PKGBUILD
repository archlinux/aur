# Maintainer: Daniel Hillenbrand <codeworkx at bbqlinux dot org>

_pkgbase=stubby
pkgname=stubby-git
pkgver=2519.e2b26609
pkgrel=1
pkgdesc="DNS Privacy Daemon"
arch=('x86_64' 'i686')
url="https://dnsprivacy.org/wiki/display/DP/DNS+Privacy+Daemon+-+Stubby"
license=('BSD')
depends=('openssl')

source=("$_pkgbase::git+https://github.com/getdnsapi/getdns.git")
sha256sums=('SKIP')

install=install

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgbase"
  git submodule update --init
  libtoolize -ci
  autoreconf -fi
  ./configure --prefix=/usr --without-libidn --enable-stub-only --with-ssl=/usr --with-stubby
}

build() {
  cd "$srcdir/$_pkgbase"
  make
}

package() {
  cd "$srcdir/$_pkgbase"
  make DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$_pkgbase/LICENSE"
  install -D -m644 stubby/systemd/stubby.service "${pkgdir}/usr/lib/systemd/system/stubby.service"
  install -D -m644 stubby/systemd/stubby.conf "${pkgdir}/usr/lib/tmpfiles.d/stubby.conf"
}
