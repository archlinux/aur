# Maintainer: Attila Fidan <archlinux-buildsystem@print0.net>

pkgname=ktls-utils-git
_gitname=${pkgname%-git}
pkgver=0.10.r13.g15f57f6
pkgrel=2

pkgdesc="TLS handshake utilities for in-kernel TLS consumers"
url="https://github.com/oracle/ktls-utils"
license=(GPL-2.0-only)
arch=(x86_64)

depends=(
  glib2
  glibc
  gnutls
  libkeyutils.so
  libnl-3.so
)
makedepends=(git)

backup=(etc/tlshd.conf)

source=("git+$url.git#branch=main")
b2sums=(SKIP)

prepare() {
  cd "$_gitname"
  ./autogen.sh
}

pkgver() {
  cd "$_gitname"
  git describe --long --abbrev=7 | sed 's/^ktls-utils-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_gitname"
  ./configure --prefix=/usr --sbindir=/usr/bin --sysconfdir=/etc --with-systemd
  make
}

package() {
  cd "$_gitname"
  make DESTDIR="$pkgdir" install
  sed -i "s,/usr/sbin/,/usr/bin/,g" "$pkgdir"/usr/lib/systemd/system/*.service
}
