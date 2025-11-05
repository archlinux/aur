pkgname=hyperhdr-git
pkgver=v21.0.0.0.r53.b3c96634
pkgrel=1
pkgdesc="Highly optimized open source ambient lighting implementation based on modern digital video and audio stream analysis"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/awawa-dev/HyperHDR.git"
license=('MIT')
depends=('openssl' 'chrpath' 'flatbuffers' 'alsa-lib' 'libayatana-appindicator' 'libftdi' 'libglvnd' 'libjpeg-turbo' 'wayland' 'libx11' 'freetds' 'libfbclient' 'qt6-base' 'qt6-serialport' 'pipewire' 'python' 'mesa')
optdepends=('gtk3')
makedepends=('cmake' 'base-devel' 'git')
provides=('hyperhdr')
conflicts=('hyperhdr' 'hyperhdr-git')
source=("git+https://github.com/awawa-dev/${pkgname%-git}"
        "hyperhdr.systemd-user"
        "hyperhdr-x11.systemd-user"
        "fix-build.patch")
sha512sums=('SKIP'
            'a6d5dfe3d47fef991c4a5d5d8b357811deb1114ea2ec550f0fd1664ab04b31309c8abdf91949d7d0790cb3ce0bec459b3630f72cca5eedc6a5ad18f6c3830b12'
            'f942a84ce9d82a0e44cb72ab15cfd8ffc9530bea590922be5844b9b34231ef21a50d8f93b4f06b68b2eeda42099c33c9f3cd08af189aa0b324434036417fe014'
            '6d91b7e97a6c81dad593fcd26d6bd935ade97c151eb0bf7890ecd4aa518d7a5d536b151f78769dd9e6ffbed7877087fd12028ea663fb86659f2da0e8a8301378')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  git submodule update --init --recursive

  patch -Np1 < "../fix-build.patch"
}

build() {
  cd "${srcdir}/${pkgname%-git}"

  export LDFLAGS=${LDFLAGS/-Wl,-z,pack-relative-relocs/}
  cmake -B build \
    -DPLATFORM=linux \
    -DCMAKE_BUILD_TYPE=None \
    -DQT_DIR=/usr/lib/cmake/Qt6 \
    -DPROTOBUF_PROTOC_EXECUTABLE=/usr/bin/protoc \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_ARCHIVES=OFF \
    \
    -DENABLE_SPIDEV=OFF \
    -DENABLE_SPI_FTDI=OFF \
    -DENABLE_WS281XPWM=OFF \
    \
    -DENABLE_DX=OFF \
    -DENABLE_FRAMEBUFFERE=ON \
    -DENABLE_MAC_SYSTEM=OFF \
    -DENABLE_PIPEWIRE_EGL=ON \
    -DENABLE_PIPEWIRE=ON \
    -DENABLE_X11=ON \
    \
    -DENABLE_AVF=OFF \
    -DENABLE_MF=OFF \
    -DENABLE_V4L2=OFF \
    -DENABLE_SOUNDCAPLINUX=OFF \
    -DENABLE_SOUNDCAPMACOS=OFF \
    -DENABLE_SOUNDCAPWINDOWS=OFF \
    \
    -DENABLE_BONJOUR=ON \
    -DENABLE_CEC=OFF \
    -DENABLE_MQTT=ON \
    -DENABLE_POWER_MANAGEMENT=ON \
    -DENABLE_PROTOBUF=ON \
    -DENABLE_SYSTRAY=ON \
    -DENABLE_XZ=ON \
    \
    -DUSE_SHARED_LIBS=ON \
    -DUSE_EMBEDDED_WEB_RESOURCES=ON \
    -DUSE_PRECOMPILED_HEADERS=OFF \
    -DUSE_CCACHE_CACHING=OFF \
    -DUSE_SYSTEM_MQTT_LIBS=OFF \
    -DUSE_SYSTEM_FLATBUFFERS_LIBS=OFF \
    -DUSE_STATIC_QT_PLUGINS=OFF \
    -DUSE_STANDARD_INSTALLER_NAME=ON

  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname%-git}"

  DESTDIR="$pkgdir" cmake --install build
  rm -rf $pkgdir/usr/bin/flatc
  rm -rf $pkgdir/usr/cmake
  rm -rf $pkgdir/usr/include
  rm -rf $pkgdir/usr/lib

  install -Dm 644 ${srcdir}/hyperhdr.systemd-user "${pkgdir}/usr/lib/systemd/user/hyperhdr.service"
  install -Dm 644 ${srcdir}/hyperhdr-x11.systemd-user "${pkgdir}/usr/lib/systemd/user/hyperhdr-x11.service"


  echo
  echo
  echo -------------------------------------------------------------
  echo 'run to start hyperhdr as user via systemd:'
  echo 'systemctl --user daemon-reload && systemctl --user enable hyperhdr && systemctl --user start hyperhdr'
  echo 'or for X11 / Xorg'
  echo 'systemctl --user daemon-reload && systemctl --user enable hyperhdr-x11 && systemctl --user start hyperhdr-x11'
  echo -------------------------------------------------------------
  echo
  echo
}
