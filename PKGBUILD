# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_android_arch=aarch64
pkgname=android-${_android_arch}-boost
pkgver=1.88.0
pkgrel=1
_srcname=boost_${pkgver//./_}
arch=('any')
pkgdesc="Free peer-reviewed portable C++ source libraries (Android, ${_android_arch})"
url="https://www.boost.org/"
license=('BSL-1.0')
depends=("android-${_android_arch}-bzip2"
         "android-${_android_arch}-icu"
         "android-${_android_arch}-zlib"
         "android-${_android_arch}-zstd")
makedepends=('android-environment')
options=(!strip !buildflags staticlibs !emptydirs)
source=("https://archives.boost.io/release/${pkgver}/source/${_srcname}.tar.bz2"
        "disable-version-check.patch")
sha256sums=('46d9d2c06637b219270877c9e16155cbd015b6dc84349af064c088e9b5b12f7b'
            '63d12e7d703b471882608b4225c489f6a35ab425602783a4f9c4ea99a10f9c4b')

prepare() {
  cd "${srcdir}/$_srcname"
  source android-env ${_android_arch}
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
