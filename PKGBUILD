# Maintainer: Jonathan Knapp <jaknapp8+aur@gmail.com>
# URL: https://codeberg.org/anaseto/boohu
# Upstream: https://codeberg.org/anaseto/boohu
# Previously: https://github.com/anaseto/boohu

pkgname=('boohu-git' 'boohu-tk-git')
pkgver=0.14.0
pkgrel=1
pkgdesc="Break Out Of Hareka's Underground, a roguelike game."
arch=('i686' 'x86_64')
url='https://codeberg.org/anaseto/boohu'
license=('ISC')
depends=()
makedepends=('git' 'go' 'tk')
provides=('boohu')
#conflicts=('boohu')
source=("$pkgname::git+https://codeberg.org/anaseto/boohu.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/./g'
}

prepare() {
  cd "$pkgname"
  # strip https:// from canonical URL
  go mod init "${url#https://}" || echo 'already modded'
  go mod tidy
}

build() {
  cd "$pkgname"
  go build -o boohu .
  go build --tags tk -o boohu-tk .
}

package_boohu-git() {
  install -Dm 755 "$srcdir/$pkgname/boohu" -t "$pkgdir/usr/bin";
  install -Dm 644 "$srcdir/$pkgname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}

package_boohu-tk-git() {
  depends=('tk')
  install -Dm 755 "$srcdir/boohu-git/boohu-tk" -t "$pkgdir/usr/bin";
  install -Dm 644 "$srcdir/boohu-git/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
