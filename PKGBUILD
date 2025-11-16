# Maintainer: Gurov
pkgname=zeptofetch-git
pkgver=r146.1291eeb
pkgrel=1
pkgdesc="Blazingly fast, ultra-minimal system information tool for Linux (git version)"
arch=('x86_64')
url="https://gitlab.archlinux.org/gurov/zeptofetch"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('git' 'gcc' 'make')
provides=('zeptofetch')
conflicts=('zeptofetch' 'zeptofetch-bin')
source=("git+https://gitlab.archlinux.org/gurov/zeptofetch.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/zeptofetch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/zeptofetch"
  export TZ=UTC
  make CFLAGS="-std=c99 -D_POSIX_C_SOURCE=200809L -D_DEFAULT_SOURCE -D_FORTIFY_SOURCE=2 -fstack-protector-strong -fno-strict-overflow -fno-strict-aliasing -fno-delete-null-pointer-checks -Wall -Wextra -Wpedantic -Werror=format=2 -Werror=implicit-fallthrough -Werror=shift-overflow=2 -Werror=cast-function-type -Werror=stringop-overflow=4 -Werror=vla -Werror=pointer-arith -march=native -O3 -flto -pipe" \
       LDFLAGS="-Wl,-z,relro -Wl,-z,now -Wl,-z,noexecstack -Wl,--gc-sections -Wl,--hash-style=gnu"
}

package() {
  cd "$srcdir/zeptofetch"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
