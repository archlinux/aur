# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-stamina
pkgver=26.2.0
pkgrel=1
pkgdesc="Production-grade retries for Python"
arch=(any)
url="https://github.com/hynek/stamina"
license=(MIT)
depends=(python python-tenacity)
makedepends=(
    git
    openssh
    python-build
    python-hatchling
    python-hatch-fancy-pypi-readme
    python-hatch-vcs
    python-installer
    python-wheel)
checkdepends=(python-pytest python-anyio python-dirty-equals)
changelog=CHANGELOG.md
source=("$pkgname::git+$url#tag=$pkgver"
        hynek.keys)
sha256sums=('3aaf2fd9f5e61a841ea55986929a9e339d15bb2221aa42870221f81b6a5b6832'
            'f846ad74efb3f65ae1619540b598f8a9fbe00da43509281b4b0756a885263da8')

prepare() {
    git -C "$pkgname" -c gpg.ssh.allowedSignersFile="$srcdir/hynek.keys" verify-tag "$pkgver"
}

build() {
    export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
    cd "$pkgname"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname"
    python -m venv --system-site-packages test-env
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -P -m pytest
}

package() {
    cd "$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    install -d "$pkgdir/usr/share/licenses/$pkgname/"
    ln -s "$site_packages/stamina-$pkgver.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
