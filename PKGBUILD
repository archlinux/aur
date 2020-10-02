# Maintainer: Giacomo Vercesi <mrjackv@hotmail.it>

pkgname=posterazor-git
pkgver=r1117.710d969
pkgrel=1
pkgdesc="GUI tool to split an image into multiple pages to make posters"
arch=('x86_64')
url="https://posterazor.sourceforge.io/"
license=('GPL')
depends=(poppler-qt5)
provides=(posterazor)
conflicts=(posterazor)
makedepends=(git)
source=("git+https://github.com/aportale/posterazor"
        "fix_build.patch" "posterazor.desktop")
sha256sums=('SKIP'
            '986f165233488a405766f2022ccfa63909a9d1111e6c94affd4bf652e9094843'
            '5ed91452dea88eddd943622f5f971d251606765330a0112a287e2d31c0b7f74b')

pkgver() {
  cd "$srcdir/posterazor"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/posterazor"
  patch -p1 < ../fix_build.patch
}

build() {
  cd "$srcdir/posterazor/src"
  qmake posterazor.pro
  make
}

package() {
  cd "$srcdir/posterazor/src"
  install -Dm755 PosteRazor "$pkgdir/usr/bin/posterazor"
  install -Dm644 posterazor.ico "$pkgdir/usr/share/icons/posterazor.ico"
  install -Dm644 "$srcdir/posterazor.desktop" "$pkgdir/usr/share/applications/posterazor.desktop"
}
