# Maintainer: Tom van der Lee <t0m.vd.l33@gmail.com>
pkgname=bir-git
pkgver=r25.b14a485
pkgrel=1
pkgdesc="Simple graphical batch image resizer: git-version"
arch=('any')
url="https://github.com/agronick/BIR"
license=('GPL')
depends=("qt5-base")
makedepends=('gcc'
	     'git')
provides=('bir')
conflicts=('bir')
source=("$pkgname::git+https://github.com/agronick/BIR.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname/build"
  qmake-qt5 ../
  make
}

package() {
  cd "$pkgname/build"
  install -Dm644 "$srcdir/$pkgname/bir.png" "$pkgdir/usr/share/icons/hicolor/48x48/apps/bir.png"
  install -Dm755 "$srcdir/$pkgname/bir.desktop" "$pkgdir/usr/share/applications/bir.desktop"
  make INSTALL_ROOT="$pkgdir/" install
}
