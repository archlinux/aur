# Maintainer: Jack Kingsman <jack@jackkingsman.me>

pkgname=remoteterm-meshcore
# pkgver is rewritten by .github/workflows/publish-aur.yml on each release.
pkgver=3.17.1
pkgrel=1
pkgdesc='Web interface for MeshCore mesh radio networks'
arch=(x86_64 aarch64)
url='https://github.com/jkingsman/Remote-Terminal-for-MeshCore'
license=('MIT')
# No system python dependency — we bundle a standalone interpreter via
# python-build-standalone so the package is immune to Arch python ABI bumps.
depends=(glibc)
makedepends=(uv nodejs npm)
optdepends=('bluez: BLE transport support')
backup=(etc/remoteterm-meshcore/remoteterm.env)
# The bundled python-build-standalone binary ships pre-stripped. makepkg's
# default strip pass corrupts its unusual ELF layout (.dynstr not in segment),
# so we disable stripping for the whole package.
options=(!strip)
install=remoteterm-meshcore.install
source=(
  "$pkgname-$pkgver.tar.gz::https://github.com/jkingsman/Remote-Terminal-for-MeshCore/archive/refs/tags/$pkgver.tar.gz"
  "remoteterm-meshcore.service"
  "remoteterm.env"
  "remoteterm-meshcore.sysusers"
  "remoteterm-meshcore.tmpfiles"
)
# sha256sums are recomputed by `updpkgsums` in the publish workflow before
# the PKGBUILD is pushed to AUR. The committed values are intentionally SKIP
# so the file is honest about not tracking real hashes in this repo.
sha256sums=('e0465267acf8c44c0a3d2459e01838c6c7c631890cdabe52d2d9f21170a33cfe'
            'd65dc4d60776ecf3798591c44d8ead1e8da81ae947a99dfac2893d9b6ffac794'
            '8f325dc1b5b0eec76762dcd8e168e10975c60b0e4688346bf18aa15af3e704e7'
            '00660554138d26f2a362b8b3a7c091e61ed9b27f5118eed009c1176c9b1dc0c2'
            '3a032d83a00f3d249273a433e8bb69bafaf58371c5080c1ee0cf1d7d3315455c')
sha256sums_x86_64=('a1dbc39f9c7b7d4ff3074fa18de66714c4e4400643bd657894a65803b0362a92')
sha256sums_aarch64=('f06466ac56cdc185d61190ea89f9c4e84ff4fc03ac08793151970a1fea86410b')

# python-build-standalone: stripped install_only builds (~30 MB each).
# Bump _pyver and _pybuilddate when updating the bundled interpreter.
_pyver=3.13.13
_pybuilddate=20260408

source_x86_64=("python-${_pyver}-x86_64.tar.gz::https://github.com/astral-sh/python-build-standalone/releases/download/${_pybuilddate}/cpython-${_pyver}+${_pybuilddate}-x86_64-unknown-linux-gnu-install_only_stripped.tar.gz")

source_aarch64=("python-${_pyver}-aarch64.tar.gz::https://github.com/astral-sh/python-build-standalone/releases/download/${_pybuilddate}/cpython-${_pyver}+${_pybuilddate}-aarch64-unknown-linux-gnu-install_only_stripped.tar.gz")

_srcname="Remote-Terminal-for-MeshCore-$pkgver"

build() {
  cd "$_srcname"

  # Build frontend
  cd frontend
  npm ci
  npm run build
  cd ..

  # Create venv using the bundled standalone Python interpreter, then install
  # Python dependencies into it. This produces a fully self-contained venv
  # that does not reference the system Python at all.
  uv venv --python "$srcdir/python/bin/python3" .venv
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

  # Bundled Python interpreter
  cp -a "$srcdir/python" "$_instdir/python"

  # Python venv
  cp -a .venv "$_instdir/"

  # Fix shebangs and venv config: replace build-time paths with final
  # install paths so the venv works from /opt after installation.
  # sed only operates on regular file contents, so symlinks need separate
  # fixup below.
  find "$_instdir/.venv/bin" -type f -exec \
    sed -i "s|$srcdir/$_srcname/.venv|$_optdir/.venv|g" {} +
  find "$_instdir/.venv/bin" -type f -exec \
    sed -i "s|$srcdir/python|$_optdir/python|g" {} +
  sed -i \
    -e "s|$srcdir/$_srcname/.venv|$_optdir/.venv|g" \
    -e "s|$srcdir/python|$_optdir/python|g" \
    "$_instdir/.venv/pyvenv.cfg" 2>/dev/null || true

  # Recreate the venv interpreter symlinks — these are symlinks (not files),
  # so sed cannot fix them. Point them at the bundled Python.
  ln -sf "$_optdir/python/bin/python3" "$_instdir/.venv/bin/python"
  ln -sf python "$_instdir/.venv/bin/python3"
  ln -sf python "$_instdir/.venv/bin/python3.13"

  # Data directory symlink
  ln -s /var/lib/remoteterm-meshcore "$_instdir/data"

  # Systemd service
  install -Dm644 "$srcdir/remoteterm-meshcore.service" \
    "$pkgdir/usr/lib/systemd/system/remoteterm-meshcore.service"

  # Environment file
  install -Dm640 "$srcdir/remoteterm.env" \
    "$pkgdir/etc/remoteterm-meshcore/remoteterm.env"

  # System user and data directory
  install -Dm644 "$srcdir/remoteterm-meshcore.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/remoteterm-meshcore.conf"
  install -Dm644 "$srcdir/remoteterm-meshcore.tmpfiles" \
    "$pkgdir/usr/lib/tmpfiles.d/remoteterm-meshcore.conf"

  # License
  install -Dm644 LICENSE.md \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
