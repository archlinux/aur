# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pycxxfilt
_pkgname="${pkgname#python-}"
pkgver=1.2.0
pkgrel=1
pkgdesc="Demangle C++ symbols using LLVM's C++ ABI demangler"
arch=(x86_64 aarch64)
url="https://github.com/tiran/pycxxfilt"
license=(Apache-2.0)
depends=(glibc libgcc libgcc_s.so libstdc++ libstdc++.so python)
makedepends=(meson-python python-build python-installer python-vcs-versioning python-wheel)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7623b9310b04f78854a587e56f87e265d908f943221ffec94d229d3db6b31b5a')

build() {
    cd "$_pkgname-$pkgver"
    # no longer requires python-setuptools-scm but still needs this env variable
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation -Cbuild-dir=build
}

check() {
    cd "$_pkgname-$pkgver"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest -x
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

