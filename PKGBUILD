# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pokete
pkgver=0.7.3
pkgrel=2
pkgdesc='A terminal based Pokemon like game'
url='https://lxgr-linux.github.io/pokete'
license=('GPL3')
arch=('any')
depends=('python' 'python-scrap_engine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lxgr-linux/pokete/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('bee2eb4fc50da086b04101fab8a479719af46e74dd3ccd05d3aa50235a576aed')
b2sums=('9958bc7f8062fb6ee860533d88422706fb0993929cd0c78a2023aa11c2c870d3a18a50d55268985e3fcb19a96653b1706e4d744e19fad28d8fafe8ff8a2efabf')

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
