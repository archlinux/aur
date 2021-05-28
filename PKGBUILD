# Maintainer: David Runge <dvzrv@archlinux.org>

_name=click-repl
pkgname=python-click-repl
pkgver=0.1.6
pkgrel=5
pkgdesc="Subcommand REPL for click apps"
arch=('any')
url="https://github.com/click-contrib/click-repl"
license=('MIT')
depends=('python-click' 'python-prompt_toolkit' 'python-six')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "${pkgname}-0.1.6-click8.patch"
)
sha512sums=('50576166e8eb61098b8b4e1c7db43101c226d09785a497539830addfd52a2c35b2fa7865d3cbb20559dcf2fea99801f306dcb05c177886f021a1ada188501ced'
            'b4ff9f0ffd36d4b332e45d4320844757bf5bde7d4afed7bb12ec49f097261425aa91f00d58a44b4f6c15b15e71b8dd80f6e7dc56605aefbba082af6bf73ea491')
b2sums=('3729c1d24d9c89a209c5e567e635291dd278dbd0d7f5cd0e0890574652f072e0861744fc33759f92158313c498bc421d8b3805bfb76a959e1036401d5f2f7908'
        '252914397b6c388f772ba0559199bfb3433ac7d1d47ee9aa9ca6073a50b2000fd5e49f9716452bc021f3406911e1834bcb90697c006e6b0c4a779607cb142351')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  # fix issues with python-click > 8
  # https://github.com/click-contrib/click-repl/pull/76
  patch -Np1 -i "../${pkgname}-0.1.6-click8.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

## no tests in pypi source:
## https://github.com/click-contrib/click-repl/issues/49
#check() {
#  cd "$pkgname-$pkgver"
#  export PYTHONPATH="${PYTHONPATH}:${PWD}/build/lib/"
#  py.test
#}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --root="${pkgdir}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
