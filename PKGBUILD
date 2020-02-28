# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=python-mypy_protobuf-git
_name=mypy-protobuf
pkgver=v1.13.r32.gf2a078b
pkgrel=2
pkgdesc="Generate mypy stub files from protobuf specs"
arch=(any)
url="https://github.com/dropbox/mypy-protobuf"
license=('Apache')
depends=('python-setuptools' 'python-protobuf' 'python-six')
makedepends=('git')
checkdepends=('python-pytest')
source=("git+https://github.com/dropbox/mypy-protobuf")
sha256sums=('SKIP')

pkgver() {
	cd "$_name"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_name/python"
	python setup.py build
}

check() {
	cd "$_name"

	# `protoc --mypy_out` requires `protoc-gen-mypy` to be on PATH, but this script is only created
	# during `setup.py install`. Fake it by just linking it to the main python file.
	mkdir temp
	ln -s ../python/mypy_protobuf.py temp/protoc-gen-mypy
	chmod +x temp/protoc-gen-mypy

	PATH="$PATH:temp" protoc --python_out=. --mypy_out=. --proto_path=proto/ $(find proto/test -name "*.proto")
	pytest
}

package() {
	cd "$_name/python"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
