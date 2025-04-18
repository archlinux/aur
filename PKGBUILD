# Maintainer: lxgr <lxgr@protonmail.com>

pkgbase='pokete-git'
pkgname='pokete-git'
pkgver=0.10.0.rc1.r16.gee70b6f7
pkgrel=1
pkgdesc="A terminal based Pokemon like game"
arch=(any)
url="https://github.com/lxgr-linux/pokete"
license=('GPL-3.0-only')
provides=('pokete')
depends=('python' 'python-scrap_engine' 'alsa-lib')
makedepends=('git' 'go' 'python-yaml' 'git' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("$pkgbase"::'git+https://github.com/lxgr-linux/pokete')
md5sums=('SKIP')

pkgver() {
  cd "$pkgbase"
  git describe --tags --always | sed -r 's|release-||g;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/$pkgbase"
  cd src/pokete/playsound
  echo ":: Building sound module..."
  go build -ldflags "-s -w" -buildmode=c-shared -o ./libplaysound.so
  cd "${srcdir}/$pkgbase"
  echo ":: Building package"
  python -m build --wheel
}

package() {
  cd "${srcdir}/$pkgbase"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/pokete/LICENSE"
}
