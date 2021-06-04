# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=cos-git
pkgver=r2051.c2dc1ad3
pkgrel=1
pkgdesc='Children of Solarus - 100% free remake of The Legend of Zelda: Mystery of Solarus DX (Git version)'
arch=('any')
url='https://solarus-games.org/en/games/children-of-solarus'
license=('GPL3' 'custom')
depends=('solarus>=1.6.0')
makedepends=('cmake' 'git' 'zip')
source=("$pkgname::git+https://gitlab.com/solarus-games/children-of-solarus.git"
        "$pkgname.png"
        "$pkgname.desktop")
b2sums=('SKIP'
        '246f69fd275711cceb42e1d6cadbb47c82f75d6b0cff4ac4d17554f53a118a4adc6d72887960e5f2397a6734b09b9676f9dac27e0cc4203911d0c192720b3371'
        '9c950ca2d10077c94fb5aa080d2f3d6fb46869c33a16ac443197647e5cf2b9318e58be04310538647e2ed9fdbee09758dca9b3e018f34da442501bf1cdc685af')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
    sed -i 's/set(quest_name "ChildrenOfSolarus")/set(quest_name "cos-git")/' "$pkgname/CMakeLists.txt"
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX='/usr' .
  make
}

package() {
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"

  cd "$pkgname"
  make DESTDIR="$pkgdir/" install
  install -Dm644 license.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
