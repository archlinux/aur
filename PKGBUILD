# Maintainer: Kohei Wada <program3152019@gmail.com>
pkgname=taskdog
_pkgname=taskdog
pkgver=0.22.0
pkgrel=1
pkgdesc="Task management system with CLI/TUI and a REST API server (GTD, time tracking, schedule optimization)"
arch=('x86_64')
url="https://github.com/Kohei-Wada/taskdog"
license=('MIT')
depends=('python')
makedepends=('uv')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/Kohei-Wada/taskdog/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('ff66b405e2d855872b690a976c974d4677788f28debae30d170f2e6327420f6d')
options=('!strip')

_prefix=/usr/lib/taskdog

build() {
  # Run from $srcdir (not the source tree) so the repo's .python-version does
  # not pull a uv-managed interpreter — we want the system python.
  cd "$srcdir"

  # Bundled, relocatable venv on the system python so we don't have to map
  # every Python dep to an Arch package. taskdog's own 5 packages are built
  # from this tarball (non-editable); third-party deps come from PyPI.
  uv venv --clear --no-managed-python --python /usr/bin/python3 --relocatable venv
  UV_NO_INSTALLER_METADATA=1 \
  UV_NO_CACHE=1 \
  UV_LINK_MODE=copy \
  uv pip install --python "$srcdir/venv/bin/python" --no-editable \
    "$srcdir/$_pkgname-$pkgver/packages/taskdog-core" \
    "$srcdir/$_pkgname-$pkgver/packages/taskdog-client" \
    "$srcdir/$_pkgname-$pkgver/packages/taskdog-server" \
    "$srcdir/$_pkgname-$pkgver/packages/taskdog-ui" \
    "$srcdir/$_pkgname-$pkgver/packages/taskdog-mcp"

  # Ship precompiled bytecode so the read-only /usr install never recompiles at
  # runtime. unchecked-hash makes the .pyc trusted without source-mtime checks,
  # which is correct for an immutable system package.
  "$srcdir/venv/bin/python" -m compileall -q -f \
    --invalidation-mode unchecked-hash "$srcdir/venv/lib"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Ship the venv under /usr/lib/taskdog and expose the three entry points.
  install -dm755 "$pkgdir$_prefix"
  cp -a "$srcdir/venv/." "$pkgdir$_prefix/"

  install -dm755 "$pkgdir/usr/bin"
  local bin
  for bin in taskdog taskdog-server taskdog-mcp; do
    ln -s "$_prefix/bin/$bin" "$pkgdir/usr/bin/$bin"
  done

  # Systemd user service, with ExecStart pointed at the packaged binary.
  install -dm755 "$pkgdir/usr/lib/systemd/user"
  sed 's|%h/.local/bin/taskdog-server|/usr/bin/taskdog-server|' \
    contrib/systemd/taskdog-server.service \
    > "$pkgdir/usr/lib/systemd/user/taskdog-server.service"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
