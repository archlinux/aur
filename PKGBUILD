# Maintainer: Jake <aur@ja-ke.tech.de>

pkgname=hyperion.ng-git
pkgver=2.0.15.r97.fd5a94a3
pkgrel=3
pkgdesc="The reworked version (next generation) of Hyperion, ambient light software"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/hyperion-project/hyperion.ng"
license=('MIT')
depends=('libusb' 'libcec' 'protobuf' 'python' 'qt5-serialport' 'qt5-x11extras' 'avahi' 'mbedtls' 'flatbuffers')
optdepends=('xorg-server: X11 grabbing')
makedepends=('cmake')
provides=('hyperion' 'hyperion.ng')
conflicts=('hyperion' 'hyperion-git' 'hyperion.ng')
backup=('etc/hyperion/config/hyperion.config.json')
source=("git+https://github.com/hyperion-project/${pkgname%-git}"
        "hyperion.systemd"
        "hyperion.systemd-user")
sha512sums=('SKIP'
            '7a43cedc636760885283f92564716237f3ed0917852b359e301509bca4c923d8d0f3bcca7ffbc8a066de726781e207737365a31e1438ff8ae30a9bd3c1f9fc71'
            '3313b7bfd1f8bdc07832432fdd54ad9470534f54829d8e19cec632d5a4beb7e34fca93fda00a8a373984092f807116df16dc38a91892b352a7fbc0eec3d42f49')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  sed 's#../../Mbed-TLS/mbedtls.git#https://github.com/Mbed-TLS/mbedtls.git#g' -i .gitmodules
  sed 's#set(CMAKE_CXX_STANDARD 14)#set(CMAKE_CXX_STANDARD 17)#' -i CMakeLists.txt
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
        -DUSE_SYSTEM_FLATBUFFERS_LIBS=ON \
        -DENABLE_MDNS= \
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
  install -Dm 644 ${srcdir}/hyperion.systemd-user "${pkgdir}/usr/lib/systemd/user/hyperiond.service"

  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

  echo
  echo
  echo -------------------------------------------------------------
  echo 'run to start hyperion as user via systemsd:'
  echo 'systemctl --user daemon-reload && systemctl --user enable hyperiond && systemctl --user start hyperiond'
  echo -------------------------------------------------------------
  echo
  echo
}
