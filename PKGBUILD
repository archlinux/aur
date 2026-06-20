pkgname=hyperhdr-git
pkgver=v22.0.0.0beta2.r2.771d0e57
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
            'fdfcf998d1f41a061976f76bcc51da8c70c8b3e23bc959bc0267e86a348a0cda3e24f8cbb82e8938b81df8165697b624cc77df86118d64557aaf3128d9ec5ef7'
            '54594711d4c13476eb4278195f91c03aa6ee308a72a969e03a98539681becb1d0b0d0a3a1a23c8b055ccf8732b7aa8a4853ad7dda6e4390a2a38af3b63365008'
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
    -DLIBCXX_ENABLE_STATIC_ABI_LIBRARY=ON \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DBUILD_ARCHIVES=OFF \
    \
    -DENABLE_SPIDEV=OFF \
    -DENABLE_SPI_FTDI=OFF \
    -DENABLE_WS281XPWM=OFF \
    \
    -DENABLE_DX=OFF \
    -DENABLE_MAC_SYSTEM=OFF \
    -DENABLE_PIPEWIRE_EGL=ON \
    -DENABLE_PIPEWIRE=ON \
    -DENABLE_X11=ON \
    \
    -DENABLE_AVF=OFF \
    -DENABLE_MF=OFF \
    -DENABLE_V4L2=OFF \
    -DENABLE_SOUNDCAPLINUX=ON \
    -DENABLE_SOUNDCAPMACOS=OFF \
    -DENABLE_SOUNDCAPWINDOWS=OFF \
    \
    -DENABLE_BONJOUR=ON \
    -DENABLE_CEC=OFF \
    -DENABLE_MQTT=ON \
    -DENABLE_POWER_MANAGEMENT=ON \
    -DENABLE_PROTOBUF=ON \
    -DENABLE_SYSTRAY=ON \
    \
    -DUSE_SHARED_LIBS=OFF \
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
  mv $pkgdir/usr/lib/hyperhdr $pkgdir/usr/
  rm -rf $pkgdir/usr/lib
  mkdir -p $pkgdir/usr/lib
  mv $pkgdir/usr/hyperhdr $pkgdir/usr/lib/

  install -Dm 644 ${srcdir}/hyperhdr.systemd-user "${pkgdir}/usr/lib/systemd/user/hyperhdr.service"
  install -Dm 644 ${srcdir}/hyperhdr-x11.systemd-user "${pkgdir}/usr/lib/systemd/user/hyperhdr-x11.service"

  start_hint
}

start_hint() {
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

post_upgrade() {
  start_hint
}

post_install() {
  start_hint
}
