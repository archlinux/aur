# Maintainer: entschuld < edgar -a t . openmail.cc>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>

_base=basix
pkgname=python-"${_base}"-git
pkgdesc="Python interface of FEniCS for ordinary and partial differential equations."
pkgver=0.8.0.dev0_r1019.c9ca4e5
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/FEniCS/${_base}"
license=('MIT')
groups=('fenics-git')
depends=("blas-openblas" "fenics-basix" "petsc")
makedepends=("boost" "gcc" "git" "pybind11" "python-setuptools")
checkdepends=("python-pytest")
options=(!emptydirs)
source=("git+${url}#branch=main")
sha512sums=('SKIP')
provides=("python-${_base}=${pkgver}"
          "python-fenics-${_base}=${pkgver}")
conflicts=("python-${_base}"
           "python-fenics-${_base}")
replaces=("${provides}")

#  From UPC: Building And Using Static And Shared "C"
#  Libraries.html
# #+begin_QUOTE
# we need that all jump calls ("goto", in assembly speak)
# and subroutine calls will use relative addresses, and not
# absolute addresses. Thus, we need to use ... ~-fPIC~ or
# ~-fpic~
# #+end_QUOTE
#
#  From makepkg.conf
# -march (or -mcpu) builds exclusively for an architecture
# -mtune optimizes for an architecture, but builds for
#  whole processor family
#
# -O3 optimises
#
# -D-FORTIFY-SOURCE=2
# | https://stackoverflow.com/a/16604146
# |- man 7 feature_test_macros
# checks to be performed to detect some buffer overflow
# errors when employing various string and memory
# manipulation functions ... some  conforming programs
# might fail
#
# -fcf-protection
# | Info pages for gcc (gnu compiler collection)
# intended to protect against such threats as
# Return-oriented Programming (ROP), and similarly
# call/jmp-oriented programming (COP/JOP)
#
# -pipe
# | Info pages for gcc (controlling the kind of output)
# Use pipes rather than temporary files for communication
# between the various stages of compilation
#
# -fno-plt
# | Info pages for gcc (code generation conventions)
# leads to more efficient code by eliminating PLT stubs and
# exposing GOT loads to optimizations
#
# -fopenmp
# | Info pages for gcc (controlling c dialect)
# Enable handling of OpenMP directives
#

safe_flags="-Wp,-D_FORTIFY_SOURCE=2,-D_GLIBCXX_ASSERTIONS"
safe_flags+=" -fcf-protection -fno-plt"
safe_flags+=" -fstack-clash-protection -Wformat"
safe_flags+=" -Werror=format-security"
generic_flags="-pipe -fno-plt -fPIC -fopenmp"
generic_flags+=" -march=native"
generic_flags+=" -mtune=native ${safe_flags}"
opt_flags="${generic_flags} -O3"
generic_flags="${generic_flags} -O2"

export COPTFLAGS="${opt_flags}"
export CXXOPTFLAGS="$COPTFLAGS"
export FOPTFLAGS="$COPTFLAGS"
export CPPFLAGS="$generic_flags"
export CXXFLAGS="$CPPFLAGS"
export CFLAGS="$generic_flags"
export FFLAGS="$generic_flags"
export FCFLAGS="$generic_flags"
export F90FLAGS="$generic_flags"
export F77FLAGS="$generic_flags"

export CC=mpicc
export CXX=mpicxx
export FC=mpif90
export F90=mpif90

export LANG=en_IE.UTF-8
export LC_ALL=en_IE.UTF-8

_base_dir="${startdir}"/src/"${_base}"

prepare() {
    cd "${_base_dir}"
    git clean -dfx

    # Python installer tries to create the parent folder,
    # but it already exists
    cp -a "${_base_dir}"/LICENSE "${_base_dir}"/python
    sed -i 's_\.\./LICENSE_LICENSE_g' "${_base_dir}"/python/pyproject.toml
}

pkgver() {
    cd "${_base_dir}"
    # One day, there will be a tag in the repo (or a single
    # file to analyse) and this will not be needed
    for i in pyproject.toml setup.cfg setup.py; do
      # Check if /version/ exists in any of these files
      if [[ -n $(grep 'version.*=' $i) ]]; then
        # Get version by removing " , ', spaces and =
        tag="$(grep -m 1 'version[[:space:]]*=' "${i}" |
            tr -d '", ' | tr -d "'" | cut -d'=' -f2)"
        break;
      fi;
    done
    printf "%s_r%s.%s" \
           ${tag%%.} \
           "$(git rev-list --count HEAD)" \
           "$(git rev-parse --short=7 HEAD)"
}

build() {
    [ -n "$PETSC_DIR" ] && source /etc/profile.d/petsc.sh
    cd "${_base_dir}"/python
    python -m build --wheel --skip-dependency-check --no-isolation
}

# There is no sane way of doing this
# check() {
#     cd "${_base_dir}"
#     python -m venv --system-site-packages test-env
#     source test-env/bin/activate
#     pyver=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
#     export PYTHONPATH+=":${_base_dir}/python:/usr/basix/:$PWD/test-env/lib/python${pyver}/site-packages/"
#     echo $PYTHONPATH
#     pip -v install --no-deps --no-build-isolation ${_base_dir}/python/dist/*.whl
#     # pytest test -k 'not test_elements and not test_ufl_wrapper'
#     # This re-builds and installs fenics-basix (!)
#     pip -v install --no-deps --no-build-isolation .[test]
#     deactivate
# }

# # There are a lot of failed tests
# # The instructions for running tests are triagged
# check() {
#   cd "${_base_dir}"
#   # Conflicts with the installation (file exists)
#
#   python -m venv --system-site-packages test-env
#   source test-env/bin/activate
#   pip -v install --no-deps  --no-build-isolation .[test]
#   pytest test
#   # python -m installer python/dist/*.whl
#   # PATH="${PWD}/test-env/bin:$PATH" python -m pytest -ra || printf "Tests failed\n"
#   # deactivate
#   # # # https://wiki.archlinux.org/title/Python_package_guidelines#Check
#   # # cd "${_base_dir}"/python
#   # # local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
#   # #
#   # # PYTHONPATH+="$PWD/dist:$PWD/basix/__pycache__/lib.linux-$CARCH-cpython-${python_version}" pytest ../test || printf "Tests failed\n"
# }

package() {
    cd "${_base_dir}"/python
    python -m installer --destdir="$pkgdir" dist/*.whl
}
