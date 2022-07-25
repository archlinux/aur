# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pokete
pkgver=0.8.0
pkgrel=1
pkgdesc='A terminal based Pokemon like game'
url='https://lxgr-linux.github.io/pokete'
license=('GPL3')
arch=('any')
depends=('python' 'python-scrap_engine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lxgr-linux/pokete/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('30d93eda42162ff75fd4e8c9df4508f879b431ce90347c4ea584ae6114749e59')
b2sums=('47ed3f7bbaafe050c33ad4b3aefa07c33d6777042ff2dcc37b8f3381a32a1e16ef55957091ca36b10b2ae2761dc89bad6250ffdaf742a34cdbdb0f6b594dca30')

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
