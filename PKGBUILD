pkgname=hyperhdr-git
pkgver=v20.0.0.0.r33.af160dc6
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
        "hyperhdr.systemd-user")
sha512sums=('SKIP'
            '20d093c7b342733460e1efb5b2af64ba133048fcaad8746ae89a6363bddf0b870a51077b71179edeccfced41d40972f691b0a5edd927fda1adb5940e796778e6')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  git submodule update --init --recursive

  patch -Np1 < "../../fix-build.patch"
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

  echo
  echo
  echo -------------------------------------------------------------
  echo 'run to start hyperhdr as user via systemd:'
  echo 'systemctl --user daemon-reload && systemctl --user enable hyperhdr && systemctl --user start hyperhdr'
  echo -------------------------------------------------------------
  echo
  echo
}
