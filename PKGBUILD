pkgname=file-commander-git
_pkgname=file-commander
pkgver=0.9.4.12.471.r0.g42c8aa5
pkgrel=1
pkgdesc='Qt-based cross-platform Total Commander-like orthodox file manager for Windows, Mac and Linux'
arch=('i686' 'x86_64')
url="https://github.com/VioletGiraffe/file-commander"
license=('GPL3')
depends=('qt5-base')
makedepends=('qt5-tools' 'hunspell')
optdepends=('hunspell')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/VioletGiraffe/file-commander.git'
        'git+https://github.com/VioletGiraffe/cpp-template-utils.git'
        'git+https://github.com/VioletGiraffe/cpputils.git'
        'git+https://github.com/VioletGiraffe/github-releases-autoupdater.git'
        'git+https://github.com/VioletGiraffe/image-processing.git'
        'git+https://github.com/VioletGiraffe/qtutils.git'
        'git+https://github.com/VioletGiraffe/text-encoding-detector.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --long --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare(){
  cd "$srcdir/${pkgname%-git}"
  git submodule init
    for submodule in cpp-template-utils cpputils github-releases-autoupdater \
        image-processing qtutils text-encoding-detector; do
        git config submodule.${submodule}.url "$srcdir/${submodule}"
    done
    git submodule update
 
    # Fix icon name
    sed -i 's/Icon=icon/Icon=file-commander/g' qt-app/file_commander.desktop
}

build() {
  cd "$srcdir/${pkgname%-git}"
  qmake PREFIX=/usr
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make INSTALL_ROOT="$pkgdir/" install

   # Rename icon
    mv "$pkgdir/usr/share/icons/hicolor/256x256/apps/icon.png" \
       "$pkgdir/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"

}
