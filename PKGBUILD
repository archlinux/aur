# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=photobroom-git
pkgver=v1.6.0.r1.gb2c24ad5e
pkgrel=1
pkgdesc="Photos managing tool"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/photobroom"
license=('GPL3')
groups=()
depends=('exiv2' 'qt6-base' 'dlib' 'qt6-multimedia' 'opencv' 'jsoncpp')
makedepends=('cmake' 'magic_enum' 'qt6-tools' 'imagemagick' 'libwebp')
optdepends=()
provides=('photobroom')
conflicts=('photobroom')
replaces=()
backup=()
options=()
install=
changelog=
source=(photobroom-git::git+https://github.com/Kicer86/photobroom.git#branch=master
        cmake_modules::git+https://github.com/Kicer86/cmake_modules.git#commit=bf447aeb3bf57680f0c257f9d77ea7f5ef90b0ec
        qml-colorpicker::git+https://github.com/rshest/qml-colorpicker.git#commit=5967b3e38033794f54d66c57a03f9a356df0dc03
        face_recognition_models::git+https://github.com/ageitgey/face_recognition_models.git#commit=e67de717267507d1e9246de95692eb8be736ab61
        github_api::git+https://github.com/Kicer86/github_api.git#commit=4080d1a357ac5271f0871d9c077cd56491a32430
)
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    rm -d $pkgname/cmake_modules
    rm -d $pkgname/src/gui/desktop/quick_items/external/qml-colorpicker
    rm -d $pkgname/src/face_recognition/dlib_wrapper/face_recognition_models
    rm -d $pkgname/src/updater/github_api
    ln -s ../cmake_modules $pkgname/cmake_modules
    ln -s ../../../../../../qml-colorpicker $pkgname/src/gui/desktop/quick_items/external/qml-colorpicker
    ln -s ../../../github_api $pkgname/src/updater/github_api
    ln -s ../../../../face_recognition_models $pkgname/src/face_recognition/dlib_wrapper/face_recognition_models
}

build()
{
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF -DBUILD_UPDATER=OFF -DCMAKE_BUILD_TYPE=None -Wno-dev
    make
}

package()
{
    cd "$pkgname"
    cd build
    make DESTDIR="$pkgdir/" install
}
