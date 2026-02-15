# Maintainer: Mokurin000
_pkgname=fknc-calculator
pkgname=${_pkgname}-git
pkgver=r13.da08ad4
pkgrel=1
pkgdesc="《蛋仔派对》™ 疯狂农场玩法果实价值计算器。"
arch=('x86_64' 'aarch64')
url="https://github.com/mokurin000/fknc-calculator"
license=('MIT')
depends=(
    'cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3'
    'pango' 'webkit2gtk-4.1'
    'hicolor-icon-theme' 'libsoup'
)
makedepends=(
    # tooling
    'cargo' 'cargo-tauri'
    # source tree
    'git' 'git-lfs'
    # build-time dependencies
    'openssl' 'appmenu-gtk-module' 'libappindicator-gtk3' 'librsvg'
    # parse tauri.conf.json
    'jq'
)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("git+${url}.git#branch=main")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}"

  git config --local lfs.url "${url}.git/info/lfs"
  git lfs install --local
  git lfs pull
}

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

build() {
  cd "${srcdir}/${_pkgname}"
  cargo +nightly tauri build -b deb
}

package() {
  cd "${srcdir}/${_pkgname}"

  local appname=$(jq -r .productName src-tauri/tauri.conf.json)
  local appversion=$(jq -r .version src-tauri/tauri.conf.json)

  cp -a src-tauri/target/release/bundle/deb/${appname}_${appversion}_*/data/* "${pkgdir}"
}
