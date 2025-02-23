# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-lzfse
_pkgname="${pkgname#python-}"
pkgver=0.4.2
pkgrel=2
pkgdesc='Python bindings for the LZFSE reference implementation'
arch=('x86_64')
url='https://github.com/m1stadev/lzfse'
license=('MIT' 'BSD-3-Clause')
depends=('python')
makedepends=('git' 'python-build' 'python-wheel' 'python-installer' 'python-setuptools')
source=(
  "${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}"
  "git+https://github.com/lzfse/lzfse.git#commit=88e2d2788b4021d0b2eb9fe2d97352ae9190f128"
)
sha256sums=('362ac868ae1fbdf4e306fbecf4e945760db0dd2f51481e04c2ea756e2356074e'
            'b298e890b2565994424e0b4b56af1f8620c7ca223df35e442ad09448d6fe9cec')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  git submodule init
  git config submodule.lzfse.url "${srcdir}/lzfse"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 LICENSE.lzfse "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.lzfse"
}
