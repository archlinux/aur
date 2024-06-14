# Maintainer: username227 <gfrank227 at gmail dot com>

_pkgver=de1f082
_date=20240601
_pkgname=citra
pkgname=citra-git
pkgver=r10073.09dc3a5
pkgrel=1
arch=('x86_64')
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
url='https://github.com/PabloMK7/citra'
license=('GPL-2.0')
depends=('sdl2' 'mbedtls' 'speexdsp' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang' 'libc++' 'ninja')
conflicts=('citra-appimage')
options=('lto' '!buildflags')
source=("git+https://github.com/PabloMK7/citra"
	"boost::git+https://github.com/PabloMK7/ext-boost.git"
	"git+https://github.com/neobrain/nihstro.git"
	"git+https://codeberg.org/soundtouch/soundtouch.git"
	"catch2::git+https://github.com/catchorg/Catch2"
	"git+https://github.com/PabloMK7/dynarmic.git"
	"git+https://github.com/herumi/xbyak.git"
	"git+https://github.com/fmtlib/fmt.git"
	"git+https://github.com/lsalzman/enet.git"
	"git+https://github.com/benhoyt/inih.git"
	"libressl::git+https://github.com/PabloMK7/ext-libressl-portable.git"
	"git+https://github.com/libusb/libusb.git"
	"git+https://github.com/mozilla/cubeb"
	"git+https://github.com/PabloMK7/discord-rpc.git"
	"git+https://github.com/arun11299/cpp-jwt.git"
	"git+https://github.com/wwylele/teakra.git"
	"git+https://github.com/lvandeve/lodepng.git"
	"git+https://github.com/facebook/zstd.git"
	"git+https://github.com/lemenkov/libyuv.git"
	"sdl2::git+https://github.com/libsdl-org/SDL"
	"git+https://github.com/abdes/cryptopp-cmake.git"
	"git+https://github.com/weidai11/cryptopp.git"
	"git+https://github.com/septag/dds-ktx"
	"git+https://github.com/kcat/openal-soft"
	"git+https://github.com/KhronosGroup/glslang"
	"vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator"
	"vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers"
	"git+https://github.com/PabloMK7/sirit"
	"git+https://github.com/knik0/faad2"
	"library-headers::git+https://github.com/PabloMK7/ext-library-headers.git"
	"git+https://github.com/bylaws/libadrenotools"
	"git+https://github.com/merryhime/oaknut.git"
	"git+https://github.com/google/googletest" # cubeb
	"git+https://github.com/arsenm/sanitizers-cmake" # cubeb
	"git+https://github.com/KhronosGroup/SPIRV-Headers" # sirit
	"git+https://github.com/bylaws/liblinkernsbypass") # libadrenotools
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    #echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)" # Get canary version plus commit
}

prepare() {
    cd "$srcdir/$_pkgname"
    git submodule init
    for submodule in {boost,nihstro,catch2,soundtouch,dynarmic,xbyak,fmt,enet,inih,libressl,libusb,cubeb,discord-rpc,cpp-jwt,teakra,lodepng,zstd,libyuv,sdl2,cryptopp-cmake,cryptopp,dds-ktx,openal-soft,glslang,vma,vulkan-headers,sirit,faad2,library-headers,libadrenotools,oaknut};
    do
    git config submodule.${submodule}.url "$srcdir/${submodule}"
    done
    git -c protocol.file.allow=always submodule update

    cd "$srcdir/$_pkgname/externals/cubeb"
    git submodule init
    git config submodule.googletest.url "$srcdir/googletest"
    git config submodule."cmake/sanitizers-cmake".url "$srcdir/sanitizers-cmake"
    git -c protocol.file.allow=always submodule update

    cd "$srcdir/$_pkgname/externals/sirit/"
    git submodule init
    git config submodule.externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
    git -c protocol.file.allow=always submodule update

    cd "$srcdir/$_pkgname/externals/libadrenotools/"
    git submodule init
    git config submodule.lib/linkernsbypass.url "$srcdir/liblinkernsbypass"
    git -c protocol.file.allow=always submodule update 
}

build() {
    # Fix to help cmake find libusb
    CXXFLAGS+=" -I/usr/lib/libusb-1.0"
    
    cmake -B build -S "$_pkgname" -G Ninja \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_BUILD_TYPE=Release \
    	-DCMAKE_CXX_COMPILER=clang++ \
    	-DCMAKE_C_COMPILER=clang \
    	-DENABLE_QT_TRANSLATION=ON \
    	-DUSE_DISCORD_PRESENCE=ON \
    	-DCMAKE_CXX_FLAGS="-O2" \
    	-DCMAKE_C_FLAGS="-O2"
    cd build
    ninja
}

package() {
    DESTDIR="$pkgdir/" ninja -C build install
}
