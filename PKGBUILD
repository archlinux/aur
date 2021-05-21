# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-ocp-git
pkgver=7.5.RC2.r0.gb59edab
pkgrel=1
pkgdesc="Python wrapper for OCCT generated using pywrap"
arch=(x86_64)
url=https://github.com/CadQuery/OCP
license=('Apache')
depends=(
python
opencascade-rc
vtk9-java
)
makedepends=(
git
clang
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
source=(git+https://github.com/CadQuery/OCP.git)
sha256sums=('SKIP')

pkgver() {
  cd OCP
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd OCP
  git submodule update --init --recursive

  # opencascade is 7.5.2 not 7.5.1
  sed 's,7.5.1,7.5.2,g' -i dump_symbols.py
  
  # don't use the opencascade headers packaged here
  # instead use the ones from the installed opencascade package

  rm -rf opencascade
  ln -s /usr/include/opencascade .

}

build() {
  cd OCP

  # get symbols
  local _structure_needed="dummy/lib_linux/"
  mkdir -p ${_structure_needed}
  ln -s /usr/lib dummy/lib_linux/.
  msg2 "Old symbols:"
  ls -lh *.dat
  rm *.dat
  msg2 "Dumping symbols..."
  python dump_symbols.py dummy
  msg2 "Dump complete. New symbols:"
  ls -lh *.dat
  rm -rf ${_structure_needed}
  find -maxdepth 1 -name '*.dat' -exec ln -sf ../{} pywrap/{} \;
  
  msg2 "Running bindgen..."
  CONDA_PREFIX=/usr PYTHONPATH=pywrap python -m bindgen \
    --clean \
    --libclang "$(ldconfig -p | grep 'libclang.so$' | head -1 | awk '{print $NF}')" \
    --include "$(clang -print-resource-dir)"/include \
    --include "/usr/include/vtk" \
    all ocp.toml
  msg2 "bindgen done." 

  msg2 "Building OCP..."
  cmake -B build_dir -S OCP -W no-dev -G Ninja \
    -D OPENCASCADE_INCLUDE_DIR=opencascade \
    -D CMAKE_BUILD_TYPE=None

  cmake --build build_dir -- -j4
  msg2 "OCP build done."
}

check() {
  cd OCP
  #python -c "from OCP.gp import gp_Vec, gp_Ax1, gp_Ax3, gp_Pnt, gp_Dir, gp_Trsf, gp_GTrsf, gp, gp_XYZ"
  PYTHONPATH="./build_dir" python -c "import OCP"
}

package(){
  cd OCP

  install -Dt "${pkgdir}$(python -c 'import sys; print(sys.path[-1])')" -m644 build_dir/OCP.*.so
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

# vim:ts=2:sw=2:et:
