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
  
  # don't use the opencascade headers packaged here
  # instead use the ones from the installed opencascade package
  #rm -rf opencascade
  #ln -s /usr/include/opencascade .
}

build() {
  cd OCP
  CONDA_PREFIX=/usr PYTHONPATH=pywrap python -m bindgen \
    --clean \
    --libclang "$(ldconfig -p | grep 'libclang.so$' | awk '{print $NF}')" \
    --include "$(clang -print-resource-dir)"/include \
    all ocp.toml

  cmake \
    -W no-dev \
    -D CMAKE_INSTALL_PREFIX="/usr" \
    -D OPENCASCADE_INCLUDE_DIR=opencascade \
    -D CMAKE_BUILD_TYPE=None \
    -B "${srcdir}/build" \
    -G Ninja \
    -S OCP

  ninja -C "${srcdir}/build"
}

check() {
  cd "${srcdir}/build"
  python -c "from OCP.gp import gp_Vec, gp_Ax1, gp_Ax3, gp_Pnt, gp_Dir, gp_Trsf, gp_GTrsf, gp, gp_XYZ"
}

package(){
  cd OCP
  _python_site_path="$(python -c 'import sys; print(sys.path[-1])')"
  mkdir -p "${pkgdir}/${_python_site_path}"
  cp "${srcdir}"/build/OCP.*.so "${pkgdir}/${_python_site_path}"

 install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

# vim:ts=2:sw=2:et:
