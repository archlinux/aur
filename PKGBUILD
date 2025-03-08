# Maintainer: yjmthu <yjmthu@gmail.com>
# Maintainer: taotieren <admin@taotieren.com>

pkgname=neobox-git
pkgver=2.4.6.r14.gd8476fe
pkgrel=1
pkgdesc="采用 C++ 20 编写的一个插件管理工具，可以安装网速悬浮窗等插件。"
arch=($CARCH)
url="https://github.com/yjmthu/Neobox"
license=('MIT')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=(
  curl
  libnotify
  qt6-base
  # AUR
  cpp-httplib
)
makedepends=(
  cmake
  git
  qt6-tools
  ninja)
backup=()
options=('!strip')
source=(
  "${pkgname}::git+${url}.git"
  "WinToast::git+https://github.com/mohabouje/WinToast.git"
  "YJson::git+https://github.com/yjmthu/YJson.git"
  "zip::git+https://github.com/kuba--/zip.git"
)
sha256sums=('SKIP'
  'SKIP'
  'SKIP'
  'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}/"
  git describe --long --tags | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.thirdlib/WinToast.url "$srcdir/WinToast"
  git config submodule.thirdlib/YJson.url "$srcdir/YJson"
  git config submodule.thirdlib/zip.url "$srcdir/zip"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}/"
  cmake -S . \
    -D CMAKE_BUILD_TYPE=None \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -B build \
    -G Ninja \
    -Wno-dev

  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/$pkgname/build install

  cd "${srcdir}/${pkgname}/pluginmgr/desktop"
  install -Dm644 \
    "neobox.desktop" \
    "$pkgdir/usr/share/applications/${pkgname%-git}.desktop"
  # icon
  local _icon
  for _icon in 16 32 64 128; do
    install -Dm0644 ${pkgname%-git}${_icon}x${_icon}.png \
      ${pkgdir}/usr/share/icons/hicolor/${_icon}x${_icon}/apps/${pkgname%-git}.png
  done
}
