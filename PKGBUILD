pkgname=python-ocp
pkgver=7.8.1.2+r81.g2dd2ce8a
pkgrel=1
pkgdesc="Python wrapper for OCCT generated using pywrap"
arch=(x86_64)
url=https://github.com/CadQuery/OCP
license=('Apache-2.0')

depends=(
python
opencascade
vtk
gcc-libs
glibc
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

_ocp_fragment="#commit=2dd2ce8a63f1eaffebe27b1fdcb94c6bba6dc61b"
#_forced_pywrap_commit="5e134c526b3bbd1758d8f63e518bc16c3d7ff352"  # comment this to use the expected commit
source=(
  git+https://github.com/CadQuery/OCP.git${_ocp_fragment}
  git+https://github.com/CadQuery/pywrap.git
  no_progress_bars.patch
  mpi_cmake.patch
  pyproject.toml
)

options=(!lto)  # comment this line out if you've got better than 32 GB of ram to spare for the linking step

sha256sums=('3ff25c0603d310a68d7ac7f4207e7bb2f7006b038ad312322d141b77c9164d83'
            'SKIP'
            'b4c2585efd9c21c6351b6278098b4bcf7395e23b9721c391b3bcb72983b6ebf8'
            '73c64a8323df9a2b96955d0104f761ec3d9078813716164b9dd7b647d65bb2f0'
            'd364dbb165848e0327a941390c1be0fdc6691e6f4952d8233368a563e2594843')

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

  cd pywrap
  cat ../../no_progress_bars.patch | patch -p1  # disable progress bars
  cat ../../mpi_cmake.patch | patch -p1  # fix mpi detection issue
}

build() {
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

  #local cmake_options2=(
  #  -B build_dir2
  #  -D CMAKE_BUILD_TYPE=Release
  #  -S build_dir/OCP
  #  -G Ninja
  #  -W no-dev
  #)

  #msg2 "Building OCP..."
  #cmake "${cmake_options2[@]}"
  #cmake --build build_dir2 --verbose -j${_n_parallel_build_jobs}
  #msg2 "OCP built."
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
