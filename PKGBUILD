# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python-ocp-git
pkgver=7.5.RC1.r4.g6b105a3
pkgrel=1
pkgdesc="Python wrapper for OCCT generated using pywrap"
arch=(x86_64)
url=https://github.com/CadQuery/OCP
license=('Apache')
depends=(
python
opencascade
)
makedepends=(
git
clang
python-joblib
python-click
python-pandas
python-path
pybind11
python-setuptools
ninja
cmake
python-logzero
python-tqdm
python-toposort
python-cymbal
python-schema
rapidjson
python-jinja
python-toml
)
source=(git+https://github.com/CadQuery/OCP.git)
sha256sums=('SKIP')

pkgver() {
  cd OCP
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd OCP
  git submodule update --init --recursive
  
  # pywrap assdumes I'm using clang 8.0.0...
  #sed -i "s,rv.append(Path(prefix) / 'lib/clang/8.0.0/include/'),rv.append(Path(prefix) / 'lib/clang/$(pacman -Q clang | awk '{print $2}' | cut -f1 -d"-")/include/'),g" pywrap/bindgen/utils.py

  # don't use the opencascade headers packaged here
  # instead use the ones from the installed opencascade package
  #rm -rf opencascade
  #ln -s /usr/include/opencascade .
}

build() {
  cd OCP
  export CONDA_PREFIX=/usr
  export PYTHONPATH=pywrap
  python -m bindgen all ocp.toml
  msg2 pywrap done
  ls -al
  cmake \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -G Ninja \
    -B "${srcdir}/build" \
    -S OCP
  ninja -C "${srcdir}/build"
  msg2 ninja done
  #cmake -S OCP -B build
  #cmake --build build
  #msg2 pywrap done
  #exit -1

  #local _config_file=ocp.toml
  #local _output=$(python -c "import toml; print(toml.load(\"${_config_file}\")['output_folder'])")
  #python -m bindgen -n $(nproc) parse ${_config_file} out.pkl
  #python -m bindgen -n $(nproc) transform ${_config_file} out.pkl out_f.pkl
  #python -m bindgen -n $(nproc) generate ${_config_file} out_f.pkl
  #mkdir -p ${_output}
  #cp -a out*.pkl ${_output}/.
  #cmake -B build -S "${_output}" -G Ninja -DCMAKE_BUILD_TYPE=Release
  #cmake --build build -j $(nproc) -- -k 0
}

check() {
  cd OCP
  python -c "from OCP.gp import gp_Vec, gp_Ax1, gp_Ax3, gp_Pnt, gp_Dir, gp_Trsf, gp_GTrsf, gp, gp_XYZ"
}

package(){
  cd OCP
  rm -rf build/CMakeFiles

  # now we should figure out where site packages go and put the generated python there
  _i_dir="${pkgdir}/$(python -c 'import sys; print(sys.path[-1])')"
  mkdir -p "${_i_dir}"
  cp build/OCP* "${_i_dir}/."
}

# vim:ts=2:sw=2:et:
