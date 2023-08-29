# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=mdlshit
pkgver=2.3.2
pkgrel=4
pkgdesc="source engine .mdl v49 -> v53 converter"
arch=('any')
url="https://github.com/headassbtw/mdlshit"
license=('GPL2')
makedepends=('cmake' 'git' 'imagemagick' 'libx11' 'libxcursor' 'libxext' 'libxi' 'libxinerama' 'libxrandr' 'make' 'mesa')
conflicts=($pkgname)
provides=($pkgname)
source=("git+$url.git#tag=$pkgver"
        "git+https://github.com/Perlmint/glew-cmake.git#commit=8260c05ee0121094a0dc9a53f610f514659763d6"
        "git+https://github.com/glfw/glfw.git#commit=6b57e08bb0078c9834889eab871bac2368198c15"
        "git+https://github.com/g-truc/glm.git#commit=cc98465e3508535ba8c7f6208df934c156a018dc"
        "git+https://github.com/melowntech/half.git#commit=972e040989383764f30c1d45a9b666593e802741"
        "git+https://github.com/ocornut/imgui.git#commit=ced92d9c52398f10fa152f78f52d0ca51d5d1d5b"
        "git+https://github.com/native-toolkit/libtinyfiledialogs.git#commit=cc6b593c029110af8045826ce691f540c85e850c")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  # Create a shortcut
  echo "Categories=Game;" >> desktop
  sed -i '1 i\Comment=source engine .mdl v49 -> v53 converter' desktop
  sed -i '1 i\StartupWMClass=mdlshit' desktop
  sed -i '1 i\Icon=mdlshit' desktop
  sed -i '1 i\Type=Application' desktop
  sed -i '1 i\Terminal=false' desktop
  sed -i '1 i\Exec=mdlshit %U' desktop
  sed -i '1 i\Name=mdlshit' desktop
  sed -i '1 i\[Desktop Entry]' desktop
  mv desktop $pkgname.desktop

  convert $pkgname/product.ico -strip ../$pkgname.png

  # Submodules
  cp -r glew-cmake/* "$pkgname/external/glew"
  cp -r glfw "$pkgname/external"
  cp -r glm "$pkgname/external"
  cp -r half "$pkgname/external"
  cp -r imgui "$pkgname/external"
  cp -r libtinyfiledialogs "$pkgname/external"
}

build() {
  cd $pkgname
  cmake -S ./ -B ./build -DCMAKE_BUILD_TYPE=$BUILD_TYPE
  cmake --build ./build
}

package() {
  install -Dm644 $pkgname.desktop -t "$pkgdir/usr/share/applications"
  install -Dm644 $pkgname.png -t "$pkgdir/usr/share/pixmaps"
  cd $pkgname
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 bin/Linux/$pkgname -t "$pkgdir/usr/bin"
}
