# Maintainer: Jake <aur@ja-ke.tech.de>

pkgname=hyperion.ng-git
pkgver=2.0.12.r4.17582ac3
pkgrel=2
pkgdesc="The reworked version (next generation) of Hyperion, ambient light software"
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
        "hyperion.systemd"
        "hyperion.systemd-user")
sha512sums=('SKIP'
            '135a02e07c21f13c078914b5420db97b3d8b5d40fd4c06d10ab9750ce5ebe5c8872fbbc48e33c51edede8c65674cdbb2148aa9a02ce27081980442d360061a38'
            'ca894619a552df48c5d83a43c377d54df87aab641ed279de1f7f97788ecbcb641f9114a511ff4632e386ebe5363cb5b378775323aa19304dbc046c6b0b5b9aad')

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

  install -Dm 644 ${srcdir}/hyperion.systemd "${pkgdir}/usr/lib/systemd/system/hyperiond@.service"
  install -Dm 644 ${srcdir}/hyperion.systemd-user "${pkgdir}/usr/share/hyperion/hyperiond-user.service"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
