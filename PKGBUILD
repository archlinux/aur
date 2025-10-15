# Maintainer: @rvid <contact@rvid.eu>
pkgname=sanctum-git
pkgver=r641.4b6c8e7
pkgrel=2
pkgdesc="Sanctum is a small, reviewable, capable, pq-secure and fully privilege separated VPN daemon for OpenBSD, Linux and MacOS."
arch=('any')
url="https://github.com/jorisvink/sanctum"
license=('ISC')
depends=('libsodium')
makedepends=('pkgconf' 'libsodium' 'git' 'make' 'gcc')
provides=('sanctum')
source=("git+$url.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/sanctum"
  # use git describe to generate a version like r123.abcdef1
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/sanctum"
  CFLAGS="-O2 -pipe -march=native -D_FORTIFY_SOURCE=2" make
}

package() {
  cd "$srcdir/sanctum"
  CFLAGS="-O2 -pipe -march=native -D_FORTIFY_SOURCE=2" make PREFIX="/usr" DESTDIR="$pkgdir/" install-bin
  install -Dm 444 share/man/man1/sanctum.1 "$pkgdir/usr/share/man/man1/sanctum.1"
  install -Dm 444 share/man/man5/sanctum.conf.5 "$pkgdir/usr/share/man/man5/sanctum.conf.5"
}
