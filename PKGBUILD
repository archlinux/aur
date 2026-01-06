# Maintainer: Dmytro Meleshko <qzlgeb.zryrfuxb@tznvy.pbz(rot13)>
pkgname=python-elf_diff
_name="${pkgname#python-}"
pkgver=0.7.1
pkgrel=1
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

  sed -i 's/\(ELF_DIFF_START: List\[str\] = \)\[\]/\1[sys.executable, "-m", "elf_diff"]/' \
    tests/elf_diff_test/elf_diff_execution.py
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
  cd "${_name}-${pkgver}"
  local pytest_opts=(
    -o pythonpath='src tests'
    --ignore 'tests/test_cases/test_document_integrity.py'
  )
  if ! command -v arm-none-eabi-objdump >/dev/null 2>&1; then
    pytest_opts+=( -k 'not test_bin_prefix1' )  # This test requires an ARM GCC toolchain to be installed
  fi
  # Plugin autoloading is disabled because the tests fail if run in parallel by python-xdist
  PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 pytest --verbose tests/test_cases/ "${pytest_opts[@]}"
}

package() {
  cd "${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
