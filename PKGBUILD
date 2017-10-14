# Maintainer:  vinszent <vinszent@vinszent.com>

_gitname=gnome-twitch
pkgname=gnome-twitch-player-backend-gstreamer-clutter
pkgver=0.4.0
pkgrel=2
pkgdesc="GStreamer Clutter (hardware rendering) player backend for GNOME Twitch"
arch=('i686' 'x86_64')
url="https://github.com/vinszent/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gnome-twitch' 'gtk3' 'gstreamer' 'gst-libav' 'gst-plugins-base' 'gst-plugins-good' 'gst-plugins-bad' 'libpeas' 'gobject-introspection' 'clutter-gst' 'clutter-gtk')
source=("https://github.com/Ippytraxx/gnome-twitch/archive/v${pkgver}.tar.gz"
        "0001-Fix-typo-in-Meson-build-options.patch")
md5sums=('42abec672144865828a9eb4764037a3a'
         '9efc76e74fbfd6ca20a2b474b0980002')
conflicts=('gnome-twitch-player-backend-gstreamer-clutter-git')

prepare()
{
  cd "${_gitname}-${pkgver}"
  patch -p1 -i ../0001-Fix-typo-in-Meson-build-options.patch
}

build()
{
  cd "${_gitname}-${pkgver}"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --libdir lib --buildtype release \
        -Dbuild-executable=false \
        -Dbuild-player-backends=gstreamer-clutter ..
  ninja
}

package()
{
  cd "${_gitname}-${pkgver}/build"
  DESTDIR="$pkgdir" ninja install
}
