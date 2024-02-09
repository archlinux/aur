# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=photobroom-git
pkgver=v1.6.0.r529.g8dfc50393
pkgrel=1
pkgdesc="Photos managing tool"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/photobroom"
license=('GPL3')
groups=()
depends=('exiv2' 'qt6-base' 'qt6-multimedia' 'qt6-declarative' 'qt6-svg' 'qt6-quick3d' 'dlib' 'opencv' 'jsoncpp')
makedepends=('cmake' 'magic_enum' 'qt6-tools' 'imagemagick' 'libwebp' 'cs-libguarded' 'boost')
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
        face_recognition_models::git+https://github.com/ageitgey/face_recognition_models.git#commit=e67de717267507d1e9246de95692eb8be736ab61
        animated_webp::git+https://github.com/Kicer86/AnimatedWebP.git#commit=996e92a0c45b2ea20034c9e97ec75d2098faf2f8
        reflect-cpp::git+https://github.com/getml/reflect-cpp.git#commit=0a524a9893fc1220fe38734dac311b032edd4b79
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
    rm -d $pkgname/src/gui/desktop/utils/animated_webp
    rm -d $pkgname/src/face_recognition/dlib_wrapper/face_recognition_models
    rm -d $pkgname/src/third_party/reflect-cpp
    ln -s ../cmake_modules $pkgname/cmake_modules
    ln -s ../../../../../animated_webp $pkgname/src/gui/desktop/utils/animated_webp
    ln -s ../../../../face_recognition_models $pkgname/src/face_recognition/dlib_wrapper/face_recognition_models
    ln -s ../../../reflect-cpp $pkgname/src/third_party/reflect-cpp
}

build()
{
    cd "$pkgname"
    mkdir -p build
    cd build
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF -DBUILD_UPDATER=OFF -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=None -Wno-dev
    make
}

package()
{
    cd "$pkgname"
    cd build
    make DESTDIR="$pkgdir/" install
}
