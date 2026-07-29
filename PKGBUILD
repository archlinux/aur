# Maintainer: Cashly Engineering <engineering@gocashly.io>

pkgname=cashlyctl-git
_pkgname=cashlyctl
pkgver=0.1.0
pkgrel=2
pkgdesc="Terminal operations console and CLI for Cashly/DealSense deployments"
arch=("any")
url="https://github.com/goCashly/cashlyctl"
license=("custom")
depends=(
  "python"
  "python-boto3"
  "python-pyfiglet"
  "python-textual"
  "python-typer"
)
makedepends=(
  "git"
  "python-build"
  "python-installer"
  "python-setuptools"
  "python-wheel"
)
provides=("cashlyctl")
conflicts=("cashlyctl")
source=("${_pkgname}::git+https://github.com/goCashly/cashlyctl.git#branch=main")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${_pkgname}"
  python - <<'PY'
import pathlib
import subprocess
import tomllib

version = tomllib.loads(pathlib.Path("pyproject.toml").read_text())["project"]["version"]
count = subprocess.check_output(["git", "rev-list", "--count", "HEAD"], text=True).strip()
short = subprocess.check_output(["git", "rev-parse", "--short=7", "HEAD"], text=True).strip()
print(f"{version}.r{count}.g{short}")
PY
}

build() {
  cd "$srcdir/${_pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm644 docs/cashlycrm-auth.md "$pkgdir/usr/share/doc/${pkgname}/cashlycrm-auth.md"
  install -Dm644 docs/docker.md "$pkgdir/usr/share/doc/${pkgname}/docker.md"
  install -Dm644 docs/global-hotkey-companion.md "$pkgdir/usr/share/doc/${pkgname}/global-hotkey-companion.md"
  install -Dm644 docs/native-linux.md "$pkgdir/usr/share/doc/${pkgname}/native-linux.md"
}
