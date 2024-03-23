# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_android_arch=armv7a-eabi
pkgname=android-${_android_arch}-boost
pkgver=1.84.0
pkgrel=1
_srcname=boost_${pkgver//./_}
arch=('any')
pkgdesc="Free peer-reviewed portable C++ source libraries (Android, ${_android_arch})"
url="https://www.boost.org/"
license=('custom')
depends=("android-${_android_arch}-bzip2"
         "android-${_android_arch}-icu"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-zstd")
makedepends=('android-environment')
if [[ $_android_arch == aarch64 ]] || [[ $_android_arch == x86-64 ]]; then
makedepends+=("android-${_android_arch}-openmpi")
optdepends+=("android-${_android_arch}-openmpi: for mpi support")
fi
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://boostorg.jfrog.io/artifactory/main/release/$pkgver/source/$_srcname.tar.bz2"
        "boost-1.81.0-phoenix-multiple-definitions.patch"
        "boost-ublas-c++20-iterator.patch::https://github.com/boostorg/ublas/commit/a31e5cffa85f.patch"
        "disable-version-check.patch")
md5sums=('9dcd632441e4da04a461082ebbafd337'
         'cb1c25777e9b85af62366e7c930244b8'
         '326826bf610c63c23247e70e648ff104'
         '6290eb4fa0cab451aac92e12e85ef073')

prepare() {
  cd "${srcdir}/$_srcname"
  source android-env ${_android_arch}

  # https://github.com/boostorg/phoenix/issues/111
  patch -Np1 -i ../boost-1.81.0-phoenix-multiple-definitions.patch

  # https://github.com/boostorg/ublas/pull/97
  patch -Np2 -i ../boost-ublas-c++20-iterator.patch
  patch -p1 -i ../disable-version-check.patch
}

build() {
  cd "${srcdir}/$_srcname"
  source android-env ${_android_arch}

  # Platform specific patches
  case "$_android_arch" in
      aarch64)
          _boost_arch=arm
          _boost_address_model=64
          ;;
      armv7a-eabi)
          _boost_arch=arm
          _boost_address_model=32
          ;;
      x86)
          _boost_arch=x86
          _boost_address_model=32
          ;;
      x86-64)
          _boost_arch=x86
          _boost_address_model=64
          ;;
      *)
          ;;
  esac

  ./bootstrap.sh -with-toolset=gcc

  # support for OpenMPI
  if [[ _boost_address_model == 64 ]]; then
    _boost_mpi='using mpi ;'
  else
    _boost_mpi=''
  fi

  userConfigs=$srcdir/$_srcname/user-config.jam

  cat << EOF > "${userConfigs}"
${_boost_mpi}
using clang : android : ${ANDROID_CXX} :
<archiver>${ANDROID_AR} \
<assembler>${ANDROID_AS}
;
EOF

  ./b2 install \
      --prefix="$srcdir/fakeinstall" \
      --user-config="${userConfigs}" \
      --layout=system \
      --with-atomic \
      --with-chrono \
      --with-container \
      --with-date_time \
      --with-exception \
      --with-fiber \
      --with-filesystem \
      --with-graph \
      --with-graph_parallel \
      --with-iostreams \
      --with-locale \
      --with-log \
      --with-math \
      --with-mpi \
      --with-program_options \
      --with-random \
      --with-regex \
      --with-serialization \
      --with-system \
      --with-test \
      --with-thread \
      --with-timer \
      --with-type_erasure \
      --with-wave \
      --with-stacktrace \
      -sICONV_PATH="${ANDROID_PREFIX}" \
      variant=release \
      debug-symbols=off \
      runtime-link=shared \
      link=shared,static \
      target-os=android \
      toolset=clang-android \
      architecture=$_boost_arch \
      threading=multi \
      address-model=$_boost_address_model \
      cflags="${CXXFLAGS}" \
      cxxflags="${CFLAGS}" \
      linkflags="${LDFLAGS}"
}

package() {
  cd "${srcdir}/$_srcname"
  source android-env ${_android_arch}

  find "${srcdir}/fakeinstall"/lib -iname '*.a' -exec $ANDROID_STRIP -g {} \;
  find "${srcdir}/fakeinstall"/lib -iname '*.so' -exec $ANDROID_STRIP --strip-unneeded {} \;

  install -dm755 "$pkgdir/${ANDROID_PREFIX_LIB}/"
  cp -a "${srcdir}/fakeinstall"/lib/*.{a,so} "$pkgdir/${ANDROID_PREFIX_LIB}/"
  cp -a "${srcdir}/fakeinstall"/lib/cmake "$pkgdir/${ANDROID_PREFIX_LIB}/"
  cp -a "${srcdir}/fakeinstall"/include "$pkgdir/${ANDROID_PREFIX}/"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE_1_0.txt
}
