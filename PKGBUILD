# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgbase=plasma-desktop-git
pkgname=(plasma-desktop-git knetattach-git)
pkgver=r7932.d5a68ae77
pkgrel=1
pkgdesc='KDE Plasma Desktop'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/kde-workspace'
license=(LGPL)
depends=(polkit-kde-agent-git libxkbfile kmenuedit-git systemsettings-git ksysguard-git baloo-git accountsservice)
makedepends=(extra-cmake-modules-git kdoctools-git xf86-input-evdev xf86-input-synaptics xf86-input-libinput xorg-server-devel scim kdesignerplugin kaccounts-integration intltool git)
conflicts=(plasma-desktop knetattach)
provides=(plasma-desktop knetattach)
source=("git+https://github.com/KDE/plasma-desktop.git")
groups=(plasma)
md5sums=('SKIP')

pkgver() {
  cd plasma-desktop
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cmake -B build -S plasma-desktop \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_LIBEXECDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  cmake --build build
}

package_plasma-desktop-git() {
  depends+=(knetattach)
  optdepends=('plasma-nm: Network manager applet'
              'powerdevil: power management, suspend and hibernate support'
              'kscreen: screen management'
              'ibus: kimpanel IBUS support'
              'scim: kimpanel SCIM support'
              'kaccounts-integration: OpenDesktop integration plugin')
  replaces=(user-manager)

  DESTDIR="$pkgdir" cmake --install build

# Split knetattach
  rm "$pkgdir"/usr/{bin/knetattach,share/applications/org.kde.knetattach.desktop}
}

package_knetattach-git() {
  pkgdesc='Wizard which makes it easier to integrate network resources with the Plasma Desktop'
  depends=(kdelibs4support-git)

  DESTDIR="$pkgdir" cmake --install build/knetattach
}
