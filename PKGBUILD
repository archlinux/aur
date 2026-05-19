# Maintainer: Jimmy Källhagen
# Mail: TheEnchantedPotato@proton.me

#  ##==================================================================##
#   (     If you would like to participate in the Nordix project.      (
#    )                     you are most welcome                         )
#   (                                                                  (
#    )                        Nordix project                            )
#   (           https://github.com/jimmykallhagen/Nordix               (
#    )          https://github.com/jimmykallhagen/Yggdrasil             )
#   (           https://gitlab.com/TheEnchantedPotato/nordix           (
#    )                                                                  )
#   ##==================================================================##


_pkgname=nordix-optimized-ananicy-cpp
pkgname=nordix-optimized-ananicy-cpp
pkgver=1.2.0.r1.ga42a187
pkgrel=1
pkgdesc="Heavily CPU-Cache Optimized: 28%/42% more efficient than standard system/git version - and fix-missing-unistd-includes.patch"
arch=(x86_64)
url="https://gitlab.com/ananicy-cpp/ananicy-cpp"

license=('GPL-3.0-or-later')

depends=(
  gcc-libs
  glibc
  libbpf
  libelf
  libfmt.so
  libspdlog.so
  systemd
  systemd-libs
  zlib
  pcre2
)

makedepends=(
  bpf
  clang
  cmake
  git
  lld
  ninja
  nlohmann-json
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


source=("${_pkgname}::git+https://gitlab.com/ananicy-cpp/ananicy-cpp.git")
sha512sums=('SKIP')
provides=('nordix-optimized-ananicy-cpp')
conflicts=('ananicy-cpp' 'ananicy-cpp-git')


# fix-missing-unistd-includes.patch and  CMakeLists.txt performance patch
prepare() {
  cd "${srcdir}/${_pkgname}"
  
  # Fix missing unistd.h
  for file in \
    src/platform/systemd/service.cpp \
    src/platform/linux/process.cpp \
    src/platform/linux/debug.cpp
  do
    sed -i '1s/^/#include <unistd.h>\n/' "$file"
  done
  
  cat >> CMakeLists.txt << 'EOF'

# Force our optimization flags - overrides StandardProjectSettings
set(CMAKE_C_FLAGS "-include unistd.h -D_GNU_SOURCE -march=native -mtune=native -Os -pipe -fno-plt -fmerge-all-constants -fomit-frame-pointer -fno-unroll-loops -falign-functions=1 -falign-loops=1 -fno-math-errno -fno-trapping-math -fstack-protector -D_FORTIFY_SOURCE=1 -fdata-sections -ffunction-sections -flto=full" CACHE STRING "" FORCE)
set(CMAKE_CXX_FLAGS "-include unistd.h -D_GNU_SOURCE -march=native -mtune=native -Os -pipe -fno-plt -fmerge-all-constants -fomit-frame-pointer -fno-unroll-loops -falign-functions=1 -falign-loops=1 -fno-math-errno -fno-trapping-math -fstack-protector -D_FORTIFY_SOURCE=1 -fdata-sections -ffunction-sections -flto=full" CACHE STRING "" FORCE)
set(CMAKE_EXE_LINKER_FLAGS "-flto=full -fuse-ld=lld -Wl,-O3,--relax,--gc-sections,--strip-all -Wl,--lto-O3 -Wl,--lto-whole-program-visibility -Wl,--icf=all -Wl,-z,now -Wl,-z,relro -Wl,--build-id=none" CACHE STRING "" FORCE)
EOF
}

# Compiler
export CC=clang
export CXX=clang++

# Optimize for minimal cache footprint - keep ananicy as small as possible
# so it steals fewer cache-lines from the heavy processes it manages
# Compiler

export CC=clang
export CXX=clang++


# Full LTO
COMMON_FLAGS+=" -flto=full"

export CFLAGS="$COMMON_FLAGS"
export CXXFLAGS="$COMMON_FLAGS"

# Fix missing POSIX/GNU headers + optimize for minimal cache footprint
COMMON_FLAGS="-include unistd.h \
              -D_GNU_SOURCE \
              -march=native -mtune=native \
              -Os -pipe -fno-plt \
              -fmerge-all-constants \
              -fomit-frame-pointer \
              -fno-unroll-loops \
              -falign-functions=1 \
              -falign-loops=1 \
              -fno-math-errno -fno-trapping-math \
              -fstack-protector -D_FORTIFY_SOURCE=1"

# Linker
export LDFLAGS="-flto=full -fuse-ld=lld \
                -Wl,-O3,--relax,--gc-sections,--strip-all \
                -Wl,--lto-O3 \
                -Wl,--lto-whole-program-visibility \
                -Wl,--icf=all \
                -Wl,-z,now -Wl,-z,relro \
                -Wl,--build-id=none"

build() {
  cd "${srcdir}/${_pkgname}"

  cmake -S . -Bbuild \
        -GNinja \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_C_COMPILER="$CC" \
        -DCMAKE_CXX_COMPILER="$CXX" \
        -DCMAKE_C_FLAGS="$CFLAGS" \
        -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
        -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
        -DCMAKE_SHARED_LINKER_FLAGS="$LDFLAGS" \
        -DENABLE_CCACHE=OFF \
        -DENABLE_PGO=OFF \
        -DENABLE_SANITIZERS=OFF \
        -DENABLE_CPPCHECK=OFF \
        -DENABLE_CLANG_TIDY=OFF \
        -DUSE_EXTERNAL_SPDLOG=ON \
        -DUSE_EXTERNAL_JSON=ON \
        -DUSE_EXTERNAL_FMTLIB=ON \
        -DENABLE_SYSTEMD=ON \
        -DUSE_BPF_PROC_IMPL=ON \
        -DBPF_BUILD_LIBBPF=OFF \
        -DENABLE_REGEX_SUPPORT=ON

  cmake --build build --target ananicy-cpp -j$(nproc)
}

package() {
  cd "${srcdir}/${_pkgname}"
  DESTDIR="${pkgdir}" cmake --install build --component Runtime
  install -m755 -d "${pkgdir}/etc/ananicy.d"
}
