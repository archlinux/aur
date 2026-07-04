# Maintainer: nanw <nanweisheng@gmail.com>

_name="oauth-cli-kit"
pkgname="python-${_name}"
pkgver=0.1.3
pkgrel=1
pkgdesc="Reusable OAuth 2.0 + PKCE helpers for CLI applications"
arch=('any')
url="https://github.com/pinhua33/oauth-cli-kit"
license=('MIT')
depends=(
  "python>=3.11"
  "python-httpx>=0.25.0"
  "python-platformdirs>=4.0.0"
)
makedepends=(
  "python-build"
  "python-hatchling"
  "python-hatch-vcs"
  "python-installer"
  "python-wheel"
)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/${_name/-/_}-$pkgver.tar.gz")
sha256sums=('6612b3dea1a97c4de4a7d3b828767d42f0a78eae93be56b90c55d3ab668ebfb8')

prepare() {
  cd "$srcdir/${_name/-/_}-$pkgver"
  # hatch-vcs reads version from git tags; patch to use static version since
  # we build from the PyPI sdist (no .git directory).
  sed -i 's/version = "vcs"/version = "'"$pkgver"'"/' pyproject.toml
}

build() {
  cd "$srcdir/${_name/-/_}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/${_name/-/_}-$pkgver"
  python -c "from oauth_cli_kit import OAuthProviderConfig, OAuthToken; print('import OK')"
}

package() {
  cd "$srcdir/${_name/-/_}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
