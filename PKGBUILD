# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgbase=boost174
pkgname=(
  boost174
  boost174-libs
)
pkgver=1.74.0
pkgrel=5
_srcname=boost_${pkgver//./_}
pkgdesc="Free peer-reviewed portable C++ source libraries (version 1.74)"
arch=(x86_64)
url="https://www.boost.org/"
license=(Boost)
makedepends=(
  icu
  python
  python-numpy
  bzip2
  openmpi
  zstd
)
source=(
  "https://boostorg.jfrog.io/artifactory/main/release/$pkgver/source/$_srcname.tar.bz2"
  "$pkgbase-ublas-c++20-allocator-patch1.patch::https://github.com/boostorg/ublas/commit/47a314dd01d1.patch"
  "$pkgbase-ublas-c++20-allocator-patch2.patch::https://github.com/boostorg/ublas/commit/a23a903f9a36.patch"
  "$pkgbase-ublas-c++20-iterator.patch::https://github.com/boostorg/ublas/commit/a31e5cffa85f.patch"
  "python311-compatibility.patch"
)
sha256sums=(
  '83bfc1507731a0906e387fc28b7ef5417d591429e51e788417fe9ff025e116b1'
  '3f42688a87c532ac916889f21a4487b9e94a38a047b18724385eaa474719a9f7'
  '67f413463a1a12bdf63c913acd318148dda618d3f994e466232e265bbf0c2903'
  'aa38addb40d5f44b4a8472029b475e7e6aef1c460509eb7d8edf03491dc1b5ee'
  '44fffaefa5a7785142b4deacd508ba5de23fa4aafde6cc66f3b697c07f498d5f'
)

prepare() {
  cd "$_srcname"

  # https://github.com/boostorg/ublas/issues/96
  patch -Np2 -i ../$pkgbase-ublas-c++20-allocator-patch1.patch
  patch -Np2 -i <(
    sed < ../$pkgbase-ublas-c++20-allocator-patch2.patch \
      's:test/:pls-apply-cleanly-kthxbai/libs/numeric/ublas/&:g'
  )

  # https://github.com/boostorg/ublas/pull/97
  patch -Np2 -i ../$pkgbase-ublas-c++20-iterator.patch

  patch -Np1 -i ../python311-compatibility.patch
}

build() {
  local JOBS
  local python_version

  # shellcheck disable=2001
  JOBS="$(sed 's/.*\(-j *[0-9]\+\).*/\1/' <<< "$MAKEFLAGS")"
  python_version=$(
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
  )

  pushd "$_srcname/tools/build"
  ./bootstrap.sh --cxxflags="$CXXFLAGS $LDFLAGS"
  ./b2 install --prefix="$srcdir"/fakeinstall
  ln -s b2 "$srcdir"/fakeinstall/bin/bjam
  popd

  cd "$_srcname"
  ./bootstrap.sh --with-toolset=gcc --with-icu --with-python=python3

  # support for OpenMPI
  echo "using mpi ;" >> project-config.jam

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
    python="$python_version" \
    cflags="$CPPFLAGS $CFLAGS -fPIC -O3 -ffat-lto-objects" \
    cxxflags="$CPPFLAGS $CXXFLAGS -fPIC -O3 -ffat-lto-objects" \
    linkflags="$LDFLAGS" \
    --layout=system \
    "$JOBS" \
    \
    --prefix="$srcdir"/fakeinstall
}

package_boost174() {
  local python_version
  python_version=$(
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
  )

  pkgdesc+=' (development headers)'
  depends=(
    boost174-libs
    glibc
    gcc-libs
  )
  optdepends=('python: for python bindings')
  options=('staticlibs')

  install -d "$pkgdir/opt/boost-$pkgver/lib/"
  cp -a fakeinstall/lib/*.{a,so} "$pkgdir/opt/boost-$pkgver/lib/"
  cp -a fakeinstall/lib/cmake "$pkgdir/opt/boost-$pkgver/lib/"
  cp -a fakeinstall/{bin,include,share} "$pkgdir/opt/boost-$pkgver/"

  for link in "$pkgdir/opt/boost-$pkgver/lib/"libboost_*.so; do
    target="$(readlink "$link")"
    ln -nfs "/usr/lib/$target" "$link"
  done

  # https://github.com/boostorg/python/issues/203#issuecomment-391477685
  for _lib in python numpy; do
    ln -srL "$pkgdir"/opt/boost-$pkgver/lib/libboost_${_lib}{"${python_version/./}","${python_version%.*}"}.so
  done
}

package_boost174-libs() {
  local python_version
  python_version=$(
    python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))'
  )

  pkgdesc+=' (runtime libraries)'
  depends=(
    bzip2
    gcc-libs
    glibc
    icu
    xz
    zlib
    zstd
  )
  optdepends=('openmpi: for mpi support')

  install -dm755 "$pkgdir"/usr/lib
  cp -a fakeinstall/lib/*.so.* "$pkgdir"/usr/lib/

  # https://github.com/boostorg/mpi/issues/112
  local site_packages
  site_packages=$(python -c 'import site; print(site.getsitepackages()[0])')
  install -d "$pkgdir$site_packages/boost174"
  touch "$pkgdir$site_packages/boost174/__init__.py"
  python -m compileall -o 0 -o 1 -o 2 "$pkgdir$site_packages/boost174"
  cp fakeinstall/lib/boost-python*/mpi.so "$pkgdir$site_packages/boost174/mpi.so"
}
