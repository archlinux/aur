# Maintainer: tinywrkb <tinywrkb@gmail.com>
#
# pipewire package maintainers:
#   Jan Alexander Steffens (heftig) <heftig@archlinux.org>
#   Jan de Groot <jgc@archlinux.org>

pkgbase=pipewire-gstfree
_pkgbase=pipewire
pkgname=(pipewire-gstfree pipewire-gstfree-docs pipewire-gstfree-jack pipewire-gstfree-pulse pipewire-gstfree-alsa)
pkgver=0.3.8
pkgrel=2
pkgdesc="Server and user space API to deal with multimedia pipelines. packaged without gstreamer dependencies"
url="https://pipewire.org"
license=(LGPL2.1)
arch=(x86_64)
makedepends=(git meson doxygen graphviz xmltoman valgrind jack2 libpulse
             alsa-lib sbc rtkit vulkan-icd-loader
             dbus libsndfile bluez-libs vulkan-headers)
_commit=229fad46914a32b621e88e53abd1270c62b0e158  # tags/0.3.8
source=("git+https://github.com/PipeWire/pipewire#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgbase
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgbase
}

build() {
  arch-meson $_pkgbase build \
    -D udevrulesdir=/usr/lib/udev/rules.d \
    -D gstreamer=false \
    -D docs=true \
    -D man=true

  meson compile -C build
}

check() {
  meson test -C build --print-errorlogs
}

_pick() {
  local p="$1" f d; shift
  for f; do
    d="$srcdir/$p/${f#$pkgdir/}"
    mkdir -p "$(dirname "$d")"
    mv "$f" "$d"
    rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
  done
}

_ver=${pkgver:0:3}

package_pipewire-gstfree() {
  depends=(sbc rtkit vulkan-icd-loader bluez-libs
           libdbus-1.so libsndfile.so libudev.so libasound.so libsystemd.so
           libglib-2.0.so libgobject-2.0.so)
  optdepends=('pipewire-docs: Documentation'
              'pipewire-jack: JACK support'
              'pipewire-pulse: PulseAudio support')
  conflicts=(pipewire)
  provides=(pipewire libpipewire-$_ver.so)
  backup=(etc/pipewire/pipewire.conf)
  install=pipewire.install

  DESTDIR="$pkgdir" meson install -C build

  cd "$pkgdir"

  mkdir -p etc/alsa/conf.d
  ln -st etc/alsa/conf.d /usr/share/alsa/alsa.conf.d/50-pipewire.conf

  _pick docs usr/share/doc

  _pick pulse usr/bin/pw-pulse usr/lib/pipewire-$_ver/pulse

  _pick jack usr/bin/pw-jack usr/lib/pipewire-$_ver/jack
  _pick jack usr/lib/spa-0.2/jack
}

package_pipewire-gstfree-alsa() {
  pkgdesc="ALSA Configuration for PipeWire"
  depends=(libpipewire-$_ver.so)
  conflicts=(pipewire-alsa)
  provides=(pipewire-alsa)

  mkdir -p "$pkgdir/etc/alsa/conf.d"
  ln -st "$pkgdir/etc/alsa/conf.d" /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf
}

package_pipewire-gstfree-docs() {
  pkgdesc+=" (documentation)"
  mv docs/* "$pkgdir"
}

package_pipewire-gstfree-jack() {
  pkgdesc+=" (JACK support)"
  depends=(libpipewire-$_ver.so libjack.so)
  conflicts=(pipewire-jack)
  provides=(pipewire-jack)
  mv jack/* "$pkgdir"
}

package_pipewire-gstfree-pulse() {
  pkgdesc+=" (PulseAudio support)"
  depends=(libpipewire-$_ver.so libglib-2.0.so)
  conflicts=(pipewire-pulse)
  provides=(pipewire-pulse)
  mv pulse/* "$pkgdir"
}
