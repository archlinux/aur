# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-pi-heif
_pkgname=pillow_heif
pkgver=1.4.0
pkgrel=1
pkgdesc="Python interface for libheif using the pi-heif namespace"
arch=('x86_64')
url="https://github.com/bigcat88/pillow_heif"
license=('BSD-3-Clause')
depends=(
  'python'
  'python-pillow'
  'libheif>=1.19'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-defusedxml'
  'python-numpy'
  'python-opencv'
  'python-packaging'
  'python-pytest'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/bigcat88/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0fe5b31902295029579e7e178fd64bef906dcb3a7c47519714638c2ff50ea4e4')

prepare() {
  cd "$_pkgname-$pkgver"

  # Copy pi-heif config and transform to pi_heif
  # Remove pre-existing pi_heif dir so the transform rename succeeds
  rm -rf pi_heif pi_heif.egg-info
  cp -r pi-heif/* .
  python .github/transform_to-pi_heif.py
}

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"

  # Return freed codec worker arenas to the kernel between repeated encodes.
  # Some RGBA round-trip cases intentionally encode eight variants in one
  # process, so the allocator defaults otherwise dominate the image data.
  export MALLOC_ARENA_MAX=2
  export MALLOC_TRIM_THRESHOLD_=131072

  local _site_packages
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_path("purelib").lstrip("/"))')"
  rm -rf "$srcdir/test-install"
  python -m installer --destdir="$srcdir/test-install" dist/*.whl

  # Arch's shared libheif exposes both HEIF and AVIF encoders, unlike either
  # of upstream's bundled pi-heif wheel flavours. Validate that distro-specific
  # feature set directly; the two wheel-flavour assertions then skip.
  PYTHONPATH="$srcdir/test-install/$_site_packages" \
    python -P -c 'import pi_heif; info = pi_heif.libheif_info(); assert info["HEIF"] and info["AVIF"] and info["encoders"] and info["decoders"]'

  # x265 sizes its default NUMA pools from the physical host rather than the
  # CPU affinity visible to makepkg. Bound those encoder pools for the tests;
  # explicit upstream encoder parameters are preserved and every encode still
  # goes through libheif/x265. This only affects the check process.
  cat > "$srcdir/_pi_heif_test_threads.py" <<'PY'
from pi_heif import misc

_original_init = misc.CtxEncode.__init__


def _bounded_init(self, compression_format, **kwargs):
    if compression_format == misc.HeifCompressionFormat.HEVC:
        enc_params = dict(kwargs.get("enc_params") or {})
        # Disable x265's host-sized NUMA pools entirely; frame-threaded
        # synchronous encoding is sufficient for these one-image checks.
        enc_params.setdefault("x265:pools", "none")
        enc_params.setdefault("x265:frame-threads", "1")
        enc_params.setdefault("x265:lookahead-threads", "0")
        enc_params.setdefault("x265:wpp", "0")
        # x265 4.2's threaded-me path regresses --pools=none by rebuilding
        # host-sized pools. Disable that independent motion-search pool for
        # these synchronous, single-frame test encodes.
        enc_params.setdefault("x265:threaded-me", "0")
        kwargs["enc_params"] = enc_params
    _original_init(self, compression_format, **kwargs)


misc.CtxEncode.__init__ = _bounded_init
PY

  cat > "$srcdir/_pi_heif_collect.py" <<'PY'
import os


def pytest_collection_finish(session):
    with open(os.environ["PI_HEIF_NODE_FILE"], "w", encoding="utf-8") as stream:
        for item in session.items:
            nodeid = item.nodeid.removeprefix("tests/")
            stream.write(f"{nodeid}\n")
PY

  # Run every transformed upstream test module against the built wheel.
  # Collect modules in fresh processes: with Python 3.14 and OpenCV 5, a
  # single aggregate collection retains tens of GiB before tests even start.
  # Pympler is a best-effort CI dependency upstream; its leak-tracker module
  # may skip when that AUR-only test helper is unavailable.
  local _test_file
  local _test_relative
  local -a _pytest_plugins
  local -a _test_nodes
  while IFS= read -r -d '' _test_file; do
    _test_relative=${_test_file#tests/}
    _pytest_plugins=(-p _pi_heif_test_threads)
    # This upstream test deliberately imports pi_heif with its C extension
    # hidden; importing the check-only plugin first would prime sys.modules.
    [[ ${_test_file##*/} == import_error_test.py ]] && _pytest_plugins=()
    if [[ $_test_relative == modes_test.py ]]; then
      # This parameterized module performs hundreds of independent libheif
      # decode/encode cycles. glibc/x265 retain worker arenas until process
      # exit, so run every collected upstream case in its own process. This
      # changes no test or parameter and keeps peak memory bounded on builders.
      rm -f "$srcdir/_pi_heif_nodes"
      if (
        cd tests
        PI_HEIF_NODE_FILE="$srcdir/_pi_heif_nodes" \
        PYTHONPATH="$srcdir:$PWD:$srcdir/test-install/$_site_packages" \
          python -P -m pytest "${_pytest_plugins[@]}" -p _pi_heif_collect \
            --color=no --collect-only -q --import-mode=importlib "$_test_relative"
      ); then
        :
      else
        local _collect_status=$?
        return "$_collect_status"
      fi
      mapfile -t _test_nodes < "$srcdir/_pi_heif_nodes"
      (( ${#_test_nodes[@]} > 0 ))
    else
      _test_nodes=("$_test_relative")
    fi
    local _test_node
    for _test_node in "${_test_nodes[@]}"; do
      if (
        cd tests
        PYTHONPATH="$srcdir:$PWD:$srcdir/test-install/$_site_packages" \
          python -P -m pytest "${_pytest_plugins[@]}" --import-mode=importlib "$_test_node"
      ); then
        :
      else
        local _pytest_status=$?
        # pytest exits 5 when an isolated module contains only skipped tests.
        # Preserve that upstream skip while propagating every real test error.
        (( _pytest_status == 5 )) || return "$_pytest_status"
      fi
    done
  done < <(find tests -type f -name '*_test.py' -print0 | sort -z)
}

package() {
  cd "$_pkgname-$pkgver"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
