# Maintainer: username227 <gfrank227 at gmail dot com>
# The pkgbuild is based on the original pkgbuild for citra.

pkgbase=('lime3ds')
_pkgname=Lime3DS
pkgname=lime3ds-git
pkgver=r10309.6e7cc65
pkgrel=1
arch=('x86_64')
pkgdesc='An experimental open-source Nintendo 3DS emulator/debugger'
url='https://github.com/Lime3DS/Lime3DS'
license=('GPL-3.0-or-later')
depends=('sdl2' 'mbedtls' 'speexdsp' 'qt6-multimedia' 'ffmpeg' 'libfdk-aac' 'libusb' 'openssl' 'glibc' 'gcc-libs' 'sndio' 'zstd' 'soundtouch' 'fmt' 'libinih' 'openal' 'enet')
makedepends=('git' 'cmake' 'python' 'doxygen' 'rapidjson' 'llvm' 'qt6-tools' 'gcc' 'glslang' 'vulkan-headers' 'nlohmann-json' 'catch2' 'clang')
options=('lto' '!buildflags')
source=("$_pkgname::git+https://github.com/Lime3DS/Lime3DS"
        "boost::git+https://github.com/blitzingeagle/ext-boost.git"
        "nihstro::git+https://github.com/neobrain/nihstro.git"
        "catch2::git+https://github.com/catchorg/Catch2.git"
        "soundtouch::git+https://codeberg.org/soundtouch/soundtouch.git"
        "dynarmic::git+https://github.com/blitzingeagle/dynarmic.git"
        "git+https://github.com/herumi/xbyak.git"
        "git+https://github.com/lsalzman/enet.git"
        "git+https://github.com/benhoyt/inih.git"
        "libressl::git+https://github.com/blitzingeagle/ext-libressl-portable.git"
        "git+https://github.com/libusb/libusb.git"
        "git+https://github.com/mozilla/cubeb"
        "git+https://github.com/blitzingeagle/discord-rpc.git"
        "git+https://github.com/arun11299/cpp-jwt.git"
        "git+https://github.com/wwylele/teakra.git"
        "git+https://github.com/lvandeve/lodepng.git"
        "git+https://github.com/facebook/zstd.git"
        "git+https://github.com/lemenkov/libyuv.git"
        "git+https://github.com/abdes/cryptopp-cmake.git"
        "git+https://github.com/weidai11/cryptopp.git"
        "git+https://github.com/kcat/openal-soft"
        "git+https://github.com/KhronosGroup/glslang"
        "vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator"
        "vulkan-headers::git+https://github.com/KhronosGroup/Vulkan-Headers"
        "git+https://github.com/blitzingeagle/sirit"
        "git+https://github.com/knik0/faad2"
        "library-headers::git+https://github.com/blitzingeagle/ext-library-headers.git"
        "git+https://github.com/bylaws/libadrenotools"
        "git+https://github.com/merryhime/oaknut.git"
        "git+https://github.com/septag/dds-ktx"
        "git+https://github.com/fmtlib/fmt.git"
        "sdl2::git+https://github.com/libsdl-org/SDL"
        # cubeb's submodule
        "git+https://github.com/google/googletest.git"
        "git+https://github.com/arsenm/sanitizers-cmake.git"
        #sirit's submodules
        "git+https://github.com/KhronosGroup/SPIRV-Headers.git"
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
         'SKIP')


pkgver() {
    cd "$srcdir/$_pkgname"
    #echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)" # Get canary version plus commit
}

prepare() {
    cd "$srcdir/$_pkgname"
    git submodule init
    for submodule in {boost,nihstro,catch2,soundtouch,dynarmic,xbyak,enet,inih,libressl,libusb,cubeb,discord-rpc,cpp-jwt,teakra,lodepng,zstd,libyuv,cryptopp-cmake,cryptopp,openal-soft,glslang,vma,vulkan-headers,sirit,faad2,library-headers,libadrenotools,oaknut,dds-ktx,fmt,sdl2};
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
    
    cd "$srcdir/Lime3DS"
    mkdir build
}

build() {
    cd "$srcdir/Lime3DS/build"
    
    # Fix to help cmake find libusb
    CXXFLAGS+=" -I/usr/include/libusb-1.0"
    
    #[[ -d build ]] && rm -rf build
    
    cmake ../

    cmake --build . -- -j"$(nproc)"
}

package() {   
    
    cd "$srcdir/Lime3DS/build"
    install -D -m 755 "$srcdir/Lime3DS/build/bin/Release/lime"       "$pkgdir/usr/bin/lime"
    install -D -m 755 "$srcdir/Lime3DS/build/bin/Release/lime-room"  "$pkgdir/usr/bin/lime-room"
    install -D -m 755 "$srcdir/Lime3DS/build/bin/Release/lime-qt"    "$pkgdir/usr/bin/lime-qt"
    install -D -m 644 "$srcdir/Lime3DS/dist/lime.png"        -t "$pkgdir/usr/share/pixmaps"
    install -D -m 644 "$srcdir/Lime3DS/dist/lime-qt.desktop" "$pkgdir/usr/share/applications/Lime3DS.desktop"
   
   
    # cd "$srcdir/"
    # DESTDIR="$pkgdir/" cmake --install build
    # rm -rf "$pkgdir/usr/include"
    # rm -rf "$pkgdir/usr/lib"
    # rm -rf "$pkgdir/usr/share/cmake"
}
