# Maintainer: shorin <fcl709@outlook.com>
# Based on fcitx5-git by Capricornus007 <Capricornus007 at proton dot me>

_SPELL_EN_DICT_VER='20121020'
_SPELL_EN_DICT_SHA256='c44a5d7847925eea9e4d2d04748d442cd28dd9299a0b572ef7d91eac4f5a6ceb'

_pkgname=fcitx5
pkgname=${_pkgname}-shorin-patched-git
pkgver=5.1.22.r5.g4146a2a7
pkgrel=1
options=(!debug)
pkgdesc="Next generation of fcitx (with XIM leak fix)"
arch=('x86_64')
url="https://github.com/SHORiN-KiWATA/fcitx5"
license=('GPL')
depends=('cairo' 'enchant' 'gdk-pixbuf2' 'iso-codes' 'libgl' 'librsvg' 'libxkbcommon-x11'
         'libxkbfile' 'pango' 'wayland' 'xcb-imdkit' 'xcb-util-wm' 'yoga')
makedepends=('extra-cmake-modules' 'git' 'ninja' 'wayland-protocols'
             'plasma-wayland-protocols' 'nlohmann-json')
provides=("${_pkgname}" "${_pkgname}-git")
conflicts=("${_pkgname}" "${_pkgname}-git")

source=("git+$url.git"
	"en_dict-${_SPELL_EN_DICT_VER}.tar.gz::http://download.fcitx-im.org/data/en_dict-${_SPELL_EN_DICT_VER}.tar.gz")
sha256sums=('SKIP'
            'c44a5d7847925eea9e4d2d04748d442cd28dd9299a0b572ef7d91eac4f5a6ceb')

pkgver() {
  cd fcitx5
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd fcitx5
  git submodule update --init --recursive

  cd src/modules/spell
  cp "$srcdir/en_dict-${_SPELL_EN_DICT_VER}.tar.gz" .
}

build(){
  cd fcitx5

  cmake -GNinja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
        -DUSE_SYSTEM_YOGA=ON \
        -DENABLE_SYSTEMD=OFF .
  ninja
}

check(){
  cd fcitx5
  ninja test
}

package() {
  cd fcitx5
  DESTDIR="$pkgdir" ninja install
}
