# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-crewai-cli
_pkgname=crewai_cli
pkgver=1.14.6
pkgrel=1
pkgdesc="CLI for CrewAI: scaffold, run, deploy and manage AI agent crews"
arch=('any')
url="https://github.com/crewAIInc/crewAI"
license=('MIT')
depends=(
    'python'
    'python-crewai-core'
    'python-click'
    'python-pydantic'
    'python-pydantic-settings'
    'python-appdirs'
    'python-cryptography'
    'python-httpx'
    'python-pyjwt'
    'python-rich'
    'python-tomli'
    'python-tomli-w'
    'python-packaging'
    'python-dotenv'
    'uv'
    'python-textual'
    'python-certifi'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-hatchling'
    'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::https://pypi.io/packages/source/c/crewai-cli/${_pkgname}-${pkgver}.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/crewAIInc/crewAI/main/LICENSE")
sha256sums=('f9d20bdd5aa48b41ff3a830794c3e5100b1bbf9555895b019d4b02984a986b91'
            'febc00dc5a0557ca8afbcdc6d3896731dc42f4cecabd87e6c98326212f8dbf36')

prepare() {
    cd "$_pkgname-$pkgver"
    # Allow Python 3.14 (Arch ships 3.14); upstream caps at <3.14 for no code reason.
    sed -i 's/requires-python = ">=3.10, <3.14"/requires-python = ">=3.10"/' pyproject.toml
    # Relax overly strict version pins for Arch's rolling-release versions.
    # pydantic: Arch ships 2.13.x which violates the upstream <2.13 cap; 2.13 is compatible.
    sed -i 's/pydantic>=2.11.9,<2.13/pydantic>=2.11.9,<3/' pyproject.toml
    # Relax minor "~=" pins where Arch is newer than the implied upper bound.
    sed -i 's/click~=8.1.7/click>=8.1.7,<9/' pyproject.toml
    sed -i 's/pydantic-settings~=2.10.1/pydantic-settings>=2.10.1,<3/' pyproject.toml
    sed -i 's/appdirs~=1.4.4/appdirs>=1.4.4/' pyproject.toml
    sed -i 's/httpx~=0.28.1/httpx>=0.28.1/' pyproject.toml
    sed -i 's/tomli~=2.0.2/tomli>=2.0.2/' pyproject.toml
    sed -i 's/tomli-w~=1.1.0/tomli-w>=1.1.0/' pyproject.toml
    sed -i 's/uv~=0.11.6/uv>=0.11.6,<0.12/' pyproject.toml
    # crewai-core is pinned exactly to this release; that matches our sibling package.
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
import crewai_cli
print(f'crewai_cli {crewai_cli.__version__} imported successfully')
"
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
