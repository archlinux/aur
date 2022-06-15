# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pokete
pkgver=0.7.2
pkgrel=1
pkgdesc='A terminal based Pokemon like game'
url='https://lxgr-linux.github.io/pokete'
license=('GPL3')
arch=('any')
depends=('python' 'python-scrap_engine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lxgr-linux/pokete/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7410b2043a53e636bfb8c9ede4c24f933f2bd3f5685ff0b2b3031206d7cbd5f4')
b2sums=('c8db7082cdad7b27291a145073c450bbb5904cb59b2641762cc82a243f656f9657d86245775261ba971923ba10906d2a65f14dcaa6d38014d9012b5b1b632742')

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
