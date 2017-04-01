# Maintainer:  vinszent <vinszent@vinszent.com>

pkgname=gnome-twitch-player-backend-mpv-opengl-git
pkgver=r1010.e74f175
pkgrel=1
pkgdesc="MPV OpenGL (hardware rendering) player backend for GNOME Twitch"
arch=('i686' 'x86_64')
url="https://github.com/vinszent/gnome-twitch"
license=('GPL3')
makedepends=('git' 'meson')
depends=('gnome-twitch-git' 'gtk3' 'libpeas' 'gobject-introspection' 'mpv')
# replaces=('gnome-twitch-mpv') Once 0.4.0 is released we can replace it
source=("$pkgname::git+https://github.com/vinszent/gnome-twitch.git")
md5sums=('SKIP')
conflicts=('gnome-twitch-player-backend-mpv-opengl')

pkgver()
{
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
  cd "${pkgname}"
  rm -rf build
  mkdir build
  cd build
  meson --prefix /usr --libdir lib --buildtype release \
        -Dbuild-executable=false \
        -Dbuild-player-backends=mpv-opengl ..
  ninja
}

package()
{
  cd "${pkgname}/build"
  DESTDIR="$pkgdir" ninja install
}
