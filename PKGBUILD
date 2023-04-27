# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=dpkg-git
pkgver=1.21.20.r152.g329d06a62
pkgrel=1
pkgdesc="Debian package management system"
arch=('i686' 'x86_64')
url="https://tracker.debian.org/pkg/dpkg"
license=('GPL')
depends=('gcc-libs' 'glibc' 'bzip2' 'libmd' 'perl' 'xz' 'zlib' 'zstd')
makedepends=('git' 'perl-io-string' 'perl-timedate')
provides=("dpkg=$pkgver")
conflicts=('dpkg')
options=('staticlibs')
source=("git+https://git.dpkg.org/git/dpkg/dpkg.git"
        "origin.archlinux::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/dpkg/trunk/origin.archlinux")
sha256sums=('SKIP'
            'SKIP')


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
    --libexecdir="/usr/lib" \
    --localstatedir="/var" \
    --disable-start-stop-daemon
  make
}

package() {
  cd "dpkg"

  make DESTDIR="$pkgdir" install

  install -Dm644 "$srcdir/origin.archlinux" "$pkgdir/etc/dpkg/origins/archlinux"
  ln -sf "archlinux" "$pkgdir/etc/dpkg/origins/default"

  install -d "$pkgdir/var/lib/dpkg/updates"
  touch "$pkgdir/var/lib/dpkg"/{status,available}
}
