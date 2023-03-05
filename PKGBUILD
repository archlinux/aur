# Maintainer: Hans-Nikola Viessmann <hans AT viess DOT mn>
_name=eduvpn-common
pkgname="python-${_name/-/_}"
pkgver=1.0.0
pkgrel=2
pkgdesc='EduVPN common library for python clients'
arch=('x86_64')
url="https://github.com/eduvpn/eduvpn-common"
license=('MIT')
depends=('python')
makedepends=('go' 'python-build' 'python-installer')
source=("$url/releases/download/$pkgver/$_name-$pkgver.tar.xz")
sha256sums=('9f26c11b0c8f6bec7443c96b3c177786ab6156313d540a6f3ab97d69aa84ee4e')

build() {
  cd "$_name-$pkgver"

  # build the C shared library
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
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
