# Maintainer: Young <young@localhost>
#
# simpleEMS pins its whole dependency stack exactly (numpy 2.4.4, cadquery 2.8.0 ->
# cadquery-ocp 7.9.3.1, pyvista 0.48.4, pyqt6 6.10.1, ...) and several of those are
# not packaged for Arch at all (cadquery, gmsh packaging, pysmithchart, pyvistaqt).
# cadquery-ocp 7.9.3.1 ships no CPython 3.14 wheels either, so the app cannot run on
# the system Python. It is therefore packaged as an isolated install: a managed
# CPython 3.13 plus a venv created from upstream's uv.lock, both under /opt/simpleems.
# Nothing outside /opt/simpleems and /usr/bin/simpleems is touched.

pkgname=simpleems
_pkgname=simpleEMS
pkgver=0.4.0
pkgrel=1
install=$pkgname.install
pkgdesc="Framework on top of openEMS for designing and simulating antennas, filters, couplers and other RF/microwave structures"
# x86_64 only: the pinned gmsh 4.14.1 publishes wheels for macOS, Windows and
# manylinux_x86_64 only (no aarch64 Linux wheel, no sdist), so `uv sync --frozen`
# cannot resolve it on aarch64 and the build would fail there.
arch=('x86_64')
url="https://github.com/MohamoudAli12/simpleEMS"
license=('AGPL-3.0-or-later')
depends=(
  'glibc' 'gcc-libs'
  # shared objects the bundled Qt 6 / VTK / OCP wheels link against
  'brotli' 'bzip2' 'dbus' 'expat' 'fontconfig' 'freetype2' 'glib2' 'libffi'
  'libglvnd' 'libpng' 'libx11' 'libxau' 'libxcb' 'libxdmcp' 'libxkbcommon'
  'libxkbcommon-x11' 'pcre2' 'systemd-libs' 'wayland' 'xcb-util'
  'xcb-util-cursor' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil'
  'xcb-util-wm' 'zlib' 'zstd'
)
makedepends=('uv')
# note: the AUR `openems` package builds its Python bindings for the *system*
# Python, which this package's bundled 3.13 venv cannot load, so it is deliberately
# not listed here -- see the post-install message for the working setup.
optdepends=(
  'getdp: FEM solver backend (AUR, plain binary, works as-is)'
  'octave: openEMS post-processing helper scripts'
  'vulkan-icd-loader: GPU accelerated rendering'
)
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4856c5f34360f85c747f27d394d535b80ae9dcc13aebfa3b00f3cd07ea570ef1')
# the tree is made of prebuilt wheels; a debug-info pass over them is pure waste
options=('!debug')

_pyver=3.13          # minor version used for on-disk paths
_uvpython=3.13.18    # exact interpreter uv fetches, so rebuilds are reproducible
_optdir=/opt/$pkgname

build() {
  cd "$_pkgname-$pkgver"

  # Pin the interpreter to a uv-managed build: the system Python (3.14) has no
  # cadquery-ocp wheels, and only-managed keeps the result independent of whatever
  # python version Arch currently ships.
  export UV_PYTHON_INSTALL_DIR="$srcdir/uv-python"
  export UV_PYTHON_PREFERENCE=only-managed
  export UV_LINK_MODE=copy
  export UV_NO_PROGRESS=1
  # keep the wheel cache inside $srcdir: build chroots often have no writable $HOME
  export UV_CACHE_DIR="$srcdir/.uv-cache"

  uv sync --frozen --no-dev --no-editable --python "$_uvpython"
}

package() {
  cd "$_pkgname-$pkgver"

  install -d "$pkgdir$_optdir"

  local _pysrc _pyfull
  _pysrc=$(find "$srcdir/uv-python" -maxdepth 1 -type d -name "cpython-$_pyver.*" -print -quit)
  cp -a "$_pysrc" "$pkgdir$_optdir/python"

  _pyfull=$(basename "$_pysrc")
  _pyfull=${_pyfull#cpython-}
  _pyfull=${_pyfull%%-*}

  cp -a .venv "$pkgdir$_optdir/venv"

  # the venv was created against the build-time interpreter and build directory;
  # repoint it at the packaged copy so it is position independent
  ln -sfn ../../python/bin/python"$_pyver" "$pkgdir$_optdir/venv/bin/python"
  ln -sfn ../../python/bin/python"$_pyver" "$pkgdir$_optdir/venv/bin/python$_pyver"
  ln -sfn ../../python/bin/python"$_pyver" "$pkgdir$_optdir/venv/bin/python3"

  cat > "$pkgdir$_optdir/venv/pyvenv.cfg" <<EOF
home = $_optdir/python/bin
include-system-site-packages = false
version = $_pyfull
executable = $_optdir/python/bin/python$_pyver
command = $_optdir/python/bin/python$_pyver -m venv $_optdir/venv
EOF

  # the managed interpreter's sysconfig data is generated for the download
  # directory; point it at the packaged location instead
  find "$pkgdir$_optdir/python" -name '_sysconfigdata_*.py' \
    -exec sed -i "s|$_pysrc|$_optdir/python|g" {} +

  # pip-style metadata would otherwise record the build directory
  rm -f "$pkgdir$_optdir"/venv/lib/python"$_pyver"/site-packages/simpleems-*.dist-info/direct_url.json

  # activation helpers embed the build directory and are not needed here
  rm -f "$pkgdir$_optdir"/venv/bin/activate*

  # rewrite the absolute interpreter path baked into the console scripts
  local _f
  while IFS= read -r -d '' _f; do
    sed -i "1s|^#!.*python[0-9.]*\$|#!$_optdir/venv/bin/python|" "$_f"
  done < <(find "$pkgdir$_optdir/venv/bin" -maxdepth 1 -type f -print0)

  install -d "$pkgdir/usr/bin"
  ln -s "$_optdir/venv/bin/simpleems" "$pkgdir/usr/bin/simpleems"
}
