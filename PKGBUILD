# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=python-ocp
_pkgver="7.4-RC2"
_stubs_hash=372b103b4079ffe1a54e66310ea579040892c5dd
#TODO: add stubs
_pywrap_hash=45cf3240ededaead2e7ea60dcecc9c5cb157e0c6
pkgver=${_pkgver//-/.}
pkgrel=1
pkgdesc="Python wrapper for OCCT generated using pywrap"
arch=('any')
url=https://github.com/CadQuery/OCP
license=('Apache 2.0 or LGPL2')
depends=(python opencascade)
makedepends=(gcc8 gcc8-libs clang python-joblib python-click python-pandas python-path gcc pybind11 python-setuptools ninja cmake python-logzero python-tqdm python-toposort python-cymbal python-schema)
source=("https://github.com/CadQuery/OCP/archive/${_pkgver}.tar.gz" "https://github.com/CadQuery/pywrap/archive/${_pywrap_hash}.tar.gz")
sha256sums=('cd04ad30d38a4836ed2cd0c7ba77174aa41f42f487ba42baf7094624802194d5'
            '1cdc071e4c731d853efbb14f00a7a40ebbf01c189a5c11c83a7f74af96d6c265')

prepare(){
  cd "OCP-${_pkgver}"
  
  rm -rf pywrap
  ln -s ../pywrap* pywrap
  sed -i "s,rv.append(Path(prefix) / 'lib/clang/8.0.0/include/'),rv.append(Path(prefix) / 'lib/clang/$(pacman -Q clang | awk '{print $2}' | cut -f1 -d"-")/include/'),g" pywrap/bindgen/utils.py
  
  rm -rf opencascade
  ln -s /usr/include/opencascade .
}

build() {
  cd "OCP-${_pkgver}"
  export CONDA_PREFIX=/usr
  export PYTHONPATH=pywrap
  local _config_file=ocp.toml
  local _output=$(python -c "import toml; print(toml.load(\"${_config_file}\")['output_folder'])")
  python -m bindgen -n $(nproc) parse ${_config_file} out.pkl
  python -m bindgen -n $(nproc) transform ${_config_file} out.pkl out_f.pkl
  python -m bindgen -n $(nproc) generate ${_config_file} out_f.pkl
  mkdir -p ${_output}
  cp -a out*.pkl ${_output}/.
  export CC=`which gcc-8`
  export CXX=`which g++-8`
  cmake -B build -S "${_output}" -G Ninja -DCMAKE_BUILD_TYPE=Release
  cmake --build build -j $(nproc) -- -k 0
  rm -rf build/CMakeFiles
  
}

check() {
  cd "OCP-${_pkgver}/build"
  python -c "from OCP.gp import gp_Vec, gp_Ax1, gp_Ax3, gp_Pnt, gp_Dir, gp_Trsf, gp_GTrsf, gp, gp_XYZ"
}

package(){
  cd "OCP-${_pkgver}"
  _i_dir="${pkgdir}/$(python -c 'import sys; print(sys.path[-1])')"
  mkdir -p "${_i_dir}"
  cp build/OCP* "${_i_dir}/."
}

# vim:ts=2:sw=2:et:
