# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set whether the Qt Quick GUI should be enabled: set to either ON or OFF
_quick_gui=${PASSWORD_MANAGER_QUICK_GUI:-OFF}

_reponame=passwordmanager
_cfg=qt6
pkgname=passwordmanager-$_cfg
_name=${pkgname%-$_cfg}
pkgver=4.1.6
pkgrel=2
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='A simple password store using AES-256-CBC encryption via OpenSSL'
license=('GPL')
depends=('qt6-base' 'qtutilities-qt6' 'passwordfile' 'openssl' 'libxkbcommon-x11' 'desktop-file-utils' 'xdg-utils')
makedepends=('cmake' 'ninja' 'qt6-tools' 'clang' 'mesa' 'kirigami2')
url="https://github.com/Martchus/${_reponame}"
source=("${_name}-${pkgver}.tar.gz::https://github.com/Martchus/${_reponame}/archive/v${pkgver}.tar.gz")
sha256sums=('2498867bb85e267202cd8d0e665f9675456072882d43c5aba22219474ccfa008')

# add further dependencies for the Qt Quick GUI (only kirigami2 is "pluggable")
if [[ $_quick_gui == ON ]]; then
    depends+=('qt6-quickcontrols2')
    optdepends+=('kirigami2: Qt Quick GUI')
fi

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  cmake -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCONFIGURATION_NAME:STRING="$_cfg" \
    -DCONFIGURATION_DISPLAY_NAME="Qt 6" \
    -DCONFIGURATION_PACKAGE_SUFFIX_QTUTILITIES:STRING="-$_cfg" \
    -DPASSWORD_MANAGER_CONFIGURATION_TARGET_SUFFIX:STRING="$_cfg" \
    -DQT_PACKAGE_PREFIX:STRING='Qt6' \
    -DBUILTIN_TRANSLATIONS:BOOL=ON \
    -DBUILTIN_TRANSLATIONS_OF_QT:BOOL=OFF \
    -DQUICK_GUI="$_quick_gui" .
  ninja
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame-$pkgver}"
  DESTDIR="${pkgdir}" ninja install
}
