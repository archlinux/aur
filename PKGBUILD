# Maintainer:  <castix at autistici dot org>
pkgname=i3-workspace-names-daemon-git
pkgver=r89.4a7d2d6
pkgrel=1
pkgdesc="A daemon script to dynamically update workspace names in i3wm based on their content."
arch=('any')
url="https://github.com/i3-workspace-names-daemon/i3-workspace-names-daemon"
license=('MIT')
depends=('python-i3ipc' 'ttf-font-awesome')
optdepends=('pango')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('flake8' 'python-pytest' 'python-pytest-cov' 'python-pytest-randomly')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('i3wnd::git+https://github.com/i3-workspace-names-daemon/i3-workspace-names-daemon.git')
md5sums=('SKIP')

pkgver() {
  cd "i3wnd"
  
  # Git, tags available
  # printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

  # Git, no tags available
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # using PEP 517
  cd "i3wnd"
  python -m build --wheel --no-isolation
}

check() {
  cd "i3wnd"
  flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
  flake8 . --count --exit-zero --max-complexity=10 --max-line-length=127 --statistics
  pytest  # --cov=.  # commented because of https://github.com/nedbat/coveragepy/issues/861#issuecomment-1126986145
}

package() {
  cd "i3wnd"
  python -m installer --destdir="$pkgdir" --compile-bytecode=1 dist/*.whl
  # now you can python -m i3_workspace_names_daemon -v
  # since /usr/bin/i3-workspace-names-daemon  misses a argv[1:] while calling main and I don't find it wise to patch it

  mkdir -p "${pkgdir}/usr/share/licenses/i3-workspace-names-daemon-git"
  cp LICENSE "${pkgdir}/usr/share/licenses/i3-workspace-names-daemon-git/LICENSE"
}
