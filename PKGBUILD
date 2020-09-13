pkgbase=lib32-pipewire-git
pkgname=('lib32-pipewire-git'
         'lib32-pipewire-jack-git'
         'lib32-pipewire-pulse-git'
         )
pkgver=0.3.11.6.gf6bc9113
pkgrel=1
pkgdesc='Server and user space API to deal with multimedia pipelines. (GIT version)(32-bit client libraries)'
arch=('x86_64')
url='https://pipewire.org'
license=('LGPL')
makedepends=('git'
             'meson'
             'valgrind'
             'lib32-jack2'
             'lib32-libpulse'
             'lib32-alsa-lib'
             'lib32-sbc'
             'rtkit'
             'lib32-vulkan-icd-loader'
             'lib32-dbus'
             'lib32-libsndfile'
             'lib32-bluez-libs'
             'vulkan-headers'
             )
source=('git+https://gitlab.freedesktop.org/pipewire/pipewire.git')
sha256sums=('SKIP')

pkgver() {
  cd pipewire
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  cd pipewire
}

build() {
  cd "${srcdir}/build"

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  CFLAGS+=" -Wformat"

  arch-meson ../pipewire \
    --libdir /usr/lib32 \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D docs=false \
    -D tests=false \
    -D gstreamer=false \
    -D ffmpeg=false \

  ninja
}

_pick() {
  local f d
  for f; do
    d="${pkgdir}/${f#$srcdir/install/}"
    mkdir -p "$(dirname "${d}")"
    mv "${f}" "${d}"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "${f}")"
  done
}

package_lib32-pipewire-git() {
  depends=('lib32-sbc'
           'rtkit'
           'lib32-vulkan-icd-loader'
           'lib32-bluez-libs'
           'lib32-dbus'
           'lib32-libsndfile'
           )
  optdepends=('pipewire-docs: Documentation'
              'lib32-pipewire-jack: JACK support'
              'lib32-pipewire-pulse: PulseAudio support'
              )
  provides=('lib32-pipewire')
  conflicts=('lib32-pipewire')

  DESTDIR="${srcdir}/install" meson install -C build

  cd "${pkgdir}"

  _pick "${srcdir}"/install/usr/lib32/libpipewire-${pkgver:0:3}.so*
  _pick "${srcdir}"/install/usr/lib32/alsa-lib/*
  _pick "${srcdir}"/install/usr/lib32/pipewire-${pkgver:0:3}/libpipewire-module-*.so
  _pick "${srcdir}"/install/usr/lib32/pkgconfig/*
  _pick "${srcdir}"/install/usr/lib32/spa-0.2/*
}

package_lib32-pipewire-jack-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (JACK support)(GIT Version)(32-bit version)'
  depends=('lib32-pipewire'
           'lib32-jack2'
           )
  provides=('lib32-pipewire-jack')
  conflicts=('lib32-pipewire-jack')

  _pick "${srcdir}"/install/usr/lib32/pipewire-${pkgver:0:3}/jack/*
}

package_lib32-pipewire-pulse-git() {
  pkgdesc='Server and user space API to deal with multimedia pipelines. (Pulse support)(GIT version)(32-bit version)'
  depends=('lib32-pipewire'
           'lib32-libpulse'
           'lib32-glib2'
           )
  provides=('lib32-pipewire-pulse')
  conflicts=('lib32-pipewire-pulse')

  _pick "${srcdir}"/install/usr/lib32/pipewire-${pkgver:0:3}/pulse/*
}
