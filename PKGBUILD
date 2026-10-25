# Maintainer: aarto <aarto@aur.archlinux.org>
pkgname=python-mcap
pkgver=1.6.0
pkgrel=1
pkgdesc='Python library for reading and writing MCAP files'
arch=('any')
url='https://github.com/foxglove/mcap'
license=('MIT')
depends=('python' 'python-lz4' 'python-zstandard')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-pytest')
_tag="releases/python/mcap/v$pkgver"
_lfs="https://media.githubusercontent.com/media/foxglove/mcap/$_tag"
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz"
	"$pkgname-$pkgver-demo.mcap::$_lfs/testdata/mcap/demo.mcap"
	"$pkgname-$pkgver-OneMessage.mcap::$_lfs/tests/conformance/data/OneMessage/OneMessage.mcap")
b2sums=('6faec139716f9a4c44e06102961cb4292ade9d02fcf88706d2e57e9631969f9bde258ec29b0973473f27329a307d6a33b3606fde4aaae2b2d6a6373e246d7e2a'
	'4e28ccbed540e377e63e2705ae9a48469b89107ea966267f0d3c372889633953cf33982c25f3b8e035904716302109313fb5436fcf900a1b53fcaa1734668077'
	'f1b15ce171c25804eef403e124c4d933e2c25e1260d2eb9c389760d06a1ebc8a2852aca4501c05169763a39e2cf49ba47e38b0929c26b1269ba30cb429fd82bb')
_srcroot="mcap-releases-python-mcap-v$pkgver"

prepare() {
	cd "$_srcroot"
	# The GitHub archive ships Git LFS pointers for test data, swap in the real objects
	cp "$srcdir/$pkgname-$pkgver-demo.mcap" testdata/mcap/demo.mcap
	cp "$srcdir/$pkgname-$pkgver-OneMessage.mcap" tests/conformance/data/OneMessage/OneMessage.mcap
}

build() {
	cd "$_srcroot/python/mcap"
	# TODO: two upstream setuptools warnings, both cosmetic. Still present on main as of 2026-10-23.
	#  * "File '.../python/mcap/README.md' cannot be found": setup.cfg sets
	#    long_description = file: README.md, but upstream never added a README to
	#    python/mcap (the mcap-*-support siblings each have one). The wheel gets an
	#    empty description, same as the 1.6.0 release on PyPI.
	#  * "License classifiers are deprecated": newer setuptools (PEP 639) wants an
	#    SPDX license expression in setup.cfg instead of the
	#    "License :: OSI Approved :: MIT License" classifier.
	python -m build --wheel --no-isolation
}

check() {
	# TODO: 4 upstream test warnings, harmless. tests/test_reader.py pipe fixture
	# closes raw fds behind os.fdopen() objects (EBADF at GC, reported since
	# Python 3.13, upstream CI runs 3.10). test_explicit_time_range_bounds uses the
	# deprecated start_time on purpose without pytest.warns().
	cd "$_srcroot/python/mcap"
	python -m pytest tests
}

package() {
	# TODO: namcap warns "Referenced python module 'mcap.opcode.Opcode' is an
	# uninstalled dependency" for mcap/exceptions.py. False positive.
	# exceptions.py is the only module importing its own package absolutely
	# (from mcap.opcode import Opcode), every other module uses relative imports,
	# which namcap does not flag. namcap checks the dotted name mcap.opcode.Opcode,
	# and Opcode is a class, not a module, so no file in this package matches it.
	# Goes away if upstream switches to "from .opcode import Opcode".
	cd "$_srcroot"
	python -m installer --destdir="$pkgdir" python/mcap/dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
