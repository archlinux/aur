# Maintainer: Jax Young <jaxvanyang@gmail.com>

pkgname=pytype-git
_pkgname="${pkgname%-git}"
pkgver=2024.10.11.r71.g762b86d
pkgrel=1
pkgdesc='Static type analyzer for Python code'
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
	# 'python-typed-ast' # only for <3.8
)
makedepends=(
	'git'
	'python-build'
	'python-installer'
	'python-setuptools'
	'python-wheel'
	'pybind11'
)
conflicts=("$_pkgname")
provides=("$_pkgname")
source=(
	"git+https://github.com/google/$_pkgname.git"
	'git+https://github.com/python/typeshed.git'
	'git+https://github.com/google/googletest.git'
	'git+https://github.com/pybind/pybind11.git'
	'use-system-ninja.patch'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'd6caa9330aa1beea03279b631d47dd5e221c8e2b05d80b184404a443d5cae4dadf2ce1183fcdbc8cbda2b09efa9ce47b07a4e750a8e6581207c331fc0cad2691')

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "$_pkgname"

	# remove version constraints from setup.cfg
	sed -i -e '/[^ ]>=/s/>=.*//' -e '/[^ ]</s/<.*//' setup.cfg

	# use system ninja
	patch -p1 -i "$srcdir/use-system-ninja.patch"

	# patch pylintrc, will not be required in new release
	sed -i '43i \ \ line-too-long,' pylintrc

	# setup git submodules
	git submodule init
	git config submodule.typeshed.url "$srcdir/typeshed"
	git config submodule.googletest.url "$srcdir/googletest"
	# this package depends system pybind11, but also set it here for testing
	git config submodule.pybind11.url "$srcdir/pybind11"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$_pkgname"
	python -m build --wheel --no-isolation
}

# See https://github.com/google/pytype/blob/main/README.md
# Tests will always fail because it doesn't fully support Python 3.13+.
# check() {
# 	cd "$_pkgname"
# 	python build_scripts/run_tests.py -f -v
# 	python out/bin/pytype -j auto
# }

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
