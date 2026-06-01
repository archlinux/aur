# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-crewai-core
_pkgname=crewai_core
pkgver=1.14.6
pkgrel=1
pkgdesc="Shared utilities for CrewAI: version, paths, user-data, telemetry, printer"
arch=('any')
url="https://github.com/crewAIInc/crewAI"
license=('MIT')
depends=(
    'python'
    'python-appdirs'
    'python-cryptography'
    'python-httpx'
    'python-packaging'
    'python-portalocker'
    'python-pyjwt'
    'python-pydantic'
    'python-rich'
    'python-opentelemetry-api'
    'python-opentelemetry-sdk'
    'python-opentelemetry-exporter-otlp-proto-http'
    'python-tomli'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/c/crewai-core/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/crewAIInc/crewAI/main/LICENSE")
sha256sums=('9eee3c82d29c9e812303659200ee6af9c6f43f5ff2c3cb6d7cc3b2ba371b44e1'
            'febc00dc5a0557ca8afbcdc6d3896731dc42f4cecabd87e6c98326212f8dbf36')

prepare() {
    cd "$_pkgname-$pkgver"
    # Allow Python 3.14 (Arch ships 3.14); upstream caps at <3.14 for no code reason.
    sed -i 's/requires-python = ">=3.10, <3.14"/requires-python = ">=3.10"/' pyproject.toml
    # Relax overly strict version pins for Arch's rolling-release versions.
    # pydantic: Arch ships 2.13.x which violates the upstream <2.13 cap; 2.13 is compatible.
    sed -i 's/pydantic>=2.11.9,<2.13/pydantic>=2.11.9,<3/' pyproject.toml
    # portalocker: AUR ships 3.x; no API breaks relevant here.
    sed -i 's/portalocker~=2.7.0/portalocker>=2.7.0/' pyproject.toml
    # Relax minor "~=" pins where Arch is newer than the implied upper bound.
    sed -i 's/appdirs~=1.4.4/appdirs>=1.4.4/' pyproject.toml
    sed -i 's/httpx~=0.28.1/httpx>=0.28.1/' pyproject.toml
    sed -i 's/tomli~=2.0.2/tomli>=2.0.2/' pyproject.toml
    # opentelemetry: compatible within 1.x.
    sed -i 's/opentelemetry-api~=1.34.0/opentelemetry-api>=1.34.0/' pyproject.toml
    sed -i 's/opentelemetry-sdk~=1.34.0/opentelemetry-sdk>=1.34.0/' pyproject.toml
    sed -i 's/opentelemetry-exporter-otlp-proto-http~=1.34.0/opentelemetry-exporter-otlp-proto-http>=1.34.0/' pyproject.toml
}

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_pkgname-$pkgver"
    rm -rf "$srcdir/test-install"
    python -m installer --destdir="$srcdir/test-install" dist/*.whl
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
    PYTHONPATH="$srcdir/test-install$site_packages:$PYTHONPATH" python -c "
import crewai_core
print(f'crewai_core {crewai_core.__version__} imported successfully')
"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
