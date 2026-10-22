# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=aiocarbon
pkgname=python-$_name
pkgver=0.15.3
pkgrel=1
pkgdesc='Asynchronous client for carbon.'
arch=('any')
url='https://github.com/mosquito/aiocarbon'
license=('Apache-2.0')
depends=('python'
         'python-immutables')
makedepends=('python-setuptools'
             'python-build'
             'python-installer')
checkdepends=('python-pytest-asyncio'
              'python-pytest')
_commit=149771d99d4417cc704bbf6bed29022c89d7d960
source=("$_name-$pkgver.tar.gz::$url/archive/$_commit.tar.gz"
        "python310-loop-argument.patch")
sha256sums=('8c09a2864f3a2d36ce73591ecef06ef0617425a800e8a46985937d355b5199d0'
            '8ecf8a5c8cfafbc96a40087776d4603b0597c5b4e0f27cb6c175526caea57833')

prepare() {
  cd "$_name-$_commit"
  # Set the version of the PyPI release, which upstream never committed
  sed -i "s/^version_info = .*/version_info = (${pkgver//./, })/" $_name/version.py
  # Drop the loop arguments removed from asyncio in Python 3.10 and use the running loop in the tests
  patch -Np1 -i ../python310-loop-argument.patch
}

build() {
  cd "$_name-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$_name-$_commit"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" tests
}

package() {
  cd "$_name-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
