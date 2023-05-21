# Maintainer: Ruben Deisenroth (Discord: Rubosplay#0815) <aur@ruben-deisenroth.de>

pkgname=xwaylandvideobridge-cursor-mode-2-git
_pkgname=xwaylandvideobridge
pkgver=r101.17c8de6
pkgrel=1
pkgdesc="A tool to make it easy to stream wayland windows and screens to Xwayland applicatons that don't have native pipewire support. Patched to use cursor mode 2."
arch=(x86_64)
url='https://invent.kde.org/system/xwaylandvideobridge'
license=(GPL2)
depends=('qt5-base' 'qt5-x11extras' 'qt5-declarative' 'kcoreaddons' 'kwindowsystem' 'knotifications' 'ki18n' 'libxcb' 'kpipewire'  'gcc-libs' 'glibc' 'hicolor-icon-theme')
makedepends=('git')
conflicts=('xwaylandvideobridge-bin' 'xwaylandvideobridge-git')
source=("${pkgname}::git+https://invent.kde.org/system/xwaylandvideobridge.git" "cursor-mode.patch")
sha256sums=('SKIP'
            'ca7c6ff75e22acb4407e3a349a3ad791cafef92771cef77d6f646fbc0d07046a')

# Dynamically update Package Version from Git
pkgver() {
  cd ${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  patch --directory="${srcdir}/${pkgname}" --forward --strip=1 --input="${srcdir}/cursor-mode.patch"
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr .
  DESTDIR="${pkgdir}" ninja
}

check() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" ninja test
}

# Build Package
package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" ninja install
}
