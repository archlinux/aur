# Maintainer: David Runge <dave@sleepmap.de>

_name=IPy
pkgname=python-ipy
pkgver=1.00
pkgrel=5
pkgdesc="Class and tools for handling of IPv4 and IPv6 addresses and networks"
arch=('any')
url="https://github.com/autocracy/python-ipy"
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        $pkgname-py39.patch::https://github.com/autocracy/python-ipy/commit/d4cf6781fbc4.patch)
sha512sums=('94a8f26cad0d966fdf8d4e57284eadf4cfde88515af6f5aafc8f9597eb0758324b876039d1a121021ba1ac26be2e2ffa89a3f5803dddefdee03fdb5d65b07a81'
            '2f98bd4c68944d0aa43f5b1152a4c1bdbc2e9a7820016b48e028a6b4b7db4a69971995b4c9a1f83bc881e405bf1b6c0a7c0a465f2b420d33be151f98d008d11f')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  patch -Np1 -d "$pkgname-$pkgver" <$pkgname-py39.patch
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  py.test
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 {AUTHORS,ChangeLog,README.rst} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
