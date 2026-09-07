# Maintainer: shorin <fcl709@outlook.com>
# Based on the official fcitx5 PKGBUILD by Felix Yan <felixonmars@archlinux.org>

_pkgname=fcitx5
pkgname=${_pkgname}-shorin-patched-git
pkgver=5.1.22
_dictver=20121020
pkgrel=1
pkgdesc="Next generation of fcitx (official build + XIM CJK character leak fix)"
arch=('x86_64')
url="https://github.com/fcitx/fcitx5"
license=('LGPL-2.1-or-later' 'Unicode-DFS-2016')
groups=('fcitx5-im')
depends=('cairo' 'enchant' 'iso-codes' 'libgl' 'libxkbcommon-x11' 'pango' 'systemd' 'wayland'
         'xcb-imdkit' 'xcb-util-wm' 'libxkbfile' 'gdk-pixbuf2' 'librsvg' 'yoga')
makedepends=('git' 'extra-cmake-modules' 'ninja' 'nlohmann-json' 'plasma-wayland-protocols' 'wayland-protocols')
provides=("${_pkgname}=${pkgver}" "${_pkgname}-git")
conflicts=('fcitx' "${_pkgname}" "${_pkgname}-git")
source=("git+https://github.com/fcitx/fcitx5.git#tag=$pkgver?signed"
        "https://download.fcitx-im.org/data/en_dict-$_dictver.tar.gz"
        "0001-fix-xim-cjk-leak.patch")
noextract=("en_dict-$_dictver.tar.gz")
sha512sums=('aeb0d44fe37289f9a6b99142c5a8453ebfbd7cced79bb5d7dcbd8159de433de6027872d5eb7c6c6e74d33d1e34caef0cfa188c6b2c633cc0b265b01a0491c8a0'
            '8418bd02492bfd786c0fab93be4400ef027ec8e9fac02220cc1f653f5eb67f54573a6a84a15baba19bb34ab892745c87df16499d6304ea75009131e2ab3b97f2'
            '9033006db6b8530bce9b0ac4be296e691c5d7804aad4df2a297f5d56f6a2bd0502e735e509736da33b935d657fe0d7d926decf7e09ebe3b02419c41d78e2119d')
validpgpkeys=('2CC8A0609AD2A479C65B6D5C8E8B898CBF2412F9') # Weng Xuetian <wengxt@gmail.com>

prepare() {
  mv en_dict-$_dictver.tar.gz fcitx5/src/modules/spell/en_dict-$_dictver.tar.gz
  # grep to make sure the version is correct
  grep "SPELL_EN_DICT_VER $_dictver" fcitx5/src/modules/spell/CMakeLists.txt

  cd fcitx5
  patch -Np1 -i "$srcdir/0001-fix-xim-cjk-leak.patch"
}

build() {
  cd fcitx5

  cmake -GNinja -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DCMAKE_INSTALL_SYSCONFDIR=/etc -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib \
        -DUSE_SYSTEM_YOGA=ON .
  ninja
}

check() {
  cd fcitx5
  ninja test
}

package() {
  cd fcitx5
  DESTDIR="$pkgdir" ninja install
  install -Dm644 LICENSES/Unicode-DFS-2016.txt -t "$pkgdir"/usr/share/licenses/$pkgname/
}
