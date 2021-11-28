# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-ocp-git
pkgver=7.5.2.beta.r3.ge74a3de
pkgrel=1
pkgdesc="Python wrapper for OCCT generated using pywrap"
arch=(x86_64)
url=https://github.com/CadQuery/OCP
license=('Apache')
depends=(
python
opencascade-cadquery
vtk
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
lief
)
conflicts=(python-ocp)
provides=(python-ocp)
source=(
git+https://github.com/CadQuery/OCP.git
git+https://github.com/CadQuery/pywrap.git
)
sha256sums=('SKIP'
            'SKIP')

# pick where opencascade is installed
export _opencascade_install_prefix="/opt/opencascade-cadquery/usr"
#export _opencascade_install_prefix="/usr"

# pick the package name that will provide opencascade here
export _occt_package_name="opencascade-cadquery"
#export _occt_package_name="opencascade"

pkgver() {
  cd OCP
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd OCP
  git submodule init
  git config submodule.pywrap.url "${srcdir}"/pywrap
  #git submodule update  # use the submodule commit hashes specified
  git submodule update --remote --merge  # use the latest commit(s)
  
  _system_occt_ver=$(pacman -Q opencascade-cadquery | cut -f2 -d ' ' | cut -f1 -d'-')
  sed "s,^libs_linux = .*,libs_linux = prefix_linux.glob('**/libTK*.so.${_system_occt_ver%p*}')," -i dump_symbols.py
  
  # don't use the opencascade headers packaged here
  # instead use the ones from the installed opencascade package
  rm -rf opencascade
  ln -s "${_opencascade_install_prefix}"/include/opencascade .

  # ensure any opencascade at /usr isn't used here
  sed 's|CONDA_PREFIX|_opencascade_install_prefix|g' -i FindOpenCascade.cmake pywrap/FindOpenCascade.cmake

  # add support for jinja v3
  #cd pywrap
  #curl https://patch-diff.githubusercontent.com/raw/CadQuery/pywrap/pull/34.diff | patch -p1 || true
  #git checkout f8869e5a47fd3e3e1d31e7ab89b46c158f7487bf

  # https://github.com/CadQuery/pywrap/issues/41
  cd pywrap
  #curl -q https://patch-diff.githubusercontent.com/raw/CadQuery/pywrap/pull/43.patch | patch -p1
}

build() {
  cd OCP

  # get symbols
  local _structure_needed="dummy/lib_linux/"
  mkdir -p "${_structure_needed}"
  ln -s "${_opencascade_install_prefix}"/lib dummy/lib_linux/.
  msg2 "Old symbols:"
  ls -lh *.dat
  rm *.dat
  msg2 "Dumping symbols..."
  python dump_symbols.py dummy
  msg2 "Dump complete. New symbols:"
  ls -lh *.dat
  rm -rf ${_structure_needed}
  find -maxdepth 1 -name '*.dat' -exec ln -sf ../{} pywrap/{} \;

  msg2 "Generating bindings..."
  CONDA_PREFIX="/usr" PYTHONPATH=pywrap python -m bindgen \
    --clean \
    --libclang /usr/lib/libclang.so \
    --include "$(clang -print-resource-dir)"/include \
    --include "/usr/include/vtk" \
    all ocp.toml
  msg2 "Bindings generated."

  msg2 "Setting up OCP build..."
  CONDA_PREFIX="/usr" cmake -B build_dir -S OCP -W no-dev -G Ninja \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_FIND_ROOT_PATH="${_opencascade_install_prefix}" \
    -D OPENCASCADE_INCLUDE_DIR="${_opencascade_install_prefix}"/include/opencascade/

  msg2 "Building OCP..."
  _n_parallel_build_jobs=1  # needed to prevent memory exhaustion on my many core machine, 10 seems to consume about 14.5 GiB
  cmake --build build_dir -j${_n_parallel_build_jobs}

  msg2 "OCP built."
}

check() {
  cd OCP

  # prevent the current environment from skewing the testing
  unset "${!CSF@}"
  unset "${!DRAW@}"
  unset CASROOT

  PYTHONPATH="$(pwd)/build_dir" python -c "from OCP import *"
}

package(){
  cd OCP

  install -Dt "${pkgdir}$(python -c 'import sys; print(sys.path[-1])')" -m644 build_dir/OCP.*.so
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}
