# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Shane Stone <shanewstone at gmail>

pkgname=proselint
_pkgname=${pkgname#python-}
pkgver=0.16.0
pkgrel=1
pkgdesc="A linter for prose"
arch=(any)
url="https://github.com/amperser/proselint"
license=(BSD-3-Clause)
depends=(
    python
    python-google-re2
)
makedepends=(
    python-build
    python-installer
    python-uv-build
    python-wheel
)
checkdepends=(
    python-hypothesis
    python-pytest
    python-rstr
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('5159b762e1c030637c8fde5baf20b930b7c1666c21c342ad27a37a1686466501')

_archive="$_pkgname-$pkgver"

prepare() {
    cd "$_archive"

    # Relax uv_build version pin to match the version packaged in Arch.
    sed -i -E 's/"uv_build[^"]*"/"uv_build"/' pyproject.toml
}

build() {
    cd "$_archive"

    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive"

    local site_packages
    site_packages=$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')
    python -m installer --destdir=tmp_install dist/*.whl
    PYTHONPATH="$PWD/tmp_install$site_packages" pytest
}

package() {
    cd "$_archive"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.md
}
