# Maintainer: Fronkles McFranko (mrelfranko@disroot.org)

pkgname=picom-rounded-corners-legacy-glx2
pkgbase=picom-rounded-corners-legacy-glx2
_gitname=picom
pkgver=r1553.469bc39
pkgrel=1
pkgdesc="X Compositor (a fork of xcompmgr-dana) (experimental branch with rounded corners)"
arch=(i686 x86_64)
url="https://github.com/sdhand/picom"
license=('MIT' 'MPL2')
depends=('libgl' 'libev' 'pcre' 'libx11' 'xcb-util-renderutil' 'libxcb' 'xcb-util-image' 'libxext'
         'pixman' 'libconfig' 'libdbus' 'hicolor-icon-theme' 'libxdg-basedir')
makedepends=('git' 'mesa' 'meson' 'asciidoc' 'uthash')
optdepends=('dbus:          To control compton via D-Bus'
            'xorg-xwininfo: For compton-trans'
            'xorg-xprop:    For compton-trans'
            'python:        For compton-convgen.py')
provides=('compton' 'picom')
conflicts=('compton' 'picom' 'picom-rounded-corners' 'compton-rounded-corners')
source=(git+"https://github.com/yshui/picom.git")
md5sums=("SKIP")

prepare() {
    cd "${_gitname}"
    git checkout rounded-corners-legacy-glx2
}

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
  install -D -m644 "picom.sample.conf" "${pkgdir}/etc/xdg/picom.conf.example"
}
