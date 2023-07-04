# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: Dylon Edwards <deltaecho at archlinux dot us>

_py="python"
_pkg="open3d"
pkgbase="${_pkg}-git"
pkgname=(
  {,"${_py}-"}"${_pkg}-git"
)
pkgver=r2539.f3c7158a
pkgrel=1
pkgdesc="A Modern Library for 3D Data Processing"
arch=('x86_64')
url="http://www.${_pkg}.org"
_url="https://github.com/isl-org/Open3D"
license=('MIT')
depends=(
  eigen
  glew
  glfw-x11
  jsoncpp
  libjpeg-turbo
  libpng
  mesa
  xorg-server-devel
)
optdepends=(
  'openmp: Multiprocess support'
  'pybind11: System pybind11 support'
  "${_py}: Python support"
  'jupyter-notebook: Jupyter notebook support'
)
makedepends=(
  cmake
  git
  "${_py}-setuptools"
)
source=(
  "${pkgbase}::git+${_url}.git"
  fix_3rdparty_path.patch
)
sha256sums=(
  'SKIP'
  '3bf6b79fd075b356a5c2d86a557e0bc6e6df0e84d53c2077d2c6685641838d81'
)

function pkgver() {
  cd "${pkgbase}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" \
                  "$(git rev-parse --short HEAD)"
}

function prepare() {
    cd "${srcdir}/${pkgbase}"
    sed -i '/^CMAKE_ARGS.*/a -DCMAKE_INSTALL_DEFAULT_LIBDIR="lib"' \
           "3rdparty/libjpeg-turbo/libjpeg-turbo.cmake"
    # patch --forward \
    #       --strip=1 \
    #       --input="${srcdir}/fix_3rdparty_path.patch"
    git submodule update --init \
                         --recursive
    mkdir build
}

function build() {
  local _cmake_opts=(
    -DCMAKE_INSTALL_PREFIX="${pkgdir}/usr"
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_BUILD_TYPE=Release
  )
  cd "${srcdir}/${pkgbase}/build"
  cmake .. "${_cmake_opts[@]}"
  make
}

function package_open3d-git() {
  optdepends=(
    'openmp: Multiprocess support'
  )
  provides=(
    "${_pkg}=${pkgver}"
  )
  conflicts=(
    "${_pkg}"
  )
  cd "${srcdir}/${pkgbase}/build"
  make install
}

function package_python-open3d-git() {
  depends+=(
    "${_pkg}-git"
    "${_py}"
  )
  optdepends=(
    'jupyter-notebook: Jupyter notebook support'
    'openmp: Multiprocess support'
    'pybind11: System pybind11 support'
  )
  provides=(
    "${_py}-${_pkg}=${pkgver}"
    "${_py}-py3d=${pkgver}"
  )
  conflicts=(
      "${_py}-${_pkg}"
      "${_py}-py3d"
  )
  cd "${srcdir}/${pkgbase}/build"
  make "${_py}-package"
  cd "${srcdir}/${pkgbase}/build/lib/${_py}_package"
  "${_py}" setup.py install --root="${pkgdir}" \
                            --optimize=1
}
