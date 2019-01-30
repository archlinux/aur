# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dpkg-git
pkgver=1.19.4.r5.g42bf88145
pkgrel=1
pkgdesc="Debian package management system"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/dpkg"
license=('GPL')
depends=('glibc' 'bzip2' 'perl' 'xz' 'zlib')
makedepends=('git' 'perl-io-string' 'perl-timedate')
provides=('dpkg')
conflicts=('dpkg')
source=("git+https://git.dpkg.org/git/dpkg/dpkg.git")
sha256sums=('SKIP')


pkgver() {
  cd "dpkg"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "dpkg"

  ./autogen
  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --localstatedir="/var" \
    --disable-start-stop-daemon
  make
}

package() {
  cd "dpkg"

  make DESTDIR="$pkgdir" install

  install -d "$pkgdir/var/dpkg/updates"
  touch "$pkgdir/var/lib/dpkg"/{status,available}
}
