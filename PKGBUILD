# Maintainer: coolingtool <coolingtool-backup@outlook.com>
# Contributor: Maintainer of qt5-wayland Felix Yan <felixonmars@archlinux.org>
# Contributor: Contributor of qt5-wayland Andrea Scarpino <andrea@archlinux.org>
# (Modified from qt5-wayland's PKGBUILD)

_basename=qt5-wayland
pkgname=qt5-wayland-decorations
_basever=5.15.11
pkgver=5.15.11+kde+r59
pkgrel=1
_commit=4de268cbaf6ff3b633429577f06d3d746a3b202a
_patchcommit=2ff721c9b7894cb8dfd2912744209ac3d9733484
arch=('x86_64')
url='https://www.qt.io'
license=('GPL3' 'LGPL3' 'FDL' 'custom')
pkgdesc='Provides APIs for Wayland (with patch required for shadows on qadwaitadecorations-qt5)'
depends=('qt5-declarative' 'libxcomposite')
provides=('qt5-wayland')
conflicts=('qt5-wayland')
makedepends=('vulkan-headers' 'git')
_pkgfqn=${_basename/5-/}
source=(git+https://invent.kde.org/qt/qt/$_pkgfqn#commit=$_commit
        https://src.fedoraproject.org/rpms/qt5-qtwayland/raw/$_patchcommit/f/qtwayland-decoration-support-backports-from-qt6.patch)
sha256sums=('SKIP'
            '4d8c5d686666cbaae7550ec3defee66ea56ca624152c56c51ff945693706c29d')

pkgver() {
  cd $_pkgfqn
  echo "$_basever+kde+r"`git rev-list --count v$_basever-lts-lgpl..$_commit` | sed -e 's|+kde+r0||'
}

prepare() {
  mkdir -p build
  patch --directory="$_pkgfqn" --strip=1 --input="${srcdir}/qtwayland-decoration-support-backports-from-qt6.patch"
}

build() {
  cd build

  qmake ../${_pkgfqn}
  make
}

package() {
  cd build

  make INSTALL_ROOT="$pkgdir" install

  # Drop QMAKE_PRL_BUILD_DIR because reference the build dir
  find "$pkgdir/usr/lib" -type f -name '*.prl' \
    -exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

  install -d "$pkgdir"/usr/share/licenses
  ln -s /usr/share/licenses/qt5-base "$pkgdir"/usr/share/licenses/${pkgname}
}
