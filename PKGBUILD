# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pokete
pkgver=0.8.1
pkgrel=2
pkgdesc='A terminal based Pokemon like game'
url='https://lxgr-linux.github.io/pokete'
license=('GPL3')
arch=('any')
depends=('python' 'python-scrap_engine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lxgr-linux/pokete/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('44477ca3153babfa705bd45239f34fd048f21025f061fe92051aee3accba6e1b')
b2sums=('80ac114f03ce363fbf152ce2cc837e4f1430501e6647d5fbd5c96e6b93c51e1bd939e3f15b0329cde3d255bccb596c2fc2caf479917389e9ccb16b113251a1de')

build() {
  cd "$pkgname-$pkgver"

  python gen_wiki.py
  rm -rf pokete_{classes,data}/__pycache__

  python -O -m compileall pokete_classes pokete_data
}

package() {
  cd "$pkgname-$pkgver"

  install -dm0755 "$pkgdir/usr/share/pokete"
  cp -r -t "$pkgdir/usr/share/pokete" \
    assets pokete_classes pokete_data mods \
    pokete.py pokete_general_use_fns.py release.py \
    Changelog.md wiki.md

  install -dm0755 "$pkgdir/usr/bin"
  ln -sf /usr/share/pokete/pokete.py "$pkgdir/usr/bin/pokete"

  install -Dm0644 -t "$pkgdir/usr/share/applications" assets/pokete.desktop

  install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
