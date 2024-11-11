# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=pytype
pkgver=2024.10.11
pkgrel=1
pkgdesc='A static type analyzer for Python code'
arch=('x86_64' 'aarch64')
url='https://google.github.io/pytype/'
license=('MIT' 'Apache-2.0')
depends=(
	'python'
	'python-attrs'
	'python-importlab'
	'python-immutabledict'
	'python-jinja'
	'python-libcst'
	'python-networkx'
	'python-pycnite'
	'python-msgspec'
	'ninja'
	'python-pydot'
	'python-tabulate'
	'python-toml'
	'python-typing_extensions'
	'python-typed-ast' # only for <3.8
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
	'pybind11'
)
source=(
	"git+https://github.com/google/$pkgname.git#tag=$pkgver"
	'git+https://github.com/python/typeshed.git'
	'use-system-ninja.patch'
)
b2sums=('158aa531f8d72f5d3d3a5a1df72d4fa280cb2696771c0b3e67b4576fd80d37abc69a697d135123e3b225185612dbd3ed63916bcf0c2ccc7dfe9f75244544dc2b'
        'SKIP'
        '9954c685aefa9144af74e5389b0a9b1008c05a165befdcf0fa5f76550d465b1cc43b322b4fa576e5d2e65f2c539ef97546759d933ee4d8842f07efe9ef30ee43')

prepare() {
	cd "$pkgname"

	# use system ninja
	patch -p1 -i "$srcdir/use-system-ninja.patch"

	# patch pylintrc, will not be required in new release
	sed -i '43i \ \ line-too-long,' pylintrc

	# setup git submodules
	# only typeshed - rely on system pybind11
	git submodule init typeshed
	git config submodule.typeshed.url "$srcdir/typeshed"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$pkgname"
	python -m build --wheel --no-isolation
}

check() {
	cd "$pkgname"
	# disable for now
	# python build_scripts/run_tests.py -f -v
	python out/bin/pytype -j auto
}

package() {
	cd "$pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
