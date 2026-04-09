# Maintainer: sandwich <sandwich@archworks.co>

pkgname=remoteterm-meshcore
pkgver=3.9.0
pkgrel=1
pkgdesc='Web interface for MeshCore mesh radio networks'
arch=(x86_64 aarch64)
url='https://github.com/jkingsman/Remote-Terminal-for-MeshCore'
license=('MIT')
depends=(python)
makedepends=(uv nodejs npm)
backup=(etc/remoteterm-meshcore/remoteterm.env)
install=remoteterm-meshcore.install
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/jkingsman/Remote-Terminal-for-MeshCore/archive/refs/tags/$pkgver.tar.gz"
  "remoteterm-meshcore.service"
  "remoteterm.env"
)
sha256sums=('0574461dc7df4f19d5b4e64125565cf7ab1f8d1a1df67f80cd0f8ca3bb270e04'
            'd65dc4d60776ecf3798591c44d8ead1e8da81ae947a99dfac2893d9b6ffac794'
            'da49e9da23df743b4ba2465e3cc0e87d8d7be21820d3ce3fc55918a33cb407cc')

_srcname="Remote-Terminal-for-MeshCore-$pkgver"

build() {
  cd "$_srcname"

  # Build frontend
  cd frontend
  npm install
  npm run build
  cd ..

  # Create venv and install Python dependencies
  uv sync --no-dev --frozen
}

package() {
  cd "$_srcname"

  local _optdir=/opt/remoteterm-meshcore
  local _instdir="$pkgdir$_optdir"

  # App source
  install -d "$_instdir"
  cp -r app "$_instdir/"
  cp pyproject.toml uv.lock "$_instdir/"

  # Frontend build
  install -d "$_instdir/frontend"
  cp -r frontend/dist "$_instdir/frontend/"

  # Python venv
  cp -a .venv "$_instdir/"

  # Fix shebangs: replace build path with final install path
  find "$_instdir/.venv/bin" -type f -exec \
    sed -i "s|$srcdir/$_srcname/.venv|$_optdir/.venv|g" {} +
  sed -i "s|$srcdir/$_srcname/.venv|$_optdir/.venv|g" \
    "$_instdir/.venv/pyvenv.cfg" 2>/dev/null || true

  # Data directory symlink
  ln -s /var/lib/remoteterm-meshcore "$_instdir/data"

  # Systemd service
  install -Dm644 "$srcdir/remoteterm-meshcore.service" \
    "$pkgdir/usr/lib/systemd/system/remoteterm-meshcore.service"

  # Environment file
  install -Dm640 "$srcdir/remoteterm.env" \
    "$pkgdir/etc/remoteterm-meshcore/remoteterm.env"

  # License
  install -Dm644 LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
