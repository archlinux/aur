# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

_pkgname=faustpp
pkgname="$_pkgname-git"
pkgver=v1.0.0.r0.g110ba5d
pkgrel=1
pkgdesc='A post-processor for FAUST DSP code (git version)'
arch=(any)
url='https://github.com/jpcima/faustpp'
license=(Boost)
depends=(python-jinja)
makedepends=(git python-build python-installer python-wheel)
provides=($_pkgname)
conflicts=($_pkgname)
source=("$_pkgname::git+https://github.com/jpcima/$_pkgname.git")
md5sums=('SKIP')


pkgver() {
  cd $_pkgname
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.r%s.%s" \
      "$(grep ^version setup.cfg | cut -d ' ' -f 3)" \
      "$(git rev-list --count HEAD)" \
      "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd $_pkgname
  python -m build --wheel --no-isolation
}

package() {
  cd $_pkgname
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm644 LICENSE* -t "$pkgdir"/usr/share/licenses/$pkgname
  install -Dm644 docs/manual/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE-manual
  install -Dm644 docs/manual/LICENSE.* -t "$pkgdir"/usr/share/licenses/$pkgname
  # documentation
  install -Dm644 docs/manual/en/manual.* -t "$pkgdir"/usr/share/doc/$pkgname/
  # examples
  install -Dm644 examples/* -t "$pkgdir"/usr/share/doc/$pkgname/examples
}

# vim:set ts=2 sw=2 et:
