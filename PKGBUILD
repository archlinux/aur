# Maintainer: Jake <aur@ja-ke.tech.de>

pkgname=hyperion.ng-git
pkgver=2.0.12.r4.17582ac3
pkgrel=1
pkgdesc="The reworked version (next generation) of Hyperion, ambient light software - PRE ALPHA"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/hyperion-project/hyperion.ng"
license=('MIT')
depends=('libusb' 'libcec' 'protobuf' 'python' 'qt5-serialport' 'qt5-x11extras' 'avahi' 'mbedtls')
optdepends=('xorg-server: X11 grabbing')
makedepends=('cmake')
provides=("hyperion")
conflicts=('hyperion' 'hyperion-git')
backup=('etc/hyperion/config/hyperion.config.json')
source=("git+https://github.com/hyperion-project/${pkgname%-git}"
        "hyperion.systemd")
sha512sums=('SKIP'
            '7ecaacff7d25bb79b4ad4246e993cda578c6513e0cbd76493c24afba0dd1580c49d99a43c099c0d9dfdb6a28ed7d496dda1ae498ba8c4d2a61759f2095ec28fd')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  git submodule update --init --recursive
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  
  sed -i "s/python/python2/g" CMakeLists.txt
  
  test -d build || mkdir build
  cd build
  cmake -DCMAKE_BUILD_TYPE=Release \
        -DPROTOBUF_PROTOC_EXECUTABLE=/usr/bin/protoc \
        -DUSE_SYSTEM_PROTO_LIBS=OFF \
        -DUSE_SYSTEM_MBEDTLS_LIBS=ON \
        ..
  make
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  
  install -d ${pkgdir}/usr/bin
  install -D build/bin/hyperion* ${pkgdir}/usr/bin
  
  install -d ${pkgdir}/usr/share/hyperion/webconfig
  cp -r assets/webconfig ${pkgdir}/usr/share/hyperion/  
  
  install -d "${pkgdir}/etc/hyperion/"

  install -Dm 644 ${srcdir}/hyperion.systemd "${pkgdir}/usr/lib/systemd/system/hyperiond.service"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
