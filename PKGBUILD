# Maintainer: David Rheinsberg <david.rheinsberg@gmail.com>

pkgname=osbuild
pkgver=8+50+g83d058b
pkgrel=1
pkgdesc="Build Pipelines for Operating System Artifacts"
url="https://www.osbuild.org"
arch=(any)
license=(Apache)
depends=(python)
makedepends=(python-setuptools)
_commit=83d058b9354c4169f08b5d42851e5cbc07354532
source=("git+https://github.com/osbuild/osbuild#commit=$_commit")
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
  python setup.py install --skip-build --root="$pkgdir"

  for group in assemblers runners sources stages ; do
    install -v -m 0755 -d "$pkgdir/usr/lib/osbuild"
    cp -vdr --no-preserve=ownership "$group" "$pkgdir/usr/lib/osbuild/"
    rm -vf "$pkgdir/usr/lib/osbuild/$group/osbuild"
    install -v -m 0755 -d "$pkgdir/usr/lib/osbuild/$group/osbuild"
  done
}

# vim:set sw=2 et:
