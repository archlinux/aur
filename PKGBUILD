# Maintainer: GekkLee <development@gekklee.xyz>
pkgname=gekkfetch-git
pkgver=r6.2d05bce
pkgrel=1
pkgdesc="Minimalist system info tool written in C (latest git version)"
arch=('x86_64')
url="https://github.com/gekklee/gekkfetch"
license=('GPL3')
depends=()
makedepends=('git' 'make' 'gcc')
provides=('gekkfetch')
conflicts=('gekkfetch')
source=("git+https://github.com/gekklee/gekkfetch.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/gekkfetch"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/gekkfetch"
  sed -i 's|fscanf(uptime_fp, "%lf", &uptime_seconds);|if (fscanf(uptime_fp, "%lf", &uptime_seconds) != 1) { \\\n  // Handle error here \\\n}|' "$srcdir/gekkfetch/gekkfetch.c"
  make
}

package() {
  cd "$srcdir/gekkfetch"
  make DESTDIR="$pkgdir/" PREFIX=/usr install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

