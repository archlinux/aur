_name=setuptools-golang
pkgname=python-$_name
pkgdesc="A setuptools extension for building cpython extensions written in golang."
pkgver=2.9.0
pkgrel=2
arch=(x86_64)
license=('MIT')
source=(git+https://github.com/asottile-archive/$_name#tag=v$pkgver)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest python-virtualenv go)
sha256sums=('39f41b2874d38d9570e372baf0510ff388d7e087c97c418e2d2e94ca39c0193e')

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

check(){
    cd $_name

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    pytest
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}
