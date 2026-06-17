# Maintainer: jakka <jakkadoujin at gmail dot com>

pkgname=hydownloader-systray-git
pkgver=r145.2053ace
pkgrel=1
pkgdesc="Remote management GUI for hydownloader"
arch=('i686' 'x86_64')
url="https://gitgud.io/thatfuckingbird/hydownloader-systray"
depends=( qt6-base )
makedepends=(git cmake qt6-tools qt6-base)
provides=(hydownloader-systray)
license=('GNU AGPL')
source=("$pkgname"::"git+https://gitgud.io/thatfuckingbird/hydownloader-systray.git"
        "hydownloader-systray.desktop")
sha256sums=('SKIP'
            '9a5071dc0e7cf298258531e1f769d85b8d7763de3e63654390f77f76d08d93ab')
optdepends=(
    'hydownloader-git: Alternative download system for Hydrus'
    'hydrus: Danbooru-like image tagging and searching system for the desktop'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="$pkgdir" make install
  install -d -m755 "${pkgdir}/usr/share/applications"
  install -m644 "../hydownloader-systray.desktop" "${pkgdir}/usr/share/applications/hydownloader-systray.desktop"
  install -Dm644 "./icon/hydownloader-systray.png" "${pkgdir}/usr/share/icons/hydownloader-systray.png"
}
