# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-peakdetect
pkgver=1.1
pkgrel=1
pkgdesc='Simple peak detection'
url='https://github.com/anaxilaus/peakdetect'
arch=('any')
license=('unknown')
depends=('python-numpy' 'python-scipy')
makedepends=('git' 'python-setuptools')
source=(
  "git+$url#tag=v$pkgver"
  'LICENSE'
)
sha256sums=(
  'SKIP'
  '4961c1398d7e4f836b97c9db17e2f0c0bfe51a0fe5784e14c63713eb2c536a6b'
)

_backports=(
  'd6010d46c1c61efa3532a475e09c69b5e388d6e0'
)

prepare() {
  cd "peakdetect"
  git remote add -f upstream ../peakdetect
  local _c
  for _c in "${_backports[@]}"; do
    git log --oneline -1 "${_c}"
    git cherry-pick -n "${_c}"
  done
}

build() {
  cd "peakdetect"
  python setup.py build
}

package() {
  install -Dm755 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  cd "peakdetect"
  python setup.py install --root="$pkgdir" --prefix=/usr --skip-build --optimize=1
}
