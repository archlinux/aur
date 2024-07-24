# Maintainer: Renato Lui Geh <renatogeh at gmail dot com>

pkgname=python-pasp-git
_name=pasp
pkgver=v0.0.5.r1.g76d96fe
pkgrel=1
pkgdesc="Probabilistic answer set programming (install from git)"
arch=("any")
url="https://kamel.ime.usp.br/pages/learn_dpasp.html"
license=("MIT")
depends=("python" "clingo" "python-lark-parser" "python-numpy" "python-pandas")
makedepends=("python-setuptools" "gcc" "python-numpy")
optdepends=("python-pytorch" "python-pytorch-cuda" "python-pytorch-opt" "python-pytorch-opt-cuda")
provides=("python-pasp")
conflicts=("python-pasp")
source=("git+https://github.com/RenatoGeh/pasp#branch=master")
sha256sums=("SKIP")

prepare() {
  cd "$srcdir/$_name"
  git checkout master
  git pull
  git submodule init
  git submodule update --remote
}

pkgver() {
  cd "$srcdir/$_name"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$_name"
  python3 setup.py build
}

package() {
  cd "$srcdir/$_name"
  python3 setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
