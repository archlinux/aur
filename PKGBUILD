# Maintainer: Peter Sutton <foxxy@foxdogstudios.com>
pkgname=pangolin-git
pkgver=r1610.c2a6ef5
pkgrel=1
pkgdesc="Pangolin is a lightweight portable rapid development library for managing OpenGL display / interaction and abstracting video input."
arch=(x86_64)
url="https://github.com/stevenlovegrove/Pangolin"
license=('MIT')
groups=()
depends=(
    'glew'
    'python'
)
optdepends=(
    'cuda'
    'eigen'
    'ffmpeg'
    'libdc1394'
    'libjpeg-turbo'
    'libpng'
    'libtiff'
    'libuvc'
    'openexr'
    'openni2'
    # OpenNI/OpenNI2
    # DepthSense SDK
)
makedepends=('cmake' 'doxygen' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=(
    'LICENSE'
    '318.patch'
    'pangolin::git+https://github.com/stevenlovegrove/Pangolin.git'
)
noextract=()
sha256sums=('fe25815547bcad7ff6d9ab12a381f64c0ef57e9fbb06cb831e9becdd22fde7c7'
            '13e2dfe72209656e309e3d767e021f8c341326bec1c2a579aef5a610dab9efe6'
            'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    git apply "$srcdir/318.patch"
}

build() {
    cd "$srcdir/${pkgname%-git}"
    mkdir build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_PREFIX_PATH=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          ..
    cmake --build .
}

package() {
    cd "$srcdir/${pkgname%-git}/build"
    make DESTDIR="$pkgdir/" install
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
