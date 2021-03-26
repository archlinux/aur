pkgname=gaphor-git
_pkgname=gaphor
pkgver=0.28.7
pkgrel=1
pkgdesc='Gaphor is a UML and SysML modeling application written in Python'
arch=('any')
url=https://github.com/gaphor/gaphor
license=('Apache')
depends=('python-cairo' 'python-gaphas' 'python-generic' 'python-gobject' 'python-importlib-metadata' 'python-typing_extensions' 'python-tinycss2')
makedepends=('python-pip' 'python-poetry')
provides=('gaphor')
conflicts=('gaphor')
source=("git+https://github.com/gaphor/gaphor.git")
b2sums=('SKIP')

prepare() {
  cd ${_pkgname}
  # Avoid installing files directly under site-packages/
  sed -i '/include = \["README.md"\]/d' pyproject.toml
}

build() {
  cd ${_pkgname}
  poetry build --format wheel
}

package() {
  cd ${_pkgname}
  export PYTHONHASHSEED=0
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps dist/*.whl
  install -Dm644 -t "$pkgdir"/usr/share/licenses/${_pkgname} LICENSE.txt
}
