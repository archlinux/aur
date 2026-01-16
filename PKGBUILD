# Maintainer: Sasha Marie te Rehorst <sasha.marieterehorst@gmail.com>
# Contributor: Martin Stolpe <martin dot stolpe at gmail dot com>
# Contributor: Aimilius <aimilius at protonmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=discover-git
_pkgname=discover
pkgver=6.5.90.r7.g9e55661
pkgrel=1
pkgdesc='KDE and Plasma resources management GUI (Git version)'
arch=(x86_64)
url='https://apps.kde.org/discover/'
license=(LGPL-2.0-or-later)
groups=(plasma)
depends=(appstream-qt archlinux-appstream-data attica discount gcc-libs glib2 glibc kauth kcmutils kconfig kcoreaddons kcrash kdbusaddons ki18n kiconthemes kidletime kio kirigami kirigami-addons kjobwidgets knewstuff knotifications kservice kstatusnotifieritem kuserfeedback kwidgetsaddons kwindowsystem purpose qcoro qqc2-desktop-style qt6-base qt6-declarative qt6-webview)
makedepends=(extra-cmake-modules flatpak fwupd git packagekit-qt6)
optdepends=('flatpak: Flatpak packages support' 'fwupd: firmware update support' 'packagekit-qt6: to manage packages from Arch Linux repositories')
conflicts=(discover)
provides=(discover)
source=("git+https://invent.kde.org/plasma/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  local _ver
  _ver="$(git describe --long --tags --abbrev=7 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
  if [ -z "$_ver" ]; then
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  else
    echo "$_ver"
  fi
}

build() {
  cmake -B build -S $_pkgname \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DQT_MAJOR_VERSION=6
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
