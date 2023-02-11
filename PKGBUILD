# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>
# Contributor: Olivier Mehani <olivier.mehani@inria.fr>

# shellcheck disable=SC2034
_pkg="gcc"
target="mipsel-linux"
pkgname="${target}-${_pkg}3-initial"
pkgver=3.3.6
pkgrel=1
pkgdesc="GNU C compiler (bootstrap, mipsel-linux)"
url="http://www.gnu.org/software/${_pkg}"
arch=("x86_64")
provides=("${target}-${_pkg}3")
depends=("glibc" "${target}-binutils")
source=("ftp://ftp.gnu.org/gnu/${_pkg}/${_pkg}-${pkgver}/${_pkg}-core-${pkgver}.tar.bz2")
sha256sums=('4f9bee8ac57711508d6b8031d5ecfefc16fcf37ec81568b3f8344ef5f4cdfeb6')
options=(!strip)

_n_cpu="$(getconf _NPROCESSORS_ONLN)"
_make_opts=(-j "${_n_cpu}")

# shellcheck disable=SC2154
build() {
  local _target

  CFLAGS=""
  CXXFLAGS=""
  CPPFLAGS=""
  LDFLAGS=""
  export CFLAGS
  export CXXFLAGS
  export CPPFLAGS
  export LDFLAGS
  export PATH="${PATH}:${_bu_bin}"
  export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib"

  local _cflags=(-D_FORTIFY_SOURCE=0
                 -O2
                 -Wno-implicit-function-declaration
                 -I/usr/include
                 -L/usr/lib
                 # -ldl
                 -static)

  local _ldflags=(-I/usr/include
                  # -rdynamic
                  -L/usr/lib
                  # -ldl
                  -Bstatic
                  -s)

  local _libs=(-L/usr/lib)
               # -ldl
               # /usr/lib/libmpc.so
               # /usr/lib/libmpfr.so
               # /usr/lib/libgmp.so)

  local _build_opts=(${_make_opts[@]}
                     CFLAGS="${_cflags[*]}"
                     CXXFLAGS="${_cflags[*]}"
                     CPPFLAGS="${_cflags[*]}"
                     LDFLAGS="${_ldflags[*]}"
                     LIBS="${_libs[*]}")

  cd "${srcdir}/${_pkg}-${pkgver}"

  for _target in "${target}"; do
    rm -rf "build-${_target}"
    mkdir -p "build-${_target}"
    cd "build-${_target}"
    local _configure_opts=(--prefix="/usr"
                           --target="${_target}"
                           --host=${CHOST}
                           --build=${CHOST}
                           --infodir="/usr/${_target}/share/info"
                           --mandir="/usr/${_target}/share/man"
                           --with-gnu-as
                           --with-gnu-ld
                           --disable-shared
                           --disable-libiberty
                           --disable-nls
                           --disable-threads)

    LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:/usr/lib" \
    CC="/usr/bin/gcc" \
    CXX="/usr/bin/g++" \
    CFLAGS="${_cflags[*]}" \
    CXXFLAGS="${_cxxflags[*]}" \
    LDFLAGS="${_ldflags[*]}" \
    LIBS="${_libs[*]}" \
    "../configure" ${_configure_opts[@]}

    LD_LIBRARY_PATH=/usr/lib \
    CC="/usr/bin/gcc" \
    CXX="/usr/bin/g++" \
    CFLAGS="${_cflags[*]}" \
    CXXFLAGS="${_cxxflags[*]}" \
    LDFLAGS="${_ldflags[*]}" \
    LIBS="${_libs[*]}" \
    make "${_build_opts[@]}"

    cd ..
  done

}

package() {
  local _target
  cd "${srcdir}/${_pkg}-${pkgver}"
  for _target in "${target}"; do
    cd "build-${_target}"
    make DESTDIR="${pkgdir}" "${_make_opts[@]}" install
    rm -rf "${pkgdir}/usr/lib/libiberty.a"
    rm -rf "${pkgdir}/usr/${target}/share/info/dir"
    cd ..
  done
}
