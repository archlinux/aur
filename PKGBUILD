# Maintainer: Michał Walenciak <kicer86@gmail.com>
pkgname=photobroom-git
pkgver=v1.6.0.r993.g0020201c48
pkgrel=1
pkgdesc="Photos managing tool"
arch=('i686' 'x86_64')
url="https://github.com/Kicer86/photobroom"
license=('GPL3')
groups=()
depends=('exiv2' 'qt6-base' 'qt6-multimedia' 'qt6-declarative' 'qt6-svg' 'qt6-quick3d' 'dlib' 'opencv' 'jsoncpp')
makedepends=('cmake' 'ffmpeg' 'qt6-tools' 'imagemagick' 'libwebp' 'cs-libguarded' 'boost' 'openmp')
optdepends=()
provides=('photobroom')
conflicts=('photobroom')
replaces=()
backup=()
options=()
install=
changelog=
source=(photobroom-git::git+https://github.com/Kicer86/photobroom.git#branch=master
        cmake_modules::git+https://github.com/Kicer86/cmake_modules.git#commit=d14de8ecd74b88567d1e9955ca15f472efd839e8
        face_recognition_models::git+https://github.com/ageitgey/face_recognition_models.git#commit=e67de717267507d1e9246de95692eb8be736ab61
        animated_webp::git+https://github.com/Kicer86/AnimatedWebP.git#commit=996e92a0c45b2ea20034c9e97ec75d2098faf2f8
        nanobench::git+https://github.com/martinus/nanobench.git#commit=9f871ad520e040078597f4194080cc073a765061
        reflect-cpp::git+https://github.com/getml/reflect-cpp.git#commit=b661b6147a77415a58d6473e605de5f624106c27
        magic_enum::git+https://github.com/Neargye/magic_enum.git#commit=1a1824df7ac798177a521eed952720681b0bf482
)
noextract=()
md5sums=('SKIP'
         '0cfc045fff97d2e5d0bb142592eee05f'
         'eb071e34886c1b278c5d4da48f7e9b29'
         '148c3079c3a218c2d9d9c70d869a5d1d'
         '3aef9cd17c8039b59d6df33da4ac7075'
         'f2a1f51b0843332001ae9f8162a0f554'
         '386f4a7d16d93c2fefc1a4337fd727ce')

pkgver() {
  cd "$pkgname"
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare()
{
    rm -d $pkgname/cmake_modules
    rm -d $pkgname/src/gui/desktop/utils/animated_webp
    rm -d $pkgname/src/face_recognition/dlib_wrapper/face_recognition_models
    rm -d $pkgname/src/third_party/nanobench
    rm -d $pkgname/src/third_party/reflect-cpp
    rm -d $pkgname/src/third_party/magic_enum
    ln -s ../cmake_modules $pkgname/cmake_modules
    ln -s ../../../../../animated_webp $pkgname/src/gui/desktop/utils/animated_webp
    ln -s ../../../../face_recognition_models $pkgname/src/face_recognition/dlib_wrapper/face_recognition_models
    ln -s ../../../nanobench $pkgname/src/third_party/nanobench
    ln -s ../../../reflect-cpp $pkgname/src/third_party/reflect-cpp
    ln -s ../../../magic_enum $pkgname/src/third_party/magic_enum
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
