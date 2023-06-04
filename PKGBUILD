# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=nuitka-git
pkgver=1.6.r105.gd263e6fd2
pkgrel=1
pkgdesc="A Python compiler"
arch=('any')
url="https://nuitka.net/"
license=('Apache')
depends=('libxml2' 'python' 'python-setuptools' 'python-wheel')
makedepends=('git' 'python-build' 'python-installer')
optdepends=('chrpath: for building standalone executables')
provides=("nuitka=$pkgver")
conflicts=('nuitka')
source=("git+https://github.com/Nuitka/Nuitka.git")
sha256sums=('SKIP')


pkgver() {
  cd "Nuitka"

  _tag=$(git tag -l --sort -v:refname | grep -E '^v?[0-9\.]+$' | head -n1)
  _rev=$(git rev-list --count $_tag..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash" | sed 's/^v//'
}

build() {
  cd "Nuitka"

  python \
    -m build \
    --wheel \
    --no-isolation
}

package() {
  cd "Nuitka"

  python \
    -m installer \
    --destdir="$pkgdir" \
    dist/*.whl
  install -Dm644 {Changelog,Developer_Manual,README}.rst -t "$pkgdir/usr/share/doc/nuitka"
}
