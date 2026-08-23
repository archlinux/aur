# Maintainer: Wabuo <Spam [.] Wabuo [at] GoogleMail [.] Com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>

###
### This PGKGBUILD implements the build instructions from https://github.com/beyond-all-reason/RecoilEngine/wiki/Building-and-developing-engine-without-docker
###

pkgname=recoil-engine-rc
pkgver=VERSION # This will be automatically updated by makepkg via pkgver()
pkgrel=1
pkgdesc="A powerful free cross-platform RTS game engine. (GitHub — latest Release Candidate tag). \
This version is used for public engine testing in BAR — Join the Discord if you want to help"
arch=('x86_64')
url="https://beyond-all-reason.github.io/RecoilEngine/"
_ghurl="https://github.com/beyond-all-reason/RecoilEngine"
### Only use _tag or _git_commit never use both at the same time! Default is neither to build the latest Pre-release.
### https://github.com/beyond-all-reason/RecoilEngine/releases
#_git_commit='#commit=2bf7e22d2792236377c218f8c06e27ded2984f81'
#_tag="#tag=2025.04.11"
#_tag="#tag=2025.06.06"

options=(debug !strip)

license=('GPL-2.0-or-later')
#conflicts=("${pkgname%-git}") ### Not needed, multiple versions of the engine can be installed besides each other
depends=('curl' 'sdl2' 'devil' 'p7zip' 'openal' 'libogg' 'libvorbis' 'libunwind' 'freetype2' 'glew' 'minizip' 'fontconfig' 'jsoncpp' )
makedepends=('git' 'curl' 'jq'
             'ccache' ### curently wont build without
             'ninja' 'socat' 'python-pip' 'cmake3-bin'
#            'clang' 'lld' ### Only needed if you want to build with the included clang toolchain
             'compdb' 'gflags')
optdepends=('bar-lobby' 'bar-lobby-git')
#install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${_ghurl}.git${_tag}${_git_commit}"
        "guard-invalid-ray-length.patch"
        "buildcache.patch"
)
sha256sums=('SKIP'
            'f1ec1a8d70f05a9e917cf9edbc4274a7a5efe81dbc51ddfb6778040f65ec33f2'
            '8c9af0eb1089d2531f5e511292fdde82aef53747b2314104baa850075465035c'
)

pkgver() {
  # Set the repository owner and name
  local owner="beyond-all-reason"
  local repo="RecoilEngine"

  # Use the GitHub API to get the latest *release*, which includes prereleases.
  # We fetch the first page (up to 30 releases) and pipe it to jq.
  # The 'latest_tag' variable will hold the version string.
  local latest_tag

  # Filters for the first entry where "prerelease" is true and extracts the tag_name.
  latest_tag=$(curl -s "https://api.github.com/repos/${owner}/${repo}/releases" | \
    jq -r 'map(select(.prerelease == true)) | .[0].tag_name' 2>/dev/null)

  if [[ -n "$latest_tag" && "$latest_tag" != "null" ]]; then
    # Clean the version number for PKGBUILD standard (replaces hyphens with underscores)
    printf "%s" "${latest_tag//-/_}"
  else
    # Fail loud and hard in case we can't get a tag to checkout
    echo "FATAL: could not get a tag to checkout, something went horribly wrong!"
    exit 1
  fi
}

_get_pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    _pkgver=$(git describe --tags | sed 's/^v//;s/-.*//')
}



prepare() {

### Toolchains are curently not used in favour makepkg.conf

    mkdir -p toolchain

cat > toolchain/clang_x86_64-pc-linux-gnu.cmake<< EOF
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_C_COMPILER "clang")
SET(CMAKE_CXX_COMPILER "clang++")
SET(CMAKE_EXE_LINKER_FLAGS_INIT "-fuse-ld=lld")
SET(CMAKE_MODULE_LINKER_FLAGS_INIT "-fuse-ld=lld")
SET(CMAKE_SHARED_LINKER_FLAGS_INIT "-fuse-ld=lld")
EOF

cat > toolchain/gcc_x86_64-pc-linux-gnu.cmake<< EOF
SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_C_COMPILER "gcc")
SET(CMAKE_CXX_COMPILER "g++")
SET(CMAKE_EXE_LINKER_FLAGS_INIT "-fuse-ld=lld")
SET(CMAKE_MODULE_LINKER_FLAGS_INIT "-fuse-ld=lld")
SET(CMAKE_SHARED_LINKER_FLAGS_INIT "-fuse-ld=lld")
EOF

### Failed attempt at getting it to build with CMake 4.x.x
#########################################################

#    echo "in toolchain @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
#    ls ./toolchain

#    sed -i 's/(SET CMP0060 OLD)/(SET CMP0060 NEW)/g' CMakeLists.txt
#    sed -i 's/(SET CMP0065 OLD)/(SET CMP0065 NEW)/g' CMakeLists.txt
#    sed -i 's/cmake_minimum_required(VERSION 3\.0)/cmake_minimum_required(VERSION 3.0...4.1.2)/' rts/lib/glad/CMakeLists.txt
#    sed -i 's/ADD_SUBDIRECTORY(gflags)/#ADD_SUBDIRECTORY(gflags)/' rts/lib/CMakeLists.txt
#    sed -i 's/CMAKE_MINIMUM_REQUIRED( VERSION 2.8 )/cmake_minimum_required(VERSION 2.8...4.1.2)/' rts/lib/assimp/CMakeLists.txt
#    sed -i 's/cmake_minimum_required( VERSION 2.6 )/cmake_minimum_required(VERSION 2.6...4.1.2)/' rts/lib/assimp/code/CMakeLists.txt
#    sed -i 's/cmake_minimum_required(VERSION 3.3)/cmake_minimum_required(VERSION 3.3...4.1.2)/' rts/lib/lunasvg/CMakeLists.txt
#    sed -i 's/cmake_minimum_required(VERSION 3.0)/cmake_minimum_required(VERSION 3.0...4.1.2)/' test/lib/catch2/CMakeLists.txt
#    sed -i ':a; N; $!ba; s/\n\s*//g; s/ gflags_nothreads_static/gflags_nothreads_static/' rts/CMakeLists.txt
#    sed -i '/find_package_static(ZLIB/a find_package(gflags REQUIRED)' rts/CMakeLists.txt

    # find_package(gflags REQUIRED)
    # find_package(gflags COMPONENTS nothreads_static)


    #echo "head ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    #head -n 10 rts/lib/lunasvg/CMakeLists.txt
    #echo "head ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"

}

build() {
    ### Checks if _tag is set. If it is not set (or is empty), it will use the value of ${pkgver}
    ### Default behavior should be that _tag is unset and therefore gets set to ${pkgver}
    _tag="${_tag:-${pkgver}}"


    cd "${srcdir}/${pkgname%-git}"
    git checkout  "${_tag}"
    git submodule update --init --recursive

    ### Local stopgap until upstream fixes https://github.com/beyond-all-reason/RecoilEngine/issues/3018
    ### Guards CQuadField::GetQuadsOnRay/GetQuadsOnWideRay against invalid ray lengths, which abort
    ### hardened builds (_GLIBCXX_ASSERTIONS) via std::clamp preconditions. REMOVE once merged upstream.
    patch -Np1 -i "${srcdir}/guard-invalid-ray-length.patch"

    ### Stopgap for buildCache returning wrongly-sized statuses buffers (crashes with
    ### '__n < this->size()' assert when cycling buildings over the same minimap spot).
    ### Root cause: cache key omits the unitDef. REMOVE once fixed upstream.
    patch -Np1 -i "${srcdir}/buildcache.patch"

    # Fix 1: Missing <cstdint> for UINT8_MAX
    sed -i '/#include <string>/i #include <cstdint>' rts/Game/ChatMessage.h
    # === FIX 2: Missing header for Linux SYSCALL's===
    sed -i '1i #include <unistd.h>' test/other/testMutex.cpp
    cd "${srcdir}"


    ### use the AUR package instead
    ##  pip install compdb



    ## For deeper debugin switch to:
      # -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-O2 -g -fno-omit-frame-pointer -DNDEBUG -fdiagnostics-color=always" \
      # -DCMAKE_C_FLAGS_RELWITHDEBINFO="-O2 -g -fno-omit-frame-pointer -DNDEBUG -fdiagnostics-color=always" \

    #Defaults are:
      #-DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-O3 -g -DNDEBUG -fdiagnostics-color=always" \
      #-DCMAKE_C_FLAGS_RELWITHDEBINFO="-O3 -g -DNDEBUG -fdiagnostics-color=always" \

										###-G Ninja | -G "Unix Makefiles"
    cmake3 -S "${srcdir}/${pkgname%-git}"  -G Ninja \
            -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
            -DCMAKE_CXX_FLAGS_RELWITHDEBINFO="-O3 -g -DNDEBUG -fdiagnostics-color=always" \
            -DCMAKE_C_FLAGS_RELWITHDEBINFO="-O3 -g -DNDEBUG -fdiagnostics-color=always" \
            -DCMAKE_BUILD_TYPE=RELWITHDEBINFO \
            -DAI_TYPES=NATIVE \
            -DINSTALL_PORTABLE=ON \
            -DCMAKE_USE_RELATIVE_PATHS:BOOL=1 \
            -DBINDIR:PATH=./ \
            -DLIBDIR:PATH=./ \
            -DDATADIR:PATH=./ \
            -DCMAKE_INSTALL_PREFIX="$(pwd)/install"
### Disabled in favor of using the settings from makepkg.conf
#           -DCMAKE_TOOLCHAIN_FILE="toolchain/clang_x86_64-pc-linux-gnu.cmake" \

# V=1 make VERBOSE=1 -j1
        cd "${srcdir}"; ninja #--verbose
}


package() {

    cd "${srcdir}/${pkgname%-git}"
    git submodule update --init --recursive

    cd "${srcdir}"
    ninja install

    _get_pkgver ### Get short pkgver to name engine properly.

    ### The Lobby only recognizes engines following the official versioning scheme!
    ### adding .local to the end of the name allows us to name it however we want.
    mkdir -p "${pkgdir}/usr/share/recoil-engine"

    ### Check if the folder already exists and if so delete it — this is needed for dirty rebuilds
    if [ -d "${srcdir}/systemwide_managed_by_pkgmngr-${_pkgver}-RC.local" ]; then
        rm -rd "${srcdir}/systemwide_managed_by_pkgmngr-${_pkgver}-RC.local"
    fi
    ### rename install folder aka give the engine folder a decent name that will be recognized by bar-lobby
    ### naming the engine folder with .local at the end allows us to name it how ever we want
    ### otherwise bar-lobby will only recognize folders named after the official versioning scheme
    mv --force ${srcdir}/install "${srcdir}/systemwide_managed_by_pkgmngr-${_pkgver}-RC.local"
    cp --reflink=auto --no-preserve=ownership --recursive --no-dereference "${srcdir}/systemwide_managed_by_pkgmngr-${_pkgver}-RC.local" "${pkgdir}/usr/share/recoil-engine/"

}

# vim:set ts=4 sw=4 et:
