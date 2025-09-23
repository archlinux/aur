# Maintainer: KyvYang kyvyang@foxmail.com

pkgname='vocalshaper-git'
pkgver=r1231.9e90ecd
pkgrel=3
epoch=0
conflicts=('vocalshaper')
provides=("vocalshaper")
pkgdesc='A JUCE-based Open Source DAW'
arch=('x86_64')
url='https://github.com/Do-sth-sharp/VocalShaper'
license=('GPL-3.0')

depends=('freetype2' 'webkit2gtk' 'gtk3' 'patchelf')
makedepends=('clang' 'git' 'curl' 'zip' 'unzip' 'tar' 'cmake' 'ninja')
source=(
    'git+https://github.com/Do-sth-sharp/VocalShaper#branch=develop'
    'git+https://github.com/Remix-Design/RemixIcon.git'
    'git+https://github.com/Do-sth-sharp/vcpkg-overlay.git'
    'git+https://github.com/microsoft/vcpkg.git'
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
    cd VocalShaper
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd VocalShaper
    git submodule init
    git config submodule.vcpkg.url $srcdir/vcpkg
    git config submodule.scripts/vcpkg.url $srcdir/vcpkg-overlay
    git config submodule.RemixIcon.url $srcdir/RemixIcon
    git -c protocol.file.allow=always submodule update
    cd vcpkg
    ./bootstrap-vcpkg.sh
    ./vcpkg install --x-manifest-root=../scripts/vcpkg-manifest --x-install-root=./installed --triplet=x64-linux-llvm
}

build() {
    cd VocalShaper
    cmake --preset "Ninja Release Linux LLVM"\
            -DCMAKE_INSTALL_RPATH='$ORIGIN' \
            -DCMAKE_BUILD_WITH_INSTALL_RPATH=ON \
            -DCMAKE_SKIP_BUILD_RPATH=OFF
    cmake --build "build/ninja-release-linux-llvm" --target VocalShaper
}

package() {
    install -d -m755 "$pkgdir/usr/bin"
    install -d -m755 "$pkgdir/usr/lib"
    install -d -m755 "$pkgdir/opt"
    cp -r "$srcdir/VocalShaper/build/ninja-release-linux-llvm/bin" "$pkgdir/opt/VocalShaper"
    # The following 2 libraries are not provided by any package, so manually copy them
    cp "$srcdir/VocalShaper/vcpkg/installed/x64-linux-llvm/lib/libvsp4.so" "$pkgdir/opt/VocalShaper/libvsp4.so"
    cp "$srcdir/VocalShaper/vcpkg/installed/x64-linux-llvm/lib/libjuce-full.so" "$pkgdir/opt/VocalShaper/libjuce-full.so"
    # The following library actually is provided by extra/protobuf, but the file name is libprotobuf.so.32.0.0, which can not be found by VocalShaper.
    cp "$srcdir/VocalShaper/vcpkg/installed/x64-linux-llvm/lib/libprotobuf.so.32" "$pkgdir/opt/VocalShaper/libprotobuf.so.32"
    ln -s "/opt/VocalShaper/VocalShaper" "$pkgdir/usr/bin/VocalShaper"
    if [ -f "$pkgdir/opt/VocalShaper/FileRegistrar" ]; then
        ln -s "/opt/VocalShaper/FileRegistrar" "$pkgdir/usr/bin/FileRegistrar"
        ln -s "/opt/VocalShaper/FileRegistrar" "$pkgdir/usr/bin/FileRegistrator"
    elif [ -f "$pkgdir/opt/VocalShaper/FileRegistrator" ]; then
        ln -s "/opt/VocalShaper/FileRegistrator" "$pkgdir/usr/bin/FileRegistrator"
    fi
    ln -s "/opt/VocalShaper/PluginSearcher" "$pkgdir/usr/bin/PluginSearcher"
}
