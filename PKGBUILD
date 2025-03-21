# Maintainer: redponike <proton (dot) me>
# Contributor: knedl1k <knedl1k At tuta Dot io>
# Contributor: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Andres Alejandro Navarro Alsina <aanavarroa@unal.edu.co>
# Contributor: GalSim developers team on GitHub

_base=GalSim
pkgname=python-${_base,,}
pkgver=2.7.1
pkgrel=1
pkgdesc="Modular galaxy image simulation toolkit"
arch=('x86_64')
url="https://github.com/${_base}-developers/${_base}"
license=('LicenseRef-GalSim')
depends=(python-astropy boost-libs eigen fftw python-coord)
makedepends=(python-build python-installer python-setuptools python-wheel pybind11 python-numpy)
checkdepends=(python-pytest python-scipy python-yaml python-pytest-timeout python-pytest-xdist)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha256sums=('48810642b820fd5497dca917292b462b22372af48df64031ffa1eb10b3728a4c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}

  # Create the virtual environment
  python -m venv --system-site-packages test-env
  source test-env/bin/activate

  # Install the wheel we just built
  test-env/bin/pip install dist/*.whl

  # Get the site-packages path
  site_packages=$(test-env/bin/python -c "import sysconfig; print(sysconfig.get_path('purelib'))")

  # Set LD_LIBRARY_PATH to locate the C extensions just compiled (_galsim*.so)
  export LD_LIBRARY_PATH="${site_packages}/galsim:$LD_LIBRARY_PATH"

  # Run tests in a an isolated directory outside the source tree
  _temp_dir=$(mktemp -d)

  # We need to copy (& follow symlinks) the examples/data folder along with demo6* files in examples
  # Copy the share folder as well for acs_I_unrot_sci_20_cf.fits
  cp -r "${srcdir}/${_base}-${pkgver}/tests" "$_temp_dir/"
  cp -rL "${srcdir}/${_base}-${pkgver}/examples" "$_temp_dir/"
  cp -r "${srcdir}/${_base}-${pkgver}/share" "$_temp_dir/"
  cd "$_temp_dir/tests"

  PYTHONPATH="$_temp_dir/tests" python -m pytest -vv --import-mode=importlib --ignore=devel/external .

  # Cleanup
  cd ../..
  rm -rf "$_temp_dir"
  deactivate
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
