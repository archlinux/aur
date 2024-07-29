pkgname=python-ocp
pkgver=7.7.2.1
pkgrel=2
pkgdesc="Python wrapper for OCCT generated using pywrap"
arch=(x86_64)
url=https://github.com/CadQuery/OCP
license=('Apache')

depends=(
python
'opencascade=1:7.7.2'
'vtk=9.3.1'
fmt
glew
clang15
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
python-tqdm
python-toposort
python-schema
rapidjson
python-jinja
python-toml
openmpi
python-pyparsing
qt5-base
qt5-declarative
openxr
openvr
python-mpi4py
boost
pdal
liblas
adios2
ffmpeg
libharu
verdict
eigen
utf8cpp
glew
fast_float
python-lief
python-logzero
python-clang15
)

conflicts=(python-ocp-git)

_ocp_fragment="#commit=c692e6e2c61319ff4ec83065c5092ad43c364173"
_pywrap_commit="79874f51d2ff963dc993fc77f6871fcd6140f5d9"  # comment this to use the latest
source=(
git+https://github.com/CadQuery/OCP.git${_ocp_fragment}
git+https://github.com/CadQuery/pywrap.git
)

options=(!lto)  # comment this line out if you've got better than 32 GB of ram to spare for the linking step

sha256sums=('SKIP'
            'SKIP')

# needed to prevent memory exhaustion, 10 seems to consume about 14.5 GiB in the build step
_n_parallel_build_jobs=1
#_n_parallel_build_jobs=10  # consumes ~14.5 GiB of ram
#_n_parallel_build_jobs=30  # consumes ~30 GiB of ram
#_n_parallel_build_jobs=60  # consumes ~34 GiB of ram
#_n_parallel_build_jobs=$(nproc --ignore 2)

# pick where opencascade is installed
#_opencascade_install_prefix="/opt/opencascade-cadquery/usr"
_opencascade_install_prefix="/usr"

pkgver() {
  git -C OCP describe --tags
}

prepare(){
  cd OCP
  git submodule init
  git config submodule.pywrap.url "${srcdir}"/pywrap
  git -c protocol.file.allow=always submodule update

  if [[ ${_pywrap_commit} ]]; then
    msg2 "using pywrap commit ${_pywrap_commit}"
    git -C pywrap checkout ${_pywrap_commit}
  fi

  sed "s,-i \${CLANG_INSTALL_PREFIX}/lib/clang/\${LLVM_VERSION}/include/,-i \"$(clang -print-resource-dir)/include\"," -i CMakeLists.txt
  sed "s,-n \${N_PROC},--njobs ${_n_parallel_build_jobs}," -i CMakeLists.txt

  # use upstream's headers, not whatever is shipped here
  rm -r opencascade
  ln -s "${_opencascade_install_prefix}"/include/opencascade .

  # ensure any opencascade at /usr isn't used here
  sed 's|CONDA_PREFIX|_opencascade_install_prefix|g' -i pywrap/FindOpenCascade.cmake

  # disable progress bars
  cd pywrap
  curl --silent https://patch-diff.githubusercontent.com/raw/greyltc/pywrap/pull/1.patch | patch -p1
}

build() {
  cd OCP

  # sneak in python-clang15
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  ln -s "${site_packages}"/clang15 clang
  export PYTHONPATH="${srcdir}/OCP:${PYTHONPATH}"

  msg2 "Setting up build, dumping symbols, then generating bindings..."
  PATH="/usr/lib/llvm15/bin/:${PATH}" LD_LIBRARY_PATH="/usr/lib/llvm15/lib:${LD_LIBRARY_PATH}" cmake \
    -W no-dev \
    -G Ninja \
    -D CMAKE_BUILD_TYPE=Release \
    -B build_dir \
    -S .

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

  LD_DEBUG=libs PYTHONPATH="${srcdir}/build_dir/OCP" python -c "from OCP import *; import OCP; print(OCP.__spec__)"
}

package(){
  cd OCP
  install -Dt "${pkgdir}$(python -c 'import sys; print(sys.path[-1])')" -m644 build_dir/OCP/OCP.*.so
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 LICENSE
}

