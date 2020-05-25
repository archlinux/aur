# Maintainer: jakob <grandchild@gmx.net>
# Contributor: Maarten de Vries <maarten@de-vri.es>
# Contributor: Nathan Ringo <tikiking1@gmail.com>

pkgname=libfreenect2-git
_pkgname=libfreenect2
pkgver=0.2.0.r70.gfd64c5d
pkgrel=1
pkgdesc="Open source drivers for the Kinect for Windows v2"
arch=(i686 x86_64)
url="http://openkinect.org"
license=(Apache GPL)
depends=(libusb glfw libjpeg-turbo ocl-icd)
makedepends=(cmake opencl-headers)
provides=(libfreenect2)
conflicts=(libfreenect2)
source=("git+https://github.com/OpenKinect/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    rm -rf "$srcdir/build"
    mkdir -p "$srcdir/build"
    cd "$srcdir/build"

    sed -i -e 's/MODE="0666"/TAG+="uaccess"/' "$srcdir/$_pkgname/platform/linux/udev/90-kinect2.rules"
    sed -i -e '93aINSTALL(TARGETS Protonect DESTINATION bin)' "$srcdir/$_pkgname/examples/CMakeLists.txt"
    cmake "$srcdir/$_pkgname" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_CXX11=ON \
        -DENABLE_OPENCL=ON \
        -DENABLE_CUDA=OFF \
        -DBUILD_EXAMPLES=ON
}

build() {
    cd "$srcdir/build"
    make
}

package() {
    cd "$srcdir/build"
    make DESTDIR="$pkgdir" install
    install -d "$pkgdir/usr/lib/udev/rules.d"
    install -m644 "$srcdir/$_pkgname/platform/linux/udev/90-kinect2.rules" "$pkgdir/usr/lib/udev/rules.d/65-kinect2.rules"
}
