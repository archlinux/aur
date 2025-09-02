# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set whether the Qt Quick GUI should be enabled: set to either ON or OFF
_quick_gui=${PASSWORD_MANAGER_QUICK_GUI:-OFF}

_reponame=passwordmanager
pkgname=passwordmanager
pkgver=4.2.5
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='A simple password store using AES-256-CBC encryption via OpenSSL'
license=(GPL-2.0-or-later)
depends=('qt5-base' 'qtutilities' 'passwordfile' 'c++utilities' 'desktop-file-utils')
makedepends=('cmake' 'ninja' 'qt5-tools' 'kirigami2')
url="https://github.com/Martchus/${_reponame}"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('0eee2ae39c817f092f457f71018137514dc91d066278ffb7a2eb3743aa597855')

# add further dependencies for the Qt Quick GUI (only kirigami2 is "pluggable")
if [[ $_quick_gui == ON ]]; then
    depends+=('qt5-quickcontrols2')
    optdepends+=('kirigami2: Qt Quick GUI')
fi

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DQUICK_GUI="$_quick_gui" \
    -DBUILTIN_TRANSLATIONS:BOOL=ON \
    -DBUILTIN_TRANSLATIONS_OF_QT:BOOL=OFF \
    .
  ninja
}

package() {
  depends+=('libqtutilities.so' 'libpasswordfile.so' 'libc++utilities.so')

  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
