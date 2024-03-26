# Maintainer: Christoph Haag <christoph.haag@collabora.com>
 
_realname='libinputsynth'
pkgname="$_realname-git"
pkgver=0.16.0.r75.f369bcf
pkgrel=1
pkgdesc='Synthesize desktop input for X11 and Wayland'
arch=('i686' 'x86_64')
url='https://gitlab.freedesktop.org/xrdesktop/libinputsynth'
depends=('glib2' 'glibc' 'libx11' 'libxi' 'libxtst' 'xdotool' 'gcc-libs')
provides=("$_realname="$pkgver)
conflicts=("$_realname")
makedepends=('meson' 'git')
license=('MIT')
# options=('debug' '!strip')
source=('git+https://gitlab.freedesktop.org/xrdesktop/libinputsynth.git')
md5sums=('SKIP')

ver() {
  PREFIX="project('libinputsynth', 'c', version: '"
  echo $(grep "$PREFIX" meson.build | sed -e "s/${PREFIX}//" | sed "s/',//")
}

pkgver() {
  cd "$_realname"
  printf "$(ver).r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_realname"
  rm -rf build
  meson setup build --prefix=/usr/ --libdir=lib
  ninja -C build
}

package() {
  cd "$_realname"
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "${srcdir}"/libinputsynth/LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
