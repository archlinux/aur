# Maintainer: veluca93 <veluca93@gmail.com>
# Contributor: trillian <trillian+aur@r9.pm>
# Contributor: iamawacko <iamawacko@protonmail.com>
# Contributor: German IOI Coaches <coaches@informatik-olympiade.de>
# Contributor: Alexandre Macabies <web+oss@zopieux.com>
# Contributor: Antoine Pietri <antoine.pietri@lrde.epita.fr>
# Contributor: William Di Luigi <williamdiluigi@gmail.com>

pkgname=isolate
pkgver=2.1.2
pkgrel=3
pkgdesc="Sandbox for securely executing untrusted programs"
arch=('any')
url="https://github.com/ioi/isolate"
license=('GPL-2.0-or-later')
depends=('bash' 'systemd-libs' 'libcap' 'glibc')
makedepends=('gcc' 'asciidoc')
provides=('isolate')
conflicts=('isolate-git')
install=$pkgname.install

source=("isolate-$pkgver.tar.gz::https://github.com/ioi/isolate/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('2dce2a147340be12a8b7429ae81a4a86d82f23966d4632a80f1461fdc18d74af02242b6caf0f5d4aed2324ee09314d554be87d0e87cc219da4395ea5da7d0c0c')

build() {
  cd isolate-$pkgver
  make all PREFIX=/usr VARPREFIX=/var CONFIGDIR=/etc SBINDIR=/usr/bin CFLAGS_EXTRA="$CFLAGS" LDFLAGS="\$(LDFLAGS_HARDEN) $LDFLAGS"
}

package() {
  cd isolate-$pkgver
  make install install-doc PREFIX=/usr VARPREFIX=/var CONFIGDIR=/etc SBINDIR=/usr/bin DESTDIR="$pkgdir"

  # The isolate binary has the setuid bit set (to run as root without sudo)
  # however we should let only the owner and the group be able to run it:
  chmod o-x "$pkgdir/usr/bin/isolate"
}
