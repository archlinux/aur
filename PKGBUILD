pkgname=superfetch-git
pkgver=1.0.0.r0.g5dd307a
pkgrel=1
pkgdesc="A blazing fast, sub-millisecond system information tool for Linux."
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/TouchOfDeath/superfetch"
license=('MIT')
depends=('glibc')
makedepends=('git' 'make' 'gcc')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/TouchOfDeath/superfetch.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir" prefix=/usr install
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
  fi
}
