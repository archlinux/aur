# Maintainer: rus364 <rus364@gmail.com>
pkgname=agent-box
pkgver=0.4.0
pkgrel=1
epoch=1
pkgdesc='Run coding agents in rootless Podman workspace boxes'
arch=('any')
url='https://github.com/rus364/agent-box'
license=('MIT')
depends=('python>=3.11' 'podman>=5' 'git')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('github-cli: forward GitHub authentication' 'tmux: detachable host sessions')
source=("agent_box_tool-0.4.0.tar.gz::$url/releases/download/v$pkgver/agent_box_tool-0.4.0.tar.gz")
sha256sums=('06c5a11670833fd1430bd6131d91f6cb165bd1971eff15a5fe31e4bdfe41f282')

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
