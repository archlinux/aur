# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=python-tree-sitter-language-pack
_gitpkgname=tree-sitter-language-pack
pkgver=0.13.0
pkgrel=1
pkgdesc='Comprehensive collection of tree-sitter languages'
arch=('x86_64')
url='https://github.com/kreuzberg-dev/tree-sitter-language-pack'
license=(
  'Apache-2.0'
  'BSD-2-Clause'
  'BSD-3-Clause'
  'CC0-1.0'
  'ISC'
  'MIT'
  'MPL-2.0'
  'Unlicense'
  'WTFPL'
)
depends=(
  'glibc'
  'python'
  'python-tree-sitter'
  'python-tree-sitter-c-sharp'
  'python-tree-sitter-embedded-template'
  'python-tree-sitter-yaml'
)
makedepends=(
  'cython'
  'nodejs'
  'python-anyio'
  'python-build'
  'python-gitpython'
  'python-installer'
  'python-pyproject-patcher'
  'python-setuptools'
  'python-typing_extensions'
  'python-wheel'
  'tree-sitter'
  'tree-sitter-cli'
)
checkdepends=(
  'python-pytest'
)

source=(
  "${_gitpkgname}-${pkgver}.tar.gz::https://github.com/kreuzberg-dev/tree-sitter-language-pack/archive/v${pkgver}.tar.gz"
)

sha512sums=('d01338ef291eb34d72e8290916c094712e2e128c3340a3fa95ee141415f0d5937d500de1a96bfcade1533bf4d70df00652a585fc3e115bcca0513454d323d086')

prepare() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Stripping overly strict version requirements'
  python << 'EOF'
from pyproject_patcher import patch_in_place
with patch_in_place('pyproject.toml') as toml:
    toml.build_system_requires.strip_constraint('setuptools')
    toml.build_system_requires.strip_constraint('typing-extensions')
EOF

  echo >&2 'Downloading and building vendored parsers'
  mkdir parsers
  python scripts/clone_vendors.py
}

build() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Building wheel'
  python -m build --wheel --no-isolation
}

check() {
  cd "${_gitpkgname}-${pkgver}"
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  # Run tests from a working directory other than the source tree.
  # The source tree would shadow the `.tree_sitter_language_pack.bindings`
  # package in the installed wheel. The modules inside that package were
  # only generated during the build, so only the wheel has them.
  echo >&2 'Running unit tests'
  env -C "$(mktemp -d)" "$(pwd)/test-env/bin/python" -m \
    pytest --import-mode=append "$(pwd)/tests"
}

package() {
  cd "${_gitpkgname}-${pkgver}"

  echo >&2 'Packaging the wheel'
  python -I -m installer --destdir="${pkgdir}" dist/*.whl

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" \
    README.md

  echo >&2 'Packaging licenses'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
  find vendor -name 'LICENSE*' -exec \
    install -D -m 644 -T '{}' "${pkgdir}/usr/share/licenses/${pkgname}/{}" \
    ';'
}
