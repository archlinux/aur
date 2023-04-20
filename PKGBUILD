# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-ocp
pkgver=7.6.3.0
pkgrel=2
pkgdesc="Python wrapper for OCCT generated using pywrap"
arch=(x86_64)
url=https://github.com/CadQuery/OCP
license=('Apache')
depends=(
python
'opencascade=1:7.6.3'
vtk
fmt
glew
)
makedepends=(
git
clang
llvm
python-joblib
python-click
python-pandas
python-path
pybind11
ninja
cmake
python-logzero
python-tqdm
python-toposort
python-schema
rapidjson
python-jinja
python-toml
python-lief
openmpi
python-pyparsing
)
conflicts=(python-ocp-git)
source=(
git+https://github.com/CadQuery/OCP.git#tag=${pkgver}
git+https://github.com/CadQuery/pywrap.git
)
cksums=(
'SKIP'
'SKIP'
)

# needed to prevent memory exhaustion, 10 seems to consume about 14.5 GiB in the build step
_n_parallel_build_jobs=1
#_n_parallel_build_jobs=10  # consumes ~14.5 GiB of ram
#_n_parallel_build_jobs=30  # consumes ~30 GiB of ram
#_n_parallel_build_jobs=60  # consumes ~34 GiB of ram

# pick where the opencascade is installed
#_opencascade_install_prefix="/opt/opencascade-cadquery/usr"
_opencascade_install_prefix="/usr"

prepare(){
  cd OCP
  git submodule init
  git config submodule.pywrap.url "${srcdir}"/pywrap
  git -c protocol.file.allow=always submodule update

  sed "s,^libs_linux = .*,libs_linux = prefix_linux.glob('**/libTK*.so')," -i dump_symbols.py

  # don't use the opencascade headers packaged here
  # instead use the ones from the installed opencascade package
  rm -rf opencascade
  ln -s "${_opencascade_install_prefix}"/include/opencascade .

  # ensure any opencascade at /usr isn't used here
  sed 's|CONDA_PREFIX|_opencascade_install_prefix|g' -i FindOpenCascade.cmake pywrap/FindOpenCascade.cmake

  # disable progress bars
  cd pywrap
  curl --silent https://patch-diff.githubusercontent.com/raw/greyltc/pywrap/pull/1.patch | patch -p1
}

build() {
  cd OCP

  # get symbols
  local _structure_needed="dummy/lib_linux/"
  mkdir -p "${_structure_needed}"
  ln -s "${_opencascade_install_prefix}"/lib dummy/lib_linux/.
  msg2 "Old symbols:"
  ls -gG --human-readable *.dat
  rm *.dat
  msg2 "Redumping symbols..."
  python dump_symbols.py dummy
  msg2 "Dump complete. New symbols:"
  ls -gG --human-readable *.dat
  rm -rf ${_structure_needed}
  find -maxdepth 1 -name '*.dat' -exec ln -sf ../{} pywrap/{} \;

  msg2 "Generating bindings..."
  CONDA_PREFIX=/usr PYTHONPATH=pywrap python -m bindgen -v \
    --clean \
    --njobs ${_n_parallel_build_jobs} \
    --libclang /usr/lib/libclang.so \
    --include "$(clang -print-resource-dir)"/include \
    --include "/usr/include/vtk" \
    all ocp.toml
  msg2 "Bindings generated."

  msg2 "Setting up OCP build..."
  CONDA_PREFIX=/usr cmake -B build_dir -S OCP -W no-dev -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_FIND_ROOT_PATH="${_opencascade_install_prefix}" \
    -D OPENCASCADE_INCLUDE_DIR="${_opencascade_install_prefix}"/include/opencascade/

  msg2 "Building OCP..."
  cmake --build build_dir -j${_n_parallel_build_jobs}
  msg2 "OCP built."
}

check() {
  cd OCP

  # prevent the current environment from skewing the testing
  # comment these if using community occt package
  #unset "${!CSF@}"
  #unset "${!DRAW@}"
  #unset CASROOT

  PYTHONPATH="$(pwd)/build_dir" python -c "from OCP import *; import OCP; print(OCP.__spec__)"
}

package(){
  cd OCP

  install -Dt "${pkgdir}$(python -c 'import sys; print(sys.path[-1])')" -m644 build_dir/OCP.*.so
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

