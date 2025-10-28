# Maintainer: Wabuo <Spam [.] Wabuo [at] GoogleMail [.] Com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com>

### Choose between the RELEASE type you are after
#pkgname=recoil_engine-git
pkgname=recoil_engine-rc
#pkgname=recoil_engine
pkgver=2025.06.07
pkgrel=1
pkgdesc="A powerful free cross-platform RTS game engine. (GitHub — lates Release Candidate tag). \
This version is used for public engine testing in BAR — Join the Discord if you want to help"
arch=('x86_64')
url="https://beyond-all-reason.github.io/RecoilEngine/"
_ghurl="https://github.com/beyond-all-reason/RecoilEngine"
### Only use _tag or _git_commit never use both at the same time! Default is neither to build latest master.
### https://github.com/beyond-all-reason/RecoilEngine/releases
#_git_commit='#commit=2bf7e22d2792236377c218f8c06e27ded2984f81'
#_tag="#tag=2025.04.11"
#_tag="#tag=2025.06.06"
#_tag="${pkgver}"

license=(
'GPL-2.0-or-later'

)
#conflicts=("${pkgname%-git}")
provides=("${pkgname}")
depends=('curl' 'sdl2' 'devil' 'p7zip' 'openal' 'libogg' 'libvorbis' 'libunwind' 'freetype2' 'glew' 'minizip' 'fontconfig' 'jsoncpp' )
makedepends=('git' 'curl' 'jq'
             'ninja' 'lld' 'socat' 'clang' 'python-pip' 'cmake3' 'ccache'
             'compdb' 'gflags')
optdepends=('bar-lobby' 'bar-lobby-git')
#install="${pkgname%-git}.install"
source=("${pkgname%-git}::git+${_ghurl}.git${_tag}${_git_commit}"
#        "${pkgname%-git}.sh"
)
sha256sums=('SKIP')

###
### This PGKGBUILD implements the build instructions from https://github.com/beyond-all-reason/RecoilEngine/wiki/Building-and-developing-engine-without-docker
###

pkgver() {
  # Set the repository owner and name
  local owner="beyond-all-reason"
  local repo="RecoilEngine"

  # Use the GitHub API to get the latest *release*, which includes prereleases.
  # We fetch the first page (up to 30 releases) and pipe it to jq.
  # The 'latest_tag' variable will hold the version string.
  local latest_tag
  
  # --- MODIFIED API CALL AND JQ FILTER ---
  # Filters for the first entry where "prerelease" is true and extracts the tag_name.
  latest_tag=$(curl -s "https://api.github.com/repos/${owner}/${repo}/releases" | \
    jq -r 'map(select(.prerelease == true)) | .[0].tag_name' 2>/dev/null)
  # ---------------------------------------

  if [[ -n "$latest_tag" && "$latest_tag" != "null" ]]; then
    # Clean the version number for PKGBUILD standard (replaces hyphens with underscores)
    printf "%s" "${latest_tag//-/_}"
  else
    # Fail loud and hard incase we cant get a tag to checkout
    exit 1
  fi
}

_get_pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    _pkgver=$(git describe --tags | sed 's/^v//;s/-.*//')
}



prepare() {
    _tag="${pkgver}"

    cd "${srcdir}/${pkgname%-git}"
    git checkout  "${_tag}"
    git submodule update --init --recursive

    mkdir toolchain

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

echo "_pkgver is: ${_pkgver} @@@@@@@@@@@@@@@@@@@@@@@@@@"

### use the AUR package instead
##  pip install compdb

                                #-G Ninja -G "Unix Makefiles"
    cmake3 -S "${pkgname%-git}"  -G Ninja \
	    -DCMAKE_TOOLCHAIN_FILE="toolchain/clang_x86_64-pc-linux-gnu.cmake" \
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

# V=1 make VERBOSE=1 -j1
	ninja #--verbose
}


package() {

    cd "${srcdir}/${pkgname%-git}"
    git submodule update --init --recursive
    
    cd "${srcdir}"
    ninja install

_get_pkgver ### Get short pkgver to name engine properly.

### The Lobby only recognizes engines following the official versioning scheme!
### adding .local to the end of the name allows us to name it however we want!
mkdir -p "${pkgdir}/usr/share/recoil-engine"
mv ${srcdir}/install "${srcdir}/stemwide_managed_by_pkgmngr-${_pkgver}.local"
cp --reflink=auto --no-preserve=ownership --recursive --no-dereference "${srcdir}/stemwide_managed_by_pkgmngr-${_pkgver}.local" "${pkgdir}/usr/share/recoil-engine/"

}

# vim:set ts=4 sw=4 et:

