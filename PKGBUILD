# Maintainer: ibrokemypie <ibrokemypie@bastardi.net>
pkgname=i3lock-next-git
pkgver=r66.def806c
pkgrel=2
pkgdesc="Create a fancy image to use with i3lock."
arch=('i686' 'x86_64')
url="https://github.com/owenthewizard/i3lock-next"
license=('MIT')
depends=(i3lock-color imlib2 bash fontconfig libxrandr)
provides=(i3lock-next)
makedepends=(git)
source=("git+https://github.com/owenthewizard/i3lock-next/")
sha256sums=('SKIP')
_name=i3lock-next

pkgver() {
  cd "$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$_name"
  make DESTDIR="$pkgdir" PREFIX="/usr" LIBEXECDIR="/usr/lib"
}
package() {
  cd "$_name"
  make DESTDIR="$pkgdir" PREFIX="/usr" LIBEXECDIR="/usr/lib" install
  sed -i "s;/libexec/i3lock-next;/lib/$_name;" "$pkgdir/usr/bin/i3lock-next"
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
