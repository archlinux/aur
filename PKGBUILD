# Merged with official ABS python-pyelftools PKGBUILD by João, 2023/06/23 (all respective contributors apply herein)
# Maintainer: João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Rémy Oudompheng <remy@archlinux.org>
# Contributor: emersion <contact emersion fr>

_pkgname=pyelftools
pkgname=python-$_pkgname-git
pkgver=0.29_r643.g3ee5c0e
pkgrel=2
pkgdesc='Python library for analyzing ELF files and DWARF debugging information'
url="https://github.com/eliben/$_pkgname"
arch=(any)
license=("custom:Public Domain")
depends=(python)
makedepends=(git python-build python-installer python-wheel python-setuptools)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
options=('!strip')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  _ver="$(grep -m1 'version' setup.py | cut -d "'" -f2)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname
  python test/run_all_unittests.py
  python test/run_examples_test.py
  if [ "$CARCH" == "x86_64" ]; then
    python test/run_readelf_tests.py
  else
    echo "Skipping readelf tests (require x86_64)"
  fi
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.rst CHANGES -t "$pkgdir/usr/share/doc/$pkgname"
  cp -r examples "$pkgdir/usr/share/doc/$pkgname"
}
