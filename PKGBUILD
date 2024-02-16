# Maintainer: HurricanePootis<hurricanepootis@protonmail.com>
# Contributor: Tim Schumacher <timschumi@gmx.de>
# Contributor: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
# Contributor: ceri
# Contributor: Imperator Storm <30777770+ImperatorStorm@users.noreply.github.com>

_pkgbase='citra'
pkgbase="$_pkgbase-git"
pkgname=("$_pkgbase-git" "$_pkgbase-qt-git")
pkgver=r10020.7638f87f7
pkgrel=1
pkgdesc="An experimental open-source Nintendo 3DS emulator/debugger"
arch=('i686' 'x86_64')
url="https://github.com/citra-emu/citra/"
_debug=false #Set debug to true to build citra so it can be debugged with gdb.
if [ $_debug = "false" ]
then
    options=("lto" "strip" "!debug")
    _cmake_build_type=Release
    _enable_lto=ON
else
    options=("!lto" "!strip" "debug")
    _cmake_build_type=Debug
    _enable_lto=off
fi
license=('GPL2')
depends=('ffmpeg' 'speexdsp' 'mbedtls' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'libfdk-aac' 'sndio' 'libbacktrace-git' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'qt6-multimedia' 'gcc' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang')
source=("$_pkgbase::git+https://github.com/citra-emu/citra.git"
        "boost::git+https://github.com/citra-emu/ext-boost.git"
        "nihstro::git+https://github.com/neobrain/nihstro.git"
        "soundtouch::git+https://codeberg.org/soundtouch/soundtouch.git"
        "catch2::git+https://github.com/catchorg/Catch2.git"
        "dynarmic::git+https://github.com/merryhime/dynarmic.git"
        "git+https://github.com/herumi/xbyak.git"
        "git+https://github.com/fmtlib/fmt.git"
        "git+https://github.com/lsalzman/enet.git"
        "git+https://github.com/benhoyt/inih.git"
        "libressl::git+https://github.com/citra-emu/ext-libressl-portable.git"
        "git+https://github.com/libusb/libusb.git"
        "git+https://github.com/mozilla/cubeb.git"
        "git+https://github.com/yuzu-emu/discord-rpc.git"
        "git+https://github.com/arun11299/cpp-jwt.git"
        "git+https://github.com/wwylele/teakra.git"
        "git+https://github.com/lvandeve/lodepng.git"
        "git+https://github.com/facebook/zstd.git"
        "git+https://github.com/lemenkov/libyuv.git"
        "sdl2::git+https://github.com/libsdl-org/SDL"
        "git+https://github.com/abdes/cryptopp-cmake.git"
        "git+https://github.com/weidai11/cryptopp.git"
        "git+https://github.com/septag/dds-ktx.git"
        "git+https://github.com/kcat/openal-soft.git"
        "git+https://github.com/KhronosGroup/glslang.git"
        "vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
        "vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers.git"
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
        "git+https://github.com/yuzu-emu/sirit.git"
        "git+https://github.com/knik0/faad2.git"
        "library-headers::git+https://github.com/citra-emu/ext-library-headers.git"
        "git+https://github.com/bylaws/libadrenotools.git"
        "git+https://github.com/merryhime/oaknut.git"
        # cubeb's submodule
        "git+https://github.com/google/googletest.git"
        "git+https://github.com/arsenm/sanitizers-cmake.git"
        #dynarmic's zydis submodule
        "zycore::git+https://github.com/zyantific/zycore-c.git"
        #libadrenotools' submodule
        "git+https://github.com/bylaws/liblinkernsbypass.git"
        )
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
         'SKIP'
         'SKIP')

pkgver() {
    cd "$srcdir/$_pkgbase"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgbase"
    git submodule init
    for submodule in {boost,nihstro,soundtouch,catch2,dynarmic,xbyak,fmt,enet,libressl,cubeb,discord-rpc,cpp-jwt,teakra,zstd,libyuv,cryptopp-cmake,cryptopp,dds-ktx,sdl2,lodepng,libusb,inih,openal-soft,glslang,vma,vulkan-headers,sirit,faad2,library-headers,libadrenotools,oaknut};
    do
    git config submodule.${submodule}.url "$srcdir/${submodule}"
    done
    git -c protocol.file.allow=always submodule update


    cd "$srcdir/$_pkgbase/externals/cubeb"
    git submodule init
    git config submodule.googletest.url "$srcdir/googletest"
    git config submodule."cmake/sanitizers-cmake".url "$srcdir/sanitizers-cmake"
    git -c protocol.file.allow=always submodule update


    cd "$srcdir/$_pkgbase/externals/sirit/"
    git submodule init
    git config submodule.externals/SPIRV-Headers.url "$srcdir/SPIRV-Headers"
    git -c protocol.file.allow=always submodule update

    cd "$srcdir/$_pkgbase/externals/dynarmic/externals/zydis"
    git submodule init
    git config submodule.dependencies/zycore.url "$srcdir/zycore"
    git -c protocol.file.allow=always submodule update

    cd "$srcdir/$_pkgbase/externals/libadrenotools/"
    git submodule init
    git config submodule.lib/linkernsbypass.url "$srcdir/liblinkernsbypass"
    git -c protocol.file.allow=always submodule update


}

build() {
    cd "$srcdir/"
    
    # Trick the compiler into thinking we're building from a continuous
    # integration tool so the build number is correctly shown in the title
    #export CI=true
    #export TRAVIS=true
    #export TRAVIS_REPO_SLUG=citra-emu/citra-canary
    #export TRAVIS_TAG=$(git describe --tags)
    
    # Fix to help cmake find libusb
    CXXFLAGS+=" -I/usr/include/libusb-1.0"
    
    #[[ -d build ]] && rm -rf build

    cmake -B build -S "$_pkgbase" \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE=$_cmake_build_type \
      -DENABLE_LTO=$_enable_lto \
      -DENABLE_QT_TRANSLATION=ON \
      -DCITRA_ENABLE_COMPATIBILITY_REPORTING=ON \
      -DENABLE_COMPATIBILITY_LIST_DOWNLOAD=ON \
      -DUSE_DISCORD_PRESENCE=ON \
      -DUSE_SYSTEM_BOOST=OFF \
      -DUSE_SYSTEM_CATCH2=ON \
      -DUSE_SYSTEM_CPP_HTTPLIB=OFF \
      -DUSE_SYSTEM_CPP_JWT=OFF \
      -DUSE_SYSTEM_CRYPTOPP=OFF \
      -DUSE_SYSTEM_CUBEB=OFF \
      -DUSE_SYSTEM_DYNARMIC=OFF \
      -DUSE_SYSTEM_ENET=ON \
      -DUSE_SYSTEM_FFMPEG_HEADERS=ON \
      -DUSE_SYSTEM_FMT=ON \
      -DUSE_SYSTEM_GLSLANG=OFF \
      -DUSE_SYSTEM_INIH=ON \
      -DUSE_SYSTEM_JSON=ON \
      -DUSE_SYSTEM_LIBUSB=ON \
      -DUSE_SYSTEM_LODEPNG=OFF \
      -DUSE_SYSTEM_OPENAL=OFF \
      -DUSE_SYSTEM_SDL2=ON \
      -DUSE_SYSTEM_SOUNDTOUCH=ON \
      -DUSE_SYSTEM_VMA=OFF \
      -DUSE_SYSTEM_VULKAN_HEADERS=OFF \
      -DUSE_SYSTEM_XBYAK=OFF \
      -DUSE_SYSTEM_ZSTD=ON \
      -DCMAKE_C_COMPILER=gcc \
      -DCMAKE_CXX_COMPILER=g++ \
      -DCMAKE_C_FLAGS="$CFLAGS" \
      -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
      -Wno-dev

    cmake --build build   
}

check() {
    ctest --test-dir build
}

package_citra-git() {
	depends+=('sdl2' 'libinih')

        if [ $_debug = "false" ]; then
            install -Dm755 "$srcdir/build/bin/Release/citra" "$pkgdir/usr/bin/citra"
        else
            install -Dm755 "$srcdir/build/bin/Debug/citra" "$pkgdir/usr/bin/citra"
        fi
}

package_citra-qt-git() {
	depends+=('qt6-base' 'qt6-multimedia' 'sdl2' 'hicolor-icon-theme')
	optdepends=('libxkbcommon-x11: for X11 support'
	            'qt6-wayland: for Wayland support')

	cd "$srcdir"
	DESTDIR="$pkgdir/" cmake --install build
	rm "$pkgdir/usr/bin/citra"

	# Remove global installations of dependencies
	rm -rf "${pkgdir}/usr/include" "${pkgdir}/usr/lib"
}
