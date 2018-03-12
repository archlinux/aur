# Contributor: Frank Fishburn <frankthefishburn@gmail.com>
# Maintainer: Frank Fishburn <frankthefishburn@gmail.com>

## Configuration

## Specify Matlab path (/opt/matlab/R* and /opt/spm12 will be auto-detected and latest one used if there are multiple)
#_MATLAB_DIR=
#_SPM_DIR=

pkgname=python-nipype
_name=${pkgname/python-/}
pkgver=1.0.1
pkgrel=3
pkgdesc='Neuroimaging in python pipelines and interfaces'
arch=('any')
url='https://pypi.python.org/pypi/prov/'
license=('Apache')
depends=('python-numpy' 'python-numpydoc' 'python-scipy' 'python-networkx' 'python-traits' 'python-dateutil' 'python-nibabel' 'python-future' 'python-simplejson' 'python-prov' 'python-click' 'python-funcsigs' 'python-pytest' 'python-mock' 'python-pydotplus' 'python-pydot' 'python-packaging')
makedepends=('python-sphinx')
optdepends=('afni' 'freesurfer' 'fsl' 'spm12')
source=("https://github.com/nipy/${_name}/archive/${pkgver}.tar.gz")
sha256sums=('b06d1504e27cfdca51dcf3b821223b5913f37d87a637a235a0e3bef1cff19951')

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

prepare() {
    
    cd ${srcdir}/${_name}-${pkgver}

    # Allow most recent python-prov
    sed -i 's^prov==^prov>=^g' requirements.txt rtd_requirements.txt nipype/info.py

}

build() {

    cd ${srcdir}/${_name}-${pkgver}

    _setpaths
    echo "MATLABCMD: ${MATLABCMD}"
    make

}

check() {

    cd ${srcdir}/${_name}-${pkgver}
 
    _setpaths
    echo "MATLABCMD: ${MATLABCMD}"
    make tests

}

package() {

    cd $srcdir/${_name}-${pkgver}
    python setup.py install --root="${pkgdir}/" --optimize=1

}

