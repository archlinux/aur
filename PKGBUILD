# Merged with official ABS plasma-desktop PKGBUILD by João, 2021/01/31 (all respective contributors apply herein)
# Maintainer: João Figueiredo <jf.mundox@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=plasma-desktop-git
pkgver=5.21.80_r8192.g6be4dd2d6
pkgrel=1
pkgdesc='KDE Plasma Desktop'
arch=($CARCH)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
groups=(plasma-git)
depends=(polkit-kde-agent-git libxkbfile kmenuedit-git systemsettings-git ksysguard-git baloo-git libibus accountsservice)
optdepends=('plasma-nm-git: Network manager applet'
            'powerdevil-git: power management, suspend and hibernate support'
            'kscreen-git: screen management'
            'ibus: kimpanel IBUS support'
            'scim: kimpanel SCIM support'
            'kaccounts-integration-git: OpenDesktop integration plugin')
conflicts=(${pkgname%-git} user-manager knetattach user-manager-git knetattach-git)
provides=(${pkgname%-git} user-manager knetattach user-manager-git knetattach-git)
replaces=(user-manager-git knetattach-git)
makedepends=(git extra-cmake-modules-git kdoctools-git xf86-input-evdev xf86-input-synaptics xf86-input-libinput xorg-server-devel scim kdesignerplugin-git kaccounts-integration-git intltool)
source=("git+https://github.com/KDE/${pkgname%-git}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'set(PROJECT_VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
