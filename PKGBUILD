# Maintainer: Miranda Collins <miranda@stellarx11.org>
# Contributor: Capricornus007 <Capricornus007 at proton dot me>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: csslayer <wengxt AT gmail com>

# Fork of fcitx5 (zaphodheads branch) adding multi-screen (ZaphodHeads)
# support for X11 classicui and the XIM frontend.

_SPELL_EN_DICT_VER='20121020'
_SPELL_EN_DICT_SHA256='c44a5d7847925eea9e4d2d04748d442cd28dd9299a0b572ef7d91eac4f5a6ceb'

_enable_wayland=OFF

_pkgname=fcitx5-zaphodheads
pkgname=${_pkgname}-git
pkgver=5.1.23.r53.g81e39861
pkgrel=1
pkgdesc="Next generation of fcitx with X11 ZaphodHeads multi-screen support"
arch=('i686' 'x86_64')
url="https://github.com/stellarx11/fcitx5"
license=('LGPL-2.1-or-later AND Unicode-DFS-2016')

depends=(
    'cairo' 'enchant' 'iso-codes' 'libgl' 'libxkbcommon-x11' 'pango'
    'xcb-imdkit' 'xcb-util-wm' 'libxkbfile' 'fmt' 'gdk-pixbuf2'
)
makedepends=('extra-cmake-modules' 'git' 'ninja')

if [[ $_enable_wayland == ON ]]; then
    depends+=('wayland')
    makedepends+=('plasma-wayland-protocols' 'wayland-protocols')
fi

provides=("fcitx5=${pkgver}")
conflicts=('fcitx5' 'fcitx')

source=(
    "${pkgname}::git+${url}.git#branch=zaphodheads"
    "en_dict-${_SPELL_EN_DICT_VER}.tar.gz::http://download.fcitx-im.org/data/en_dict-${_SPELL_EN_DICT_VER}.tar.gz"
)

sha256sums=(
	'SKIP'
	"$_SPELL_EN_DICT_SHA256"
)

pkgver() {
  cd "$pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"
  git submodule update --init --recursive

  cd src/modules/spell
  cp "$srcdir/en_dict-${_SPELL_EN_DICT_VER}.tar.gz" .
}

build(){
  cd "$pkgname"

  cmake -GNinja \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc \
		-DENABLE_WAYLAND="$_enable_wayland" \
        -DENABLE_SYSTEMD=OFF .
  ninja
}

check(){
  cd "$pkgname"
  ninja test
}

package() {
  cd "$pkgname"
  DESTDIR="$pkgdir" ninja install
  install -Dm644 LICENSES/Unicode-DFS-2016.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
