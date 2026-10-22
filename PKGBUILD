# Maintainer: rus364 <rus364@gmail.com>
pkgname=agent-box
pkgver=4.0.0
pkgrel=1
pkgdesc='Run coding agents in rootless Podman workspace boxes'
arch=('any')
url='https://github.com/rus364/agent-box'
license=('MIT')
depends=('python>=3.11' 'podman>=5' 'git')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('github-cli: forward GitHub authentication' 'tmux: detachable host sessions')
source=("agent_box_tool-4.0.0.tar.gz::$url/releases/download/v$pkgver/agent_box_tool-4.0.0.tar.gz")
sha256sums=('ab77586df1aac6690e98275a4f4f11ad167e9b535506bf105b104880c5fa1051')

prepare() {
  cd "agent_box_tool-$pkgver"
  # Older release archives need the same explicit package-data policy as upstream.
  python - <<'PY'
from pathlib import Path
import tomllib

path = Path('pyproject.toml')
text = path.read_text()
if 'include-package-data' not in tomllib.loads(text)['tool']['setuptools']:
    path.write_text('tool.setuptools.include-package-data = false\n' + text)
PY
}

build() {
  cd "agent_box_tool-$pkgver"
  # Keep backend progress out of installation output, but expose failed builds.
  if ! python -m build --wheel --no-isolation > "$srcdir/build.log" 2>&1; then
    cat "$srcdir/build.log" >&2
    return 1
  fi
}

package() {
  cd "agent_box_tool-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
