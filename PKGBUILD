# Maintainer: Qontinuum <qontinuum.dev@protonmail.ch>

pkgname=zelda-alttd-git
pkgver=r3950.4e3c25a2
pkgrel=1
pkgdesc="The Legend of Zelda: A Link to the Dream - Remake of The Legend of Zelda: Link's Awakening (Git version)"
arch=('any')
url='https://www.solarus-games.org/fr/games/the-legend-of-zelda-a-link-to-the-dream'
license=('custom')
depends=('solarus>=1.6.0')
makedepends=('cmake' 'git' 'zip')
source=("$pkgname::git+https://gitlab.com/zeldaforce/zelda-alttd.git"
        "$pkgname-launcher"
        "$pkgname.desktop"
        "$pkgname.png")
b2sums=('SKIP'
        '4d0c654af0434212724915a72cd5e4439c89f95f4fb331c669388b5e65676afd31168f8fe6e99ac04b769d6be05db9e22e61d81af30145d5808fc58d0caeb8fc'
        '835e6b8db95c6466f21efe733959461b9481d20eb10a970262f0438cc54eabb6deea53011560322f0baf7fe129c1c977076be10f75d86d02988bb0d8bc2df256'
        'b23c6aa20af637e4ae09519f8b770f19ea8f1f774615c8a141b521d1ce859f738c43cf56cc3a0c799a736cdb310415ac576e9afe8b21c95451c8b818226e2442')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
    sed -i 's/set(quest_name "zelda-alttd")/set(quest_name "zelda-alttd-git")/' "$pkgname/CMakeLists.txt"
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
  install -Dm 755 "../$pkgname-launcher" "$pkgdir/usr/bin/$pkgname"
}
