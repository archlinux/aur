# Maintainer: Melanie Scheirer <mel@nie.rs>
# Contributor: johnnybash <georg at grgw dot de>

pkgname=rbdoom3-bfg-git
pkgver=r2730.4f97527a
pkgrel=1
pkgdesc="Doom 3 BFG Edition with soft shadows, cleaned up source, Linux and 64 bit Support"
arch=(i686 x86_64)
url="https://github.com/RobertBeckebans/RBDOOM-3-BFG"
license=(GPL3)
depends=(ffmpeg glew openal sdl2-compat)
makedepends=(cmake git rapidjson zip ispc vulkan-headers)
optdepends=('doom3bfg-data: packaged game data files')
provides=(rbdoom3-bfg)
conflicts=(rbdoom-3-bfg)
install=rbdoom3-bfg-git.install
source=("$pkgname::git+https://github.com/RobertBeckebans/RBDOOM-3-BFG.git"
        'rbdoom3-bfg-git.desktop' 
        'doom3bfg.png'
        'https://github.com/microsoft/DirectXShaderCompiler/releases/download/v1.8.2405/linux_dxc_2024_05_24.x86_64.tar.gz')
sha256sums=('SKIP'
            'a651aa2e71a8a525e66173a8f76b907712b73c950c88f5468ccab79f7533361f'
            '0fb6a3bb9b47cad65d5012ba20dc9de3b1487f4ac1908ee847e6087511b7f09e'
            '85d74a5f7e0ad339cae875b5baab04c38218d6ac33960b75f8780fd9d8447ee9')

noextract=(
  linux_dxc_2024_05_24.x86_64.tar.gz
)

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$pkgname"
    git submodule update --init --recursive
    mkdir -p "$srcdir/dxc/"
    tar xvzf "$srcdir/linux_dxc_2024_05_24.x86_64.tar.gz" --directory "$srcdir/dxc/"
    chmod +x $srcdir/dxc/bin/dxc
}

build() {
  cmake -DDXC_CUSTOM_PATH=$srcdir/dxc/bin \
        -DCMAKE_BUILD_TYPE=Release \
        -DONATIVE=ON \
        -DFFMPEG=OFF \
        -DBINKDEC=ON \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DUSE_SYSTEM_ZLIB=1 \
        -DUSE_SYSTEM_LIBPNG=1 \
        -DUSE_SYSTEM_LIBJPEG=1 \
        -DUSE_SYSTEM_LIBGLEW=1 \
        -DUSE_SYSTEM_RAPIDJSON=1 \
        -B build -S "$pkgname/neo"
  cmake --build build
}

package() {
  mkdir -p "$pkgdir/usr/share/games/doom3bfg/base"
  cp -r "$srcdir/rbdoom3-bfg-git/base/renderprogs2" "$pkgdir/usr/share/games/doom3bfg/base"
  install -Dm755 "$srcdir/build/RBDoom3BFG" "$pkgdir/usr/bin/rbdoom3bfg"
  install -Dm644 "$srcdir/doom3bfg.png" "$pkgdir/usr/share/pixmaps/doom3bfg.png"
  install -Dm644 "$srcdir/rbdoom3-bfg-git.desktop" "$pkgdir/usr/share/applications/rbdoom3-bfg-git.desktop"
}
