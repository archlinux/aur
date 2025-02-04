# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

# set whether the Qt Quick GUI should be enabled: set to either ON or OFF
_quick_gui=${PASSWORD_MANAGER_QUICK_GUI:-ON}

_reponame=passwordmanager
pkgname=passwordmanager-git
_name=${pkgname%-git}
pkgver=350.4bf6a91
pkgrel=1
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='A simple password store using AES-256-CBC encryption via OpenSSL'
license=(GPL-2.0-or-later)
depends=('qt6-base' 'qtutilities-git' 'passwordfile-git' 'c++utilities-git' 'desktop-file-utils')
makedepends=('cmake' 'ninja' 'qt6-tools' 'git' 'clang' 'qt6-declarative')
[[ $_quick_gui == ON ]] && depends+=('qt6-declarative' 'kirigami')
provides=("${_name}")
conflicts=("${_name}")
url="https://github.com/Martchus/${_reponame}"
source=("${_reponame}::${MARTCHUS_GIT_URL_PREFIX:-git+https://github.com/Martchus}/${_reponame}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  cmake \
    -G Ninja \
    -DCMAKE_BUILD_TYPE:STRING='Release' \
    -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
    -DCONFIGURATION_NAME:STRING='git' \
    -DCONFIGURATION_PACKAGE_SUFFIX:STRING='-git' \
    -DQT_PACKAGE_PREFIX:STRING='Qt6' \
    -DKF_PACKAGE_PREFIX:STRING='KF6' \
    -DQUICK_GUI="$_quick_gui" \
    -DBUILTIN_TRANSLATIONS:BOOL=ON \
    -DBUILTIN_TRANSLATIONS_OF_QT:BOOL=OFF \
    .
  ninja
}

package() {
  depends+=('libqtutilities-git.so' 'libpasswordfile-git.so' 'libc++utilities-git.so')

  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  DESTDIR="${pkgdir}" ninja install
}
