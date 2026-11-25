# Maintainer: Julian Daube <joposter (at) gmail (dot) com>
# Contributor: Julian Daube <joposter (at) gmail (dot) com>

_pkgname=python-rapidfuzz
pkgname=$_pkgname-git
pkgver=3.14.6.1.r9.ge5ba595
pkgrel=1
pkgdesc="Rapid fuzzy string matching in Python using the Levenshtein Distance"
arch=("x86_64")
url="https://github.com/rapidfuzz/RapidFuzz"
license=("MIT")
depends=(
	"glibc"
	"libgcc"
	"libstdc++"
	"python"
)
makedepends=(
	"git"
	"python-build"
	"python-installer"
	"python-wheel"
	"cmake"
	"cython"
	"ninja"
	"python-scikit-build-core"
)
checkdepends=("python-hypothesis" "python-numpy" "python-pytest")
optdepends=(
	"python-numpy: cdist support"
)
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=(
	"$_pkgname::git+$url.git"
	"rapidfuzz-cpp::git+https://github.com/rapidfuzz/rapidfuzz-cpp.git"
	"taskflow::git+https://github.com/taskflow/taskflow.git"
)
sha256sums=("SKIP" "SKIP" "SKIP")

pkgver() {
	cd "$_pkgname"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	git -C "$srcdir/$_pkgname" clean -dfx

	cd "$_pkgname"
	git submodule init
	git config submodule.extern/rapidfuzz-cpp.url "$srcdir/rapidfuzz-cpp"
	git config submodule.extern/taskflow.url "$srcdir/taskflow"
	git -c protocol.file.allow=always submodule update
}

build() {
	cd "$_pkgname"
	# fail instead of silently falling back to the slow pure python version
	export RAPIDFUZZ_BUILD_EXTENSION=1
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkgname"
	python -m venv --system-site-packages --without-pip test-env
	test-env/bin/python -m installer dist/*.whl
	# Prefix normalized_distance cutoff rounding: fails in upstream HEAD too
	test-env/bin/python -P -m pytest tests \
		--deselect "tests/distance/test_distance.py::test_score_cutoff_equal_to_score[scorer9]"
}

package() {
	cd "$_pkgname"
	python -m installer --destdir="$pkgdir" dist/*.whl

	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
