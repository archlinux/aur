# Maintainer: <gonsolo@gmail.com>
pkgname=python-riscv-model
_pypiname=riscv-model
pkgver=0.6.6
pkgrel=1
pkgdesc="A Python model of the RISC-V ISA, intended for automated testing and verification."
arch=('any')
url="https://pypi.org/project/riscv-model/"
license=('MIT')
depends=('python')
makedepends=('python-pip' 'python-setuptools' 'python-wheel')
source=("$_pypiname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/r/$_pypiname/$_pypiname-$pkgver.tar.gz")
sha256sums=('dfff035b75ed36de33a99f95f1098697be308d4c7161a99407b82df22fd54d69')

build() {
  cd "$srcdir/$_pypiname-$pkgver"
  # Build the package wheel
  python -m build --wheel --no-isolation
}

package() {
  # 1. Ensure we are in the source directory where the 'dist' directory resides
  cd "$srcdir/$_pypiname-$pkgver"

  # 2. Find the exact wheel filename generated during the build step.
  # This makes the install command more reliable than using the package name + version.
  WHEEL_FILE=$(find dist -name 'riscv_model-*.whl' | head -n 1)

  # Check if the wheel file was found
  if [ -z "$WHEEL_FILE" ]; then
    echo "ERROR: Could not find the built wheel file in the dist directory."
    exit 1
  fi

  echo "Found wheel file: $WHEEL_FILE"
  
  # Install the package into the root directory for makepkg
  # We are now installing the specific file path of the wheel.
  PIP_CONFIG_FILE=/dev/null pip install \
    --isolated \
    --root="$pkgdir" \
    --ignore-installed \
    --no-deps \
    "$WHEEL_FILE"
  
  # Remove unwanted files like tests or build artifacts if they were copied
  find "$pkgdir" -depth \
    \( -name "__pycache__" -o -name "*.pyc" -o -name "*.pyo" \) \
    -exec rm -rf '{}' \;
}
