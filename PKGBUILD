# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
pkgname=python-elf_diff
_name="${pkgname#python-}"
pkgver=0.7.1
pkgrel=2
pkgdesc="A tool to compare elf binaries"
arch=('any')
url="https://github.com/noseglasses/elf_diff"
license=('GPL3')
depends=('python-setuptools-git' 'python-jinja' 'python-yaml' 'python-progressbar'
         'python-gitpython' 'python-weasyprint' 'python-anytree' 'python-dict2xml'
         'python-defusedxml')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
checkdepends=('python-deepdiff' 'python-beautifulsoup4' 'python-html5lib' 'python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/noseglasses/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4804965976f87a79084268a5d851c1ccad4ee2265a3384b8288913b703916c66')

prepare() {
  cd "${_name}-${pkgver}"

  cat > tests/conftest.py <<EOF
from elf_diff_test import module_search_path, elf_diff_execution
module_search_path.addDevelElfDiffModuleSearchPath()
elf_diff_execution.useElfDiffFromDevelopmentTree(use_code_coverage=False)
EOF

  sed -i 's/\(ARM_BIN_PREFIX = \)"arm-linux-gnueabi-"/\1"arm-none-eabi-"/' \
    tests/test_cases/test_command_line_args.py

  cat >> setup.cfg <<EOF

[options.entry_points]
console_scripts =
  elf_diff = elf_diff.__main__:main
EOF
}

build() {
  cd "${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${_name}-${pkgver}/tests"

  declare pytest_opts=( --ignore 'test_cases/test_document_integrity.py' )

  if ! command -v arm-none-eabi-objdump >/dev/null 2>&1; then
    # This test requires an ARM GCC toolchain to be installed
    pytest_opts+=( -k 'not test_bin_prefix1' )
  fi

  # Plugin autoloading is disabled because the tests fail if run in parallel by python-xdist
  PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 pytest --verbose test_cases/ "${pytest_opts[@]}"
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
