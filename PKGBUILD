# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=tcb
pkgver=1.2
pkgrel=1
pkgdesc="Alternative password shadowing scheme"
arch=('i686' 'x86_64')
url="https://www.openwall.com/tcb/"
license=('BSD-3-Clause' 'GPL-1.0-or-later')
depends=('glibc' lib{crypt,pam}.so)
makedepends=('libxcrypt' 'pam')
options=('staticlibs')
source=("$pkgname-$pkgver-src.tar.gz::https://www.openwall.com/tcb/tcb-${pkgver}.tar.gz"
        "$pkgname-$pkgver-src.tar.gz.sign::https://www.openwall.com/tcb/tcb-${pkgver}.tar.gz.sign")
sha256sums=('53b1a17cb85afd273136e5a6f49f0202af80a4e2c54383bc409c96444a250bd4'
            'SKIP')
validpgpkeys=('297AD21CF86C948081520C1805C027FD4BDC136E')  # Openwall offline signing key


prepare() {
  cd "$pkgname-$pkgver"

  sed -i 's/-g chkpwd/-g root/;s/-g shadow/-g root/' "progs/Makefile"
}

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  make \
    DESTDIR="$pkgdir" \
    SBINDIR="/usr/bin" \
    SLIBDIR="/usr/lib" \
    LIBEXECDIR="/usr/lib" \
    MANDIR="/usr/share/man" \
    install
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/tcb"
}
