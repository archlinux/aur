# Maintainer: HamletDuFromage <https://github.com/HamletDuFromage/slippi-mainline-git-PKGBUILD/issues>

_projectname='slippi'
_mainpkgname="$_projectname-mainline"
pkgbase="$_mainpkgname-git"
pkgname=("$pkgbase")
pkgver='v4.0.0.mainline.beta.4.r0.g4a06679391'
pkgrel=1
pkgdesc='https://slippi.gg/about'
arch=('x86_64')
url="https://github.com/project-slippi/dolphin"
license=('GPL2')
depends=('alsa-lib'
         'bluez-libs'
         'bzip2'
         'enet'
         'gcc-libs'
         'glibc'
         'hidapi'
         'libavcodec.so'
         'libavformat.so'
         'libavutil.so'
         'libcurl.so'
         'libevdev'
         'libfmt.so'
         'libgl'
         'libpulse'
         'libsfml-network.so'
         'libsfml-system.so'
         'libspng.so'
         'libswscale.so'
         'libudev.so'
         'libusb-1.0.so'
         'libx11'
         'libxi'
         'libxrandr'
         'libxxhash.so'
         'lzo'
         'mbedtls2'
         'pugixml'
         'qt6-base'
         'qt6-svg'
         'sfml'
         'speexdsp'
         'xz'
         'zlib-ng'
         'zstd'
)

makedepends=('cmake' 'git' 'miniupnpc' 'ninja' 'python' 'qt6-base' 'qt6-svg' 'cargo')
optdepends=('pulseaudio: PulseAudio backend')
options=('!lto')

#commit='bdd90056759b59928f21d6e8f21697c4df0ee04d'
tag='v4.0.0-mainline-beta.4'

source=(
        #"$pkgname::git+https://github.com/project-slippi/dolphin.git#commit=${commit}"
        "$pkgname::git+https://github.com/project-slippi/dolphin.git#tag=${tag}"
        "$pkgname-implot::git+https://github.com/epezent/implot.git"
        "$pkgname-rcheevos::git+https://github.com/RetroAchievements/rcheevos.git"
        "$pkgname-corrosion::git+https://github.com/corrosion-rs/corrosion.git"
        "$pkgname-slippi-rust-extensions::git+https://github.com/project-slippi/slippi-rust-extensions.git"
        "$pkgname-vma::git+https://github.com/GPUOpen-LibrariesAndSDKs/VulkanMemoryAllocator.git"
        "$pkgname-enet::git+https://github.com/lsalzman/enet.git"
        "$pkgname-cubeb::git+https://github.com/mozilla/cubeb.git"
        "$pkgname-sanitizers-cmake::git+https://github.com/arsenm/sanitizers-cmake.git"
        "$_mainpkgname.svg"
        "$_mainpkgname.desktop"
)
sha512sums=('SKIP'
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
)

_sourcedirectory="$pkgname"
_dolphinemu="dolphin-emu"

prepare() {
        cd "$srcdir/$_sourcedirectory/"
        if [ -d 'build/' ]; then rm -rf 'build/'; fi
        mkdir 'build/'

        if ["$(grep 'if (IsOpen())' "$srcdir/$_sourcedirectory/Source/Core/Common/IOFile.h")" == ""]; then
            curl -o $srcdir/001_fix_nonnull.patch https://github.com/dolphin-emu/dolphin/commit/3da2e15e6b95f02f66df461e87c8b896e450fdab.patch
            patch --forward -p1 < "$srcdir/001_fix_nonnull.patch"
        fi

        # Provide submodules
        declare -A _submodules=(
                [enet]='enet/enet'
                [implot]='implot/implot'
                [rcheevos]='rcheevos/rcheevos'
                [vma]='VulkanMemoryAllocator'
                [corrosion]='corrosion'
                [slippi-rust-extensions]='SlippiRustExtensions'
                [cubeb]='cubeb'
        )

        for _submod in "${!_submodules[@]}"; do
                _path="Externals/${_submodules[$_submod]}"
                git submodule init "$_path"
                git config "submodule.$_path.url" "$srcdir/$pkgname-$_submod/"
                git -c protocol.file.allow=always submodule update "$_path"
        done


        cd Externals/cubeb/cubeb
        git submodule init cmake/sanitizers-cmake
        git config submodule.cmake/sanitizers-cmake.url "${srcdir}"/"$pkgname"-sanitizers-cmake
        git -c protocol.file.allow=always submodule update cmake/sanitizers-cmake
}

pkgver() {
        cd "$srcdir/$_sourcedirectory/"
        git checkout --quiet "$(git rev-list -n 1 $(git describe --tags --abbrev=0))"
        git describe --long --tags | sed -e 's/-\([^-]*-g[^-]*\)$/-r\1/' -e 's/-/./g'
}

build() {

        export LDFLAGS="-Wl,--copy-dt-needed-entries"
        export CFLAGS+=' -I/usr/include/mbedtls2'
        export CXXFLAGS+=' -I/usr/include/mbedtls2'
        export LDFLAGS+=' -L/usr/lib/mbedtls2'

        CMAKE_FLAGS='-DLINUX_LOCAL_DEV=true -DSLIPPI_PLAYBACK=false -DUSE_SYSTEM_LIBS=ON -DENABLE_TESTS=OFF -DENABLE_NOGUI=OFF -DUSE_SYSTEM_ENET=OFF -DENABLE_CLI_TOOL=OFF -DUSE_SYSTEM_LIBMGBA=OFF -DUSE_SYSTEM_MINIZIP=OFF -Wno-dev'

        cd "$srcdir/$_sourcedirectory/"
        mkdir -p build
        cd build
        cmake ${CMAKE_FLAGS} ../
        cmake --build . --target dolphin-emu -- -j"$(nproc)"

}

package() {
        pkgdesc="$pkgdesc"
        provides=("$_mainpkgname")
        conflicts=("$_mainpkgname" "slippi-online-git")

        cd "$srcdir/$_sourcedirectory/"
        make DESTDIR="$pkgdir" -C 'build/' install
        mv "$pkgdir/usr/local/bin/$_dolphinemu" "$pkgdir/usr/local/bin/$_mainpkgname"
        cp -r "Data/Sys/" "$pkgdir/usr/local/bin/"
        rm -r "$pkgdir/usr/local/share/man/"
        install -Dm644 'build/cargo/build/x86_64-unknown-linux-gnu/release/libslippi_rust_extensions.so' "$pkgdir/usr/lib/libslippi_rust_extensions.so"
        rm -rf "$pkgdir/usr/include"
        rm -rf "$pkgdir/usr/lib/libdiscord-rpc.a"

        mkdir "$pkgdir/usr/local/share/pixmaps/"
        cp "$srcdir/$_mainpkgname.svg" "$pkgdir/usr/local/share/pixmaps/$_mainpkgname.svg"
        cp "$srcdir/$_mainpkgname.desktop" "$pkgdir/usr/local/share/applications/$_mainpkgname.desktop"
}
