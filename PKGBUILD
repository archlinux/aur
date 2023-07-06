# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Ronald van Haren <ronald.archlinux.org>
# Contributor: Bruno Pagani <archange@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tom K <tomk@runbox.com>

_pkg=hdf5
_majver=1.12
pkgname="${_pkg}-${_majver}"
pkgver="${_majver}.0"
_pkgver="${pkgver/_/-}"
pkgrel=2
pkgdesc="General purpose library and file format for storing scientific data"
arch=(x86_64)
_url="hdfgroup.org"
url="https://www.${_url}/${_pkg}"
license=(custom)
depends=(
  bash
  libaec
  zlib
)
makedepends=(
  cmake
  gcc-fortran
  time
)
replaces=(
  "${_pkg}-cpp-fortran"
)
provides=(
  "${_pkg}=${pkgver}"
  "${_pkg}${_majver}"
  "${_pkg}-cpp-fortran")
options=(
  staticlibs
)
source=(
  "https://support.${_url}/ftp/HDF5/releases/${_pkg}-${pkgver:0:4}/${_pkg}-${_pkgver}/src/${_pkg}-${_pkgver}.tar.bz2"
  "${_pkg}-${pkgver}-compat-1.6.patch"
)
sha256sums=(
  '97906268640a6e9ce0cde703d5a71c9ac3092eded729591279bf2e3ca9765f61'
  '72ad497c56760bb3af8193c88d3fa264125829850b843697de55d934c56f7f44'
)

build() {
  local _cmake_opts=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_BUILD_TYPE=Release
    -DHDF5_BUILD_HL_LIB=ON
    -DHDF5_BUILD_CPP_LIB=ON
    -DHDF5_BUILD_FORTRAN=ON
    -DHDF5_ENABLE_Z_LIB_SUPPORT=ON
    -DHDF5_ENABLE_SZIP_SUPPORT=ON
    -DHDF5_ENABLE_SZIP_ENCODING=ON
  ) 
  local _configure_opts=(
    --prefix=/usr
    --docdir="/usr/share/doc/${pkgname}"
    --with-examplesdir='${DESTDIR}/${prefix}/share/doc/'"${_pkg}/examples"
    --libdir="/usr/lib/${pkgname}"
    --includedir="/usr/include/${pkgname}"
    --program-suffix="${_majver}"
    --enable-static
    --disable-sharedlib-rpath
    --enable-build-mode=production
    --enable-hl
    --enable-cxx
    --enable-fortran
    --with-pic
    --with-zlib
    --with-szlib
  )
  # Crazy workaround: run CMake to generate pkg-config file
  mkdir -p build && cd build
  cmake "../${_pkg}-${_pkgver}" \
        "${_cmake_opts[@]}"
  # But don’t build with it, it’s quite broken

  cd "../${_pkg}-${_pkgver}"
  ./configure "${_configure_opts[@]}"
  make
}

check() {
  local _sdir="${srcdir}/${_pkg}-${_pkgver}"
  cd ${_pkg}-${_pkgver}
  # Without this, checks are failing with messages like 
  # “error while loading shared libraries: libhdf5.so.101: 
  # cannot open shared object file: No such file or directory”
  export LD_LIBRARY_PATH="${_sdir}/src/.libs/"
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${_sdir}/c++/src/.libs"
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${_sdir}/fortran/src/.libs"
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${_sdir}/hl/src/.libs"
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${_sdir}/hl/c++/src/.libs"
  export LD_LIBRARY_PATH="$LD_LIBRARY_PATH":"${_sdir}/hl/fortran/src/.libs"
  make check
}

package() {
    local _lib _ext
    local _libs=(
      "lib${_pkg}"
      "lib${_pkg}hl_fortran"
      "lib${_pkg}_cpp"
      "lib${_pkg}_fortran"
      "lib${_pkg}_hl"
      "lib${_pkg}_hl_cpp"
    )
    local _exts=(
      "a"
      "la"
      "so"
    )
    cd "${_pkg}-${_pkgver}"

    make DESTDIR="${pkgdir}" install

    # Link libraries in /usr/lib
    for _lib in "${_libs[@]}"; do
      for _ext in "${_exts[@]}"; do
        ln -s "/usr/lib/${pkgname}/${_lib}.${_ext}" \
              "${pkgdir}/usr/lib/${_lib}.${_ext}.200.0.0" 
      done
    done

    ln -s "/usr/lib/${pkgname}/lib${_pkg}hl_fortran.so" \
          "${pkgdir}/usr/lib/lib${_pkg}_hl_fortran.so.200.0.0"

    ln -s "/usr/lib/${pkgname}/lib${_pkg}hl_fortran.a" \
          "${pkgdir}/usr/lib/lib${_pkg}_hl_fortran.a.200.0.0"

    mv "${pkgdir}/usr/bin/h5cc"{,"${_majver}"}
    mv "${pkgdir}/usr/bin/h5fc"{,"${_majver}"}

    # Install pkg-config files from CMake tree
    install -Dm644 "../build/CMakeFiles/${_pkg}"{,_hl}{,_cpp}"-${pkgver}.pc" \
            -t "${pkgdir}/usr/lib/pkgconfig"

    install -Dm644 COPYING \
            -t "${pkgdir}/usr/share/licenses/${pkgname}"

    # Fix 1.6 compatibility for h5py
    cd "${pkgdir}/usr/include/${pkgname}"
    patch -p1 -i "${srcdir}/${_pkg}-${pkgver}-compat-1.6.patch"

}
