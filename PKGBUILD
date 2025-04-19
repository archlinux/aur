# Maintainer: KyvYang kyvyang@foxmail.com

pkgname='VocalShaper-git'
pkgver=r1219.4d138f5
pkgrel=1
epoch=0
conflicts=('vocalshaper')
provides=("vocalshaper=${pkgver}")
pkgdesc='A JUCE-based Open Source DAW'
arch=('x86_64')
url='https://github.com/Do-sth-sharp/VocalShaper'
license=('GPL-3.0')

depends=('freetype2' 'curl' 'webkit2gtk' 'gtk3' 'patchelf')
makedepends=('clang' 'git' 'curl' 'zip' 'unzip' 'tar' 'cmake' 'ninja')
source=('git+https://github.com/Do-sth-sharp/VocalShaper')
sha256sums=('SKIP')

pkgver() {
  cd VocalShaper
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    cd VocalShaper
    git checkout develop
    git submodule update --init --recursive
    cd vcpkg
    ./bootstrap-vcpkg.sh
    ./vcpkg install --x-manifest-root=../scripts/vcpkg-manifest --x-install-root=./installed --triplet=x64-linux-llvm
}

build() {
    cd VocalShaper
    cmake --preset "Ninja Release Linux LLVM"
    cmake --build "build/ninja-release-linux-llvm" --target VocalShaper
}

package() {
    install -d -m755 $pkgdir/usr/bin
    install -d -m755 $pkgdir/opt
    cp -r $srcdir/VocalShaper/build/ninja-release-linux-llvm/bin $pkgdir/opt/VocalShaper
    ln -s $pkgdir/opt/VocalShaper/VocalShaper $pkgdir/usr/bin/VocalShaper
    if [ -f "$pkgdir/opt/VocalShaper/FileRegistrar" ]; then
        ln -s $pkgdir/opt/VocalShaper/FileRegistrar $pkgdir/usr/bin/FileRegistrar
        ln -s $pkgdir/opt/VocalShaper/FileRegistrar $pkgdir/usr/bin/FileRegistrator
    elif [ -f "$pkgdir/opt/VocalShaper/FileRegistrator" ]; then
        ln -s $pkgdir/opt/VocalShaper/FileRegistrator $pkgdir/usr/bin/FileRegistrator
    fi
    ln -s $pkgdir/opt/VocalShaper/PluginSearcher $pkgdir/usr/bin/PluginSearcher
}
