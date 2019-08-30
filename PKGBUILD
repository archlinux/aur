# Maintainer: Louis Taylor <louis@kragniz.eu>
# Contributor: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# Contributor: OK100 <ok100 at lavabit dot com>
# Contributor: Valère Monseur <valere dot monseur at ymail dot com>

pkgname=compton-rounded-corners
_gitname=compton
pkgver=r1186.0359abe
pkgrel=1
pkgdesc="X Compositor (a fork of xcompmgr-dana) (with rounded corners patch)"
arch=(i686 x86_64)
url="https://github.com/sdhand/compton"
license=('MIT' 'MPL2')
depends=('libgl' 'libev' 'pcre' 'libx11' 'xcb-util-renderutil' 'libxcb' 'xcb-util-image' 'libxext'
         'pixman' 'libconfig' 'libdbus' 'hicolor-icon-theme' 'libxdg-basedir')
makedepends=('git' 'mesa' 'meson' 'asciidoc' 'uthash')
optdepends=('dbus:          To control compton via D-Bus'
            'xorg-xwininfo: For compton-trans'
            'xorg-xprop:    For compton-trans'
            'python:        For compton-convgen.py')
provides=('compton')
conflicts=('compton')
source=(git+"https://github.com/sdhand/compton.git#branch=next")
md5sums=("SKIP")

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  meson --buildtype=release . build --prefix=/usr -Dwith_docs=true
  ninja -C build
}

package() {
  cd "${_gitname}"

  DESTDIR="${pkgdir}" ninja -C build install

  # install license
  install -D -m644 "LICENSES/MIT" "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE-MIT"

  # example conf
  install -D -m644 "compton.sample.conf" "${pkgdir}/etc/xdg/compton.conf.example"
}
