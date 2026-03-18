pkgname=python-ocp
#_ocp_fragment="#tag=8.0.0.0RC3"
_ocp_fragment='#tag=7.9.3.1'
pkgver=7.9.3.1
pkgrel=1
pkgdesc="Python wrapper for OCCT generated using pywrap"
arch=(x86_64)
url=https://github.com/CadQuery/OCP
license=('Apache-2.0')

depends=(
python
opencascade
vtk
libgcc
libstdc++
glibc
)

makedepends=(
git
python-clang20
clang20
llvm20
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
python-setuptools
python-scikit-build-core
python-build
python-installer
python-wheel
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
nlohmann-json
fast_float
lief
python-logzero
double-conversion
glew
)

conflicts=(python-ocp-git)

#_forced_pywrap_commit="5e134c526b3bbd1758d8f63e518bc16c3d7ff352"  # comment this to use the expected commit
source=(
  git+https://github.com/CadQuery/OCP.git${_ocp_fragment}
  git+https://github.com/CadQuery/pywrap.git
  no_progress_bars.patch
  mpi_cmake.patch
  fix_rapidjson.patch
  pyproject.toml
)

options=(!lto)  # comment this line out if you've got better than 32 GB of ram to spare for the linking step

b2sums=('b04312afc5483bc3e9bf2e984a66445f5bd2299ac68f465cfcfd917aa3bd5fde88613559aeab748e69674bad0c89cc7d1c370bba1d29590487bf10573c8ce24f'
        'SKIP'
        'a3f8c7cbf8592cb32715d3a43ee57852348b5370122fdf4ed69935b992cc23790e8cdad822afc600f4fe94a89f071104b875224ca68ae0ce34b2d4f36c45d4ea'
        '8ffb8cefa00ade99ce2b43cb9913d6afa120563c91659f2def69d91238554ece53c2142b156a4e80734e1550a0721cfeb686f46742ee9d6e1d347cee6ea118d2'
        'da68bed72b5d0a60c8b69691832ecf32494000c9a15bbe6af57cf346fc78f712fabcfb27bb94db26a276a4a897f0a7a6c5a6af3228e143d13a3b86d616520327'
        '240fdbd739dbe9111cad8621d52d21eee811ffcdf527e65008cd23170ca8effe12096fcebaf551326edbe5beca2dc09e15646282ce357e5d23fea4e0af90a8c0')

# needed to prevent memory exhaustion, 10 seems to consume about 14.5 GiB in the build step
_n_parallel_build_jobs=4
#_n_parallel_build_jobs=10  # consumes ~14.5 GiB of ram
#_n_parallel_build_jobs=25  # consumes ~30 GiB of ram
#_n_parallel_build_jobs=60  # consumes ~34 GiB of ram
#_n_parallel_build_jobs=$(nproc --ignore 2)

# pick where opencascade is installed
#_opencascade_install_prefix="/opt/opencascade-cadquery/usr"
_opencascade_install_prefix="/usr"

pkgver() {
  local _git_describe="$(git -C OCP describe --tags)"
  local _git_describe="${_git_describe/-/+r}"
  echo -n "${_git_describe//-/.}"
}

prepare(){
  # fix version for .whl
  sed "s,^version.*,version = \"${pkgver}\"," --in-place pyproject.toml

  cd OCP
  git submodule init
  git config submodule.pywrap.url "${srcdir}"/pywrap
  git -c protocol.file.allow=always submodule update

  if [[ ${_forced_pywrap_commit} ]]; then
    git -C pywrap checkout "${_forced_pywrap_commit}"
  fi

  msg2 "Using pywrap commit $(git -C pywrap rev-parse --short HEAD)"

  # use system's opencascade headers, not whatever is shipped here
  rm -r opencascade
  ln -s "${_opencascade_install_prefix}"/include/opencascade .

  cat ../fix_rapidjson.patch | patch -p1

  cd pywrap

  # use the clang20 python bindings
  find . -type f -name '*.py' -exec sed -i -e 's/clang.cindex/clang20.cindex/g' {} \;

  cat ../../no_progress_bars.patch | patch -p1  # disable progress bars
  cat ../../mpi_cmake.patch | patch -p1  # fix mpi detection issue
}

build() {
  # for clang20
  export PATH="/usr/lib/llvm20/bin:$PATH"

  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate

  # use system opencascade
  export CONDA_PREFIX="${_opencascade_install_prefix}"

  cd OCP/pywrap
  python -m build --wheel --no-isolation
  python -m installer dist/*.whl
  cd -

  local cmake_options=(
    -B build_dir
    -D CMAKE_BUILD_TYPE=Release
    -S OCP
    -G Ninja
    -W no-dev
    -D N_PROC=${_n_parallel_build_jobs}
  )

  msg2 "Preparing OCP..."
  cmake "${cmake_options[@]}"
  cmake --build build_dir --verbose -j${_n_parallel_build_jobs}
  msg2 "OCP prepared."
  deactivate

  # build the .whl
  msg2 "Building OCP..."
  cd build_dir/OCP
  echo -e '\npybind11_extension( OCP )' >> CMakeLists.txt
  echo 'install(TARGETS OCP DESTINATION .)' >> CMakeLists.txt
  cp "${srcdir}/pyproject.toml" .
  CMAKE_GENERATOR=Ninja CMAKE_BUILD_PARALLEL_LEVEL=${_n_parallel_build_jobs} python -m build --wheel --no-isolation
  cd -
  msg2 "OCP built."
}

check() {
  python -m venv --without-pip --system-site-packages --clear venv
  source venv/bin/activate
  python -m installer build_dir/OCP/dist/*.whl
  
  # prevent the current environment from skewing the testing
  # comment these if using community occt package
  #unset "${!CSF@}"
  #unset "${!DRAW@}"
  #unset CASROOT

  # recursively import all submodules
  LD_DEBUG=libs python - <<'____HERE'
import inspect
import importlib
import OCP
def import_all_submodules(module):
  mod_name = module.__name__
  for submodule in inspect.getmembers(module, inspect.ismodule):
    to_do = f'{mod_name}.{submodule[0]}'
    imported_submod = importlib.import_module(to_do)
    print(f"imported {imported_submod.__name__}")
    import_all_submodules(imported_submod)
import_all_submodules(OCP)
print(OCP.__spec__)
____HERE
  
  deactivate
}

package(){
  #local _pysyspath="${pkgdir}$(python -c 'import sys; print(sys.path[-1])')"
  #install -Dt "${_pysyspath}" -m644 build_dir2/OCP.*.so
  
  python -m installer --destdir="$pkgdir" build_dir/OCP/dist/*.whl
  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 OCP/LICENSE
}
