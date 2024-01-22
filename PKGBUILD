# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Maintainer: rumpelsepp <stefan at rumpelsepp dot org>

pkgname=python-msgspec
_pkgname=${pkgname#python-}
pkgver=0.18.6
pkgrel=1
pkgdesc="A fast and friendly JSON/MessagePack library, with optional schema validation"
arch=(x86_64)
url="https://github.com/jcrist/msgspec"
license=("BSD-3-Clause")
depends=(
    "glibc"
    "python"
    "python-attrs"
    "python-typing-extensions"
)
makedepends=(
    "python-build"
    "python-installer"
    "python-setuptools"
    "python-wheel"
)
checkdepends=(
    "python-msgpack"
    "python-pytest"
)
optdepends=(
    "python-tomli-w: for TOML support"
    "python-tomli: for TOML support"
    "python-yaml: for YAML support"
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('893eab9c485331e90d137d0353afd39e5646656dabb7dc09bc1fecc134ffc3da')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"

    rm -rf tmp_install
    python -m installer --destdir=tmp_install dist/*.whl

    _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    export PYTHONPATH="$PWD/tmp_install/$_site_packages"
    pytest tests/
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
