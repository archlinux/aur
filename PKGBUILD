# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mdlshit
pkgver=2.3.2
pkgrel=1
pkgdesc="source engine .mdl v49 -> v53 converter"
arch=('any')
url="https://github.com/headassbtw/mdlshit"
license=('GPL2')
makedepends=('cmake' 'git' 'imagemagick' 'libx11' 'libxcursor' 'libxext' 'libxi' 'libxinerama' 'libxrandr' 'make' 'mesa')
conflicts=($pkgname)
provides=($pkgname)
_desktop=$pkgname.desktop
source=("$url/archive/refs/tags/$pkgver.tar.gz"
        "git+https://github.com/Perlmint/glew-cmake.git#commit=8260c05ee0121094a0dc9a53f610f514659763d6"
        "git+https://github.com/glfw/glfw.git#commit=6b57e08bb0078c9834889eab871bac2368198c15"
        "git+https://github.com/g-truc/glm.git#commit=cc98465e3508535ba8c7f6208df934c156a018dc"
        "git+https://github.com/melowntech/half.git#commit=972e040989383764f30c1d45a9b666593e802741"
        "git+https://github.com/ocornut/imgui.git#commit=ced92d9c52398f10fa152f78f52d0ca51d5d1d5b"
        "git+https://github.com/native-toolkit/libtinyfiledialogs.git#commit=cc6b593c029110af8045826ce691f540c85e850c")
sha256sums=('004b0fd9799d77ce631b8e0417182d278a3590885573a0e32ba15c3d4a6fb273'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  # "Create a shortcut"
  echo "Categories=Game;" >> $_desktop
  sed -i '1 i\Comment=source engine .mdl v49 -> v53 converter' $_desktop
  sed -i '1 i\StartupWMClass=mdlshit' $_desktop
  sed -i '1 i\Icon=mdlshit' $_desktop
  sed -i '1 i\Type=Application' $_desktop
  sed -i '1 i\Terminal=false' $_desktop
  sed -i '1 i\Exec=mdlshit %U' $_desktop
  sed -i '1 i\Name=mdlshit' $_desktop
  sed -i '1 i\[Desktop Entry]' $_desktop
  mkdir -p desktop
  mv $_desktop desktop

  cd $pkgname-$pkgver
  convert product.ico ../$pkgname.png
  cd ..

  # "Submodules"
  cd glew-cmake
  cp -r * ../$pkgname-$pkgver/external/glew
  cd ..
  cp -r glfw $pkgname-$pkgver/external
  cp -r glm $pkgname-$pkgver/external
  cp -r half $pkgname-$pkgver/external
  cp -r imgui $pkgname-$pkgver/external
  cp -r libtinyfiledialogs $pkgname-$pkgver/external
}

build() {
  cd $pkgname-$pkgver
  cmake -S ./ -B ./build -DCMAKE_BUILD_TYPE=$BUILD_TYPE
  cmake --build ./build
}

package() {
  install -Dm644 desktop/$_desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $pkgname.png -t "$pkgdir/usr/share/pixmaps"
  cd $pkgname-$pkgver
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 bin/Linux/$pkgname -t "$pkgdir/usr/bin"
}
