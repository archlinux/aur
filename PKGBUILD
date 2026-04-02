# Maintainer: Lu Xu <oliver_lew at outlook dot com>
# Contributor: 1654755689 <1654755689 at qq dot com>

_pkgname=fcitx5-chinese-addons
pkgname=${_pkgname}-without-browser
pkgver=5.1.12
pkgrel=1
_py_stroke_ver=20250329
_py_table_ver=20121124
pkgdesc='Addons related to Chinese, including IME previous bundled inside fcitx4, without webkit or webengine dependencies'
arch=('x86_64')
url='https://github.com/fcitx/fcitx5-chinese-addons'
license=('LGPL-2.1-or-later' 'Unicode-DFS-2016')
depends=('fcitx5-qt' 'libime' 'opencc' 'hicolor-icon-theme')
makedepends=('boost' 'extra-cmake-modules' 'fcitx5-lua' 'fmt' 'ninja')
optdepends=('fcitx5-lua: Lua and imeapi support from pinyin')
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${_pkgname}_${pkgver}.tar.gz"::"${url}/archive/refs/tags/${pkgver}.tar.gz"
        "https://download.fcitx-im.org/data/py_stroke-$_py_stroke_ver.tar.gz"
        "https://download.fcitx-im.org/data/py_table-$_py_table_ver.tar.gz")
sha256sums=('b60de3b84dbb091f1301367ba9d2e8228735bf7a0ff125b738b8363c74b2ff32'
            'c1a7ca7225d3614ab83353fc827503006a980447762018f53760425d7b5303a6'
            '42146ac97de6c13d55f9e99ed873915f4c66739e9c11532a34556badf9792c04')
noextract=("py_stroke-$_py_stroke_ver.tar.gz"
           "py_table-$_py_table_ver.tar.gz")

prepare() {
  cd ${_pkgname}-${pkgver}

  mv ../py_stroke-$_py_stroke_ver.tar.gz modules/pinyinhelper/
  mv ../py_table-$_py_table_ver.tar.gz modules/pinyinhelper/
  # grep to make sure the version is correct
  grep "PY_STROKE_VER $_py_stroke_ver" modules/pinyinhelper/CMakeLists.txt
  grep "PY_TABLE_VER $_py_table_ver" modules/pinyinhelper/CMakeLists.txt
}

build() {
  cd ${_pkgname}-${pkgver}
  cmake -Wno-dev -GNinja \
      -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_INSTALL_LIBDIR=/usr/lib \
      -DENABLE_BROWSER=off .
  ninja
}

package() {
  cd ${_pkgname}-${pkgver}
  install -Dm644 COPYING.unicode "${pkgdir}/usr/share/licenses/${pkgname}/Unicode-DFS-2016.txt"
  DESTDIR="$pkgdir" ninja install
}
