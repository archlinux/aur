# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: ValHue <vhuelamo at gmail dot com>
# Contributor: korjjj <korjjj+aur[at]gmail[dot]com>

_name="ws4py"
pkgname="python-${_name}"
pkgver=0.5.1
pkgrel=2
pkgdesc="WebSocket client and server library for Python"
url="https://github.com/Lawouach/WebSocket-for-Python"
license=("BSD")
arch=("any")
depends=("python")
makedepends=("python-build" "python-installer" "python-wheel" "python-setuptools")
provides=("$_name" "$pkgname")
source=("$_name-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('31db304800f0d3da61dc4c1a3381a8fcfcfa8f16b36d916311cc32f1d294c9f7b3627dac673edf824f529f485f825ca418ab1e1a8a2fda5583c6a6a1bd9b752c')

prepare(){
 cd "WebSocket-for-Python-$pkgver"
 # installation warning
 sed -i "setup.py" \
     -e "s|distutils|setuptools|g"
 # https://github.com/Lawouach/WebSocket-for-Python/issues/250
 IFS=$'\n' fileList=($(grep -rnl "asyncio.async"))
 for file in "${fileList[@]}"; do
  sed -i "$file" \
      -e "s|asyncio.async|asyncio.ensure_future|g"
 done
}

build(){
 cd "WebSocket-for-Python-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "WebSocket-for-Python-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim:set ts=4 sw=4 ft=sh et:
