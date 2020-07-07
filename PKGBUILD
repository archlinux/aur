# Maintainer: David Rheinsberg <david.rheinsberg@gmail.com>

pkgname=osbuild
pkgver=18+9+ga505a82
pkgrel=1
pkgdesc="Build Pipelines for Operating System Artifacts"
url="https://www.osbuild.org"
arch=(any)
license=(Apache)
depends=(python)
makedepends=(make python-docutils python-setuptools)
source=("git+https://github.com/osbuild/osbuild")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/^v//;s/-/+/g'
}

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  make man
  python setup.py build
  python setup.py install --skip-build --root="$pkgdir"

  install -v -m 0755 -d "$pkgdir/usr/lib/osbuild"
  install -v -m 0755 -d "$pkgdir/usr/lib/osbuild/osbuild"

  for group in assemblers runners schemas sources stages ; do
    cp -vdr --no-preserve=ownership "$group" "$pkgdir/usr/lib/osbuild/"
  done
}

# vim:set sw=2 et:
