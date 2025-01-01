# Contributor:  Liam Timms <timms5000@gmail.com>
# Contributor: Frank Fishburn <frankthefishburn@gmail.com>

## Configuration

## Specify Matlab path (/opt/matlab/R* and /opt/spm12 will be auto-detected and latest one used if there are multiple)
#_MATLAB_DIR=
#_SPM_DIR=

pkgname=python-nipype
_name=${pkgname/python-/}
pkgver=1.9.2
pkgrel=1
pkgdesc='Neuroimaging in python pipelines and interfaces'
arch=('any')
url='https://github.com/nipy/nipype'
license=('Apache')
depends=('python-click' 'python-networkx' 'python-nibabel' 'python-numpy' 'python-packaging' 'python-prov' 'python-dateutil' 'python-scipy' 'python-simplejson' 'python-traits' 'python-filelock' 'python-etelemetry>=0.2.0' 'python-matplotlib' 'python-looseversion' 'python' 'python-setuptools' 'python-pandas')
makedepends=('python-numpydoc' 'python-sphinx' 'python-pytest' 'python-mock')
optdepends=('python-pybids' 'python-dipy' 'ants' '3dslicer' 'afni' 'freesurfer' 'fsl' 'spm12')
source=("${_name}-${pkgver}.tar.gz::https://github.com/nipy/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('c484d6d1ba99d8c2e641bcd611614ed57c33c6cb33ff78bfbe3b2be4474a16fd')

_setpaths(){

    # Try to auto-detect the matlab install directory
    if [ -z "${_MATLAB_DIR}" ]; then
      if [ -d "/opt/matlab" ]; then
        MATLABCMD=$(find /opt/matlab/R*/bin -mindepth 2 -maxdepth 2 -name MATLAB | sort | tail -n 1 )
      fi
    else
      MATLABCMD=$(find "${_MATLAB_DIR}"/bin -mindepth 2 -maxdepth 2 -name MATLAB | sort | tail -n 1 )
    fi
    if [ -z "${_SPM_DIR}" ]; then
      if [ -e "/opt/spm12" ]; then
        _SPM_DIR="/opt/spm12"
      fi
    fi
    if [ ! -z "${_SPM_DIR}" ]; then
      export MATLABCMD="${MATLABCMD} -sd ${_SPM_DIR}"
    else
      export MATLABCMD
    fi

}


build() {

    cd ${srcdir}/${_name}-${pkgver}

    _setpaths
    echo "MATLABCMD: ${MATLABCMD}"
    python setup.py build

}

#check() {
#
#    cd ${srcdir}/${_name}-${pkgver}
#
#    _setpaths
#    echo "MATLABCMD: ${MATLABCMD}"
#
#    pytest -v --doctest-modules nipype
#}

package() {

    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1

}

