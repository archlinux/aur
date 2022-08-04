# Maintainer: KokaKiwi <kokakiwi+aur [at] kokakiwi [dot] net>

pkgname=pokete
pkgver=0.8.1
pkgrel=1
pkgdesc='A terminal based Pokemon like game'
url='https://lxgr-linux.github.io/pokete'
license=('GPL3')
arch=('any')
depends=('python' 'python-scrap_engine')
source=("$pkgname-$pkgver.tar.gz::https://github.com/lxgr-linux/pokete/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('1015ec6b47c3eb77ae14cdfc2ff03a21c7c473ea625c8f508c8c947430579e77')
b2sums=('643e4b7401323a1c8df1ee1ac67d99690f9d2f505bfff6d446161f6a9d655ccd21a19915452562622caa8e60742c1693f4afa2d1eb93916fff843c5776c4894b')

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
