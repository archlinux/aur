# Maintainer: lxgr <lxgr@protonmail.com>

pkgbase='pokete-git'
pkgname='pokete-git'
pkgver=0.8.0.r19.gf21aa1d
pkgrel=1
pkgdesc="A terminal based Pokemon like game"
arch=(any)
url="https://github.com/lxgr-linux/pokete"
license=('GPL3')
provides=('pokete')
depends=('python' 'python-scrap_engine-git')
makedepends=('git' 'go')
source=("$pkgbase"::'git+https://github.com/lxgr-linux/pokete')
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/$pkgbase"
  ./gen_wiki.py
  cd ./playsound
  echo ":: Building sound module..."
  go build -ldflags "-s -w" -buildmode=c-shared -o ./libplaysound.so
}

package() {
  cd "${srcdir}/$pkgbase"
  install -dm755 "$pkgdir/usr/share/pokete"
  install -dm755 "$pkgdir/usr/bin/"
  install -Dm644 ./assets/pokete.desktop "$pkgdir/usr/share/applications/pokete.desktop"
  cp -r ./* "$pkgdir/usr/share/pokete"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/pokete/LICENSE"
  ln -s "/usr/share/pokete/pokete.py" "$pkgdir/usr/bin/"
}
