# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_reponame=qtforkawesome
_pkgver_forkawesome=1.2.0
_reponame_forkawesome=Fork-Awesome-$_pkgver_forkawesome
pkgname=qtforkawesome-git
_name=${pkgname%-git}
pkgver=46.1c92ea5
pkgrel=2
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
pkgdesc='Library that bundles ForkAwesome for use within Qt applications'
license=('GPL')
depends=('qt5-base' 'mesa')
optdepends=(
  'qt5-declarative: Qt Quick integration'
  "$_name-doc: API documentation"
)
makedepends=('cmake' 'git' 'ninja' 'perl-yaml-libyaml' 'qtutilities-git' 'qt5-declarative')
provides=(libqtforkawesome-git.so)
url="https://github.com/Martchus/${_reponame}"
source=("${_reponame}::${MARTCHUS_GIT_URL_PREFIX:-git+https://github.com/Martchus}/${_reponame}.git"
        "${_reponame_forkawesome}::https://github.com/ForkAwesome/Fork-Awesome/archive/refs/tags/${_pkgver_forkawesome}.tar.gz")
sha256sums=('SKIP'
            '23fba5f191f204e0414c547bf4c9b10fd7ca42c151260e8f64698449a75fbdb3')

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
    -DCONFIGURATION_TARGET_SUFFIX:STRING='git' \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILTIN_TRANSLATIONS:BOOL=ON \
    -DFORK_AWESOME_FONT_FILE="$srcdir/${_reponame_forkawesome}/fonts/forkawesome-webfont.woff2" \
    -DFORK_AWESOME_ICON_DEFINITIONS="$srcdir/${_reponame_forkawesome}/src/icons/icons.yml" \
    .
  ninja
}

check() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  QT_QPA_PLATFORM=offscreen ninja check
}

package() {
  cd "$srcdir/${PROJECT_DIR_NAME:-$_reponame}"
  DESTDIR="${pkgdir}" ninja install
}
