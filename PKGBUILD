# Maintainer: Kostiantyn Kushnir <chpock@gmail.com>

pkgname=repowise
pkgver=0.60.1
pkgrel=1
pkgdesc='Codebase intelligence, CLI, MCP server and web dashboard for AI coding agents'
arch=('x86_64')
url='https://github.com/repowise-dev/repowise'
license=('AGPL-3.0-or-later')
depends=('python' 'git' 'sqlite' 'nodejs>=20' 'glibc' 'gcc-libs')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel' 'uv' 'npm' 'patchelf')
options=('!strip' '!debug')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'system-install.patch'
        'numpy-override.txt'
        'collect-web-licenses.py')
sha256sums=('b40084756ccb47a940e916774d72ba6b366d91c2431a3d6941964ddeb144ad99'
            'ab2496ba49c9f55eac941f70f392ba821e8747d677b809f1c7e936d55826799f'
            '38d150a56e1f1c4d011b91f167656e2093e872123d1dbb44ce6795bd985f2f74'
            'b8eb4bfabc15976ccac077c97a7d3be8b03edc52ff7636c8c6fd13d10d03deda')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/system-install.patch"
}

_needs_numpy_compat() {
  # A changed/split upstream lock must not inherit the old NumPy workaround.
  python - <<'PY'
import tomllib
with open('uv.lock', 'rb') as stream:
    lock = tomllib.load(stream)
versions = {p['version'] for p in lock['package'] if p['name'] == 'numpy'}
print('true' if versions == {'1.26.4'} else 'false')
PY
}

build() {
  cd "${pkgname}-${pkgver}"
  export UV_PYTHON_DOWNLOADS=never
  uv export --frozen --package repowise --no-default-groups --no-emit-workspace \
    --output-file "${srcdir}/runtime-requirements.txt" >/dev/null
  local overrides=()
  local needs_numpy_compat
  # Do not run the probe as an if-condition: inspection errors must stop the
  # build, not be mistaken for a valid answer that no override is needed.
  needs_numpy_compat=$(_needs_numpy_compat)
  # Only the documented old pin needs a compatibility exception. A newer upstream
  # lock must be used unchanged, so this workaround cannot silently override it.
  if [[ "$needs_numpy_compat" == true ]]; then
    overrides=(--overrides "${srcdir}/numpy-override.txt")
  fi
  uv venv --clear --relocatable --python /usr/bin/python "${srcdir}/runtime"
  uv pip install --python "${srcdir}/runtime/bin/python" --link-mode=copy \
    --require-hashes --only-binary=:all: "${overrides[@]}" \
    --requirement "${srcdir}/runtime-requirements.txt"
  python -m build --wheel --no-isolation

  export NEXT_TELEMETRY_DISABLED=1 NEXT_PUBLIC_REPOWISE_API_URL=''
  npm ci --workspace packages/web
  npm run build --workspace packages/web
}

check() {
  uv pip check --python "${srcdir}/runtime/bin/python"
  PYTHONDONTWRITEBYTECODE=1 "${srcdir}/runtime/bin/python" - <<'PY'
import numpy
import scipy
from tree_sitter import Language, Parser, Query, QueryCursor
import tree_sitter_cpp

assert numpy.array([1, 2]) @ numpy.array([3, 4]) == 11
language = Language(tree_sitter_cpp.language())
tree = Parser(language).parse(b'int value() { return 1; }')
query = Query(language, '(function_definition declarator: (function_declarator declarator: (identifier) @name)) @function')
matches = QueryCursor(query).matches(tree.root_node)
assert matches and matches[0][1]['name'][0].text == b'value'
PY
}

package() {
  cd "${pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/lib" "${pkgdir}/usr/bin"
  cp -a "${srcdir}/runtime" "${pkgdir}/usr/lib/repowise"
  # SciPy 1.17.1's wheel retains an unused RUNPATH into its build interpreter.
  # Remove only that exact path; other changes must still pass namcap. Drop this
  # fix when upstream wheels stop carrying it.
  local extension runpath
  for extension in "${pkgdir}"/usr/lib/repowise/lib/python*/site-packages/scipy/special/cython_special*.so; do
    [[ -f "$extension" ]] || continue
    runpath=$(patchelf --print-rpath "$extension")
    if [[ "$runpath" == /opt/_internal/cpython-3.14.0rc1/lib/python3.14/site-packages/scipy_openblas32/lib ]]; then
      patchelf --remove-rpath "$extension"
    fi
  done
  # The native installer writes final interpreter paths without recording the
  # temporary wheel location as an installation source.
  python - "${pkgdir}" dist/*.whl <<'PY'
import sys
import sysconfig
from installer import install
from installer.destinations import SchemeDictionaryDestination
from installer.sources import WheelFile

scheme = sysconfig.get_paths(vars={'base': '/usr/lib/repowise', 'platbase': '/usr/lib/repowise'})
destination = SchemeDictionaryDestination(
    scheme, interpreter='/usr/lib/repowise/bin/python', script_kind='posix',
    destdir=sys.argv[1], bytecode_optimization_levels=(),
)
with WheelFile.open(sys.argv[2]) as wheel:
    install(wheel, destination, additional_metadata={'INSTALLER': b'installer\n'})
PY
  local command
  for command in repowise repowise-augment repowise-rewrite; do
    ln -s "../lib/repowise/bin/${command}" "${pkgdir}/usr/bin/${command}"
  done

  local web="${srcdir}/${pkgname}-${pkgver}/packages/web"
  local standalone="${web}/.next/standalone"
  local destination="${pkgdir}/usr/lib/repowise/web"
  install -d "${destination}"
  cp -a "${standalone}/packages/web/server.js" "${destination}/"
  cp -a "${standalone}/packages/web/.next" "${destination}/"
  cp -a "${web}/.next/static" "${destination}/.next/"
  cp -a "${web}/public" "${destination}/"
  cp -a "${standalone}/node_modules" "${destination}/"
  cp -a "${standalone}/packages/web/node_modules/." "${destination}/node_modules/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Standalone tracing keeps executable dependencies but drops their notices.
  # Preserve the originals, including READMEs containing bundled-library licenses.
  python "${srcdir}/collect-web-licenses.py" "$PWD" "$destination" \
    "${pkgdir}/usr/share/licenses/${pkgname}/web"
}
