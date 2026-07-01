# Maintainer: Brian Thompson <brianrobt@pm.me>
# Contributor: Yacob Zitouni <yacob.zitouni@gmail.com>

pkgname=python-jproperties
pkgver=2.1.2
pkgrel=2
pkgdesc='Java Property file parser and writer for Python'
license=('BSD-3-Clause AND PSF-2.0')
arch=('any')
url='https://github.com/Tblue/python-jproperties'
depends=(python python-six)
makedepends=(git python-build python-installer python-wheel python-setuptools
    python-setuptools-scm)
# checkdepends=(python-pytest python-pytest-datadir)
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('5cf124658fc7259ec751f75195a96e41955331024b6696df0cfc796a34624dd6')
validpgpkeys=(B67BD719C23DC2A403E15EB102DE477F6DDE8B17)

prepare() {
    cd "$pkgname"
    sed -i '/setuptools_scm/s/~=/>=/' setup.py
}

build() {
    cd "$pkgname"
    SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver" python -m build --wheel --no-isolation
}

# check() {
#     cd "$pkgname"
#     python -m venv --system-site-packages test-env
#     test-env/bin/python -m installer dist/*.whl
#     test-env/bin/python -P -m pytest -x -o addopts=""
# }

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local _site=$(python -c 'import site; print(site.getsitepackages()[0])')
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$_site/jproperties-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
