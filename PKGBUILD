# Maintainer: Julian Brost <julian@0x4a42.net>
# Contributor: Evangelos Foutras <foutrelis@archlinux.org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Marius Knaust <marius.knaust@gmail.com>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Kritoke <kritoke@gamebox.net>
# Contributor: Luca Roccia <little_rock@users.sourceforge.net>

pkgname=('boost1.86' 'boost1.86-libs')
pkgver=1.86.0
pkgrel=1
_srcname=boost_${pkgver//./_}
pkgdesc="Free peer-reviewed portable C++ source libraries (version 1.86)"
arch=('x86_64')
url="https://www.boost.org/"
license=('BSL-1.0')
makedepends=('icu' 'python' 'python-numpy' 'bzip2' 'zlib' 'openmpi' 'zstd')
source=(
  https://archives.boost.io/release/$pkgver/source/$_srcname.tar.bz2
  boost-numpy-2.0.patch::https://github.com/boostorg/python/commit/0474de0f6cc9.patch
  boost-1_86_0-fix-compute-header_patch_1.patch::https://github.com/boostorg/compute/commit/79452d5279831ee59a650c17b71259a821f1a554.patch
  boost-1_86_0-fix-compute-header_patch_2.patch::https://github.com/boostorg/compute/commit/f8e5e3543723379bb6a9dd9d88415a993653e70a.patch
)
sha256sums=('1bed88e40401b2cb7a1f76d4bab499e352fa4d0c5f31c0dbae64e24d34d7513b'
            'ccda8ef8126c93f4c8d29ba43b5f301952e5eacdc7fecb2ae3d01115a2222c53'
            '20e8017cd5d237157af578d4279c264418bb8f92471ba2efa1dc2e8e980addd8'
            'a8c2b93129cb9c39c1ab30a6f3140e21f3fbfa23ededa039ab328331498293c7')

prepare() {
  cd $_srcname

  # support building against NumPy 2.0
  patch -Np1 -d libs/python <../boost-numpy-2.0.patch

  # https://gitlab.archlinux.org/archlinux/packaging/packages/boost/-/issues/3
  patch -Np2 < ../boost-1_86_0-fix-compute-header_patch_1.patch
  patch -Np2 < ../boost-1_86_0-fix-compute-header_patch_2.patch
}

build() {
  local JOBS="$(sed 's/.*\(-j *[0-9]\+\).*/\1/' <<<$MAKEFLAGS)"
  local python_version=$(
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  pushd $_srcname/tools/build
  ./bootstrap.sh --cxxflags="$CXXFLAGS $LDFLAGS"
  ./b2 install --prefix="$srcdir"/fakeinstall
  ln -s b2 "$srcdir"/fakeinstall/bin/bjam
  popd

  cd $_srcname
  ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=python3

  # support for OpenMPI
  echo "using mpi ;" >>project-config.jam

  # boostbook is needed by quickbook
  install -dm755 "$srcdir"/fakeinstall/share/boostbook
  cp -a tools/boostbook/{xsl,dtd} "$srcdir"/fakeinstall/share/boostbook/

  # install to $srcdir/fakeinstall in preparation for split packaging
  ./b2 install \
    variant=release \
    debug-symbols=off \
    threading=multi \
    runtime-link=shared \
    link=shared,static \
    toolset=gcc \
    cxxstd=23 \
    python=$python_version \
    cflags="$CPPFLAGS $CFLAGS -fPIC -O3 -ffat-lto-objects" \
    cxxflags="$CPPFLAGS $CXXFLAGS -fPIC -O3 -ffat-lto-objects" \
    linkflags="$LDFLAGS" \
    --layout=system \
    $JOBS \
    \
    --prefix="$srcdir"/fakeinstall
}

package_boost1.86() {
  local python_version=$(
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  pkgdesc+=' (development headers)'
  depends=("boost1.86-libs=$pkgver")
  optdepends=('python: for python bindings')
  options=('staticlibs')

  install -d "$pkgdir"/opt/boost1.86/lib
  cp -a fakeinstall/lib/*.{a,so} "$pkgdir"/opt/boost1.86/lib/
  for lib in fakeinstall/lib/*.so.*; do
    ln -s /usr/lib/"$(basename "$lib")" "$pkgdir"/opt/boost1.86/lib/
  done
  cp -a fakeinstall/lib/cmake "$pkgdir"/opt/boost1.86/lib/
  cp -a fakeinstall/{bin,include,share} "$pkgdir"/opt/boost1.86/

  # https://github.com/boostorg/python/issues/203#issuecomment-391477685
  for _lib in python numpy; do
    ln -srL "$pkgdir"/opt/boost1.86/lib/libboost_${_lib}{${python_version/.},${python_version%.*}}.so
  done
}

package_boost1.86-libs() {
  local python_version=$(
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')

  pkgdesc+=' (runtime libraries)'
  depends=('bzip2' 'zlib' 'icu' 'zstd')
  optdepends=('openmpi: for mpi support')
  provides=(
    libboost_atomic.so
    libboost_charconv.so
    libboost_chrono.so
    libboost_cobalt.so
    libboost_container.so
    libboost_context.so
    libboost_contract.so
    libboost_coroutine.so
    libboost_date_time.so
    libboost_fiber.so
    libboost_filesystem.so
    libboost_graph.so
    libboost_graph_parallel.so
    libboost_iostreams.so
    libboost_json.so
    libboost_locale.so
    libboost_log.so
    libboost_log_setup.so
    libboost_math_c99.so
    libboost_math_c99f.so
    libboost_math_c99l.so
    libboost_math_tr1.so
    libboost_math_tr1f.so
    libboost_math_tr1l.so
    libboost_mpi{,_python${python_version/.}}.so
    libboost_nowide.so
    libboost_numpy${python_version/.}.so
    libboost_prg_exec_monitor.so
    libboost_process.so
    libboost_program_options.so
    libboost_python${python_version/.}.so
    libboost_random.so
    libboost_regex.so
    libboost_serialization.so
    libboost_stacktrace_addr2line.so
    libboost_stacktrace_basic.so
    libboost_stacktrace_from_exception.so
    libboost_stacktrace_noop.so
    libboost_system.so
    libboost_thread.so
    libboost_timer.so
    libboost_type_erasure.so
    libboost_unit_test_framework.so
    libboost_url.so
    libboost_wave.so
    libboost_wserialization.so
  )

  install -dm755 "$pkgdir"/usr/lib
  cp -a fakeinstall/lib/*.so.* "$pkgdir"/usr/lib/

  # https://github.com/boostorg/mpi/issues/112
  local site_packages=/opt/boost1.86/python
  install -d "$pkgdir"$site_packages/boost
  touch "$pkgdir"$site_packages/boost/__init__.py
  python -m compileall -o 0 -o 1 -o 2 "$pkgdir"$site_packages/boost
  cp fakeinstall/lib/boost-python*/mpi.so "$pkgdir"$site_packages/boost/mpi.so
}

# vim:set ts=2 sw=2 et:
