# Maintainer: Hans-Nikola Viessmann <hans AT viess DOT mn>
_name=eduvpn-common
pkgname="python-${_name/-/_}"
pkgver=1.1.0
pkgrel=1
pkgdesc='EduVPN common library for python clients'
arch=('x86_64')
url="https://github.com/eduvpn/eduvpn-common"
license=('MIT')
depends=('python')
makedepends=('go' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/releases/download/$pkgver/$_name-$pkgver.tar".{xz,xz.asc})
sha256sums=('7a2ea1157f6f840cd9fe73deb642524cfe93a93d55af4ca26d46866f4f953dc0'
            'SKIP')
validpgpkeys=('227FF3F8F829D9A9314D9EBA02BB8048BBFF222C')

build() {
  cd "$_name-$pkgver"

  # build the C shared library
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -tags=release"
  make

  # build wrapper
  cd wrappers/python
  make pack
}

package() {
  cd "$_name-$pkgver/wrappers/python"

  # install wrapper module
  PYTHONHASHSEED=0 /usr/bin/python -m installer --destdir="$pkgdir" dist/*.whl

  # other installs
  install -Dm644 ../../LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
