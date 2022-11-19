# Maintainer: David Runge <dvzrv@archlinux.org>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

_name=toml
pkgname=python38-toml
pkgver=0.10.2
pkgrel=8
pkgdesc="A Python library for parsing and creating TOML"
arch=('any')
url="https://github.com/uiri/toml"
license=('MIT')
depends=('python38')
makedepends=('python38-build' 'python38-installer' 'python38-setuptools'
             'python38-wheel')
checkdepends=('python38-numpy' 'python38-pytest')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        "${pkgname}-0.10.1-install_type_hints.patch")
sha256sums=('b3bda1d108d5dd99f4a20d24d9c348e91c4db7ab1b749200bded2f839ccbe68f'
            '7597ca115ba497797cf7c1330f5e93146ff5a924ef3bc331a8e77da12ee880cf')
b2sums=('a613d5e86fc77279f2d7b130309627eed1cab3a65fe8647cb1dc3e58d09a9d58c078472638f06f45394b00c142bcb2bc75e9c0c649d58aade2f4f6bdab23f12e'
        '23449773cb0c7004d6c367c4cef666561e16fcd38166d17428a8192f6649bdfa76277f20bd4662f7571bc020fba6e5614e8f7dcf8502d18eb1e0ede6cb3ddde2')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
  cd "$pkgname-$pkgver"
  patch -Np1 -i ../"${pkgname}-0.10.1-install_type_hints.patch"
}

build() {
  cd "$pkgname-$pkgver"
  python3.8 -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="../build/lib/:${PYTHONPATH}"
  # disable useless tests
  pytest -v tests -k 'not test_invalid_tests and not test_valid_tests'
}

package() {
  cd "$pkgname-$pkgver"
  python3.8 -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"

  # Symlink license file
  local site_packages=$(python3.8 -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/$_name-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
