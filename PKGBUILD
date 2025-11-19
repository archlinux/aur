# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Gilles Gagniard <gilles@gagniard.org>

pkgname=sddm-idle
_pkgname=sddm
pkgver=0.21.0
pkgrel=6.2
pkgdesc='QML based X11 and Wayland display manager'
arch=(x86_64)
url='https://github.com/sddm/sddm'
license=(GPL-2.0-or-later)
depends=(bash
         gcc-libs
         glibc
         libxau
         libxcb
         pam
         qt6-base
         qt6-declarative
         systemd-libs
         ttf-font
         xorg-server
         xorg-xauth)
makedepends=(extra-cmake-modules
             git
             python-docutils
             qt5-base
             qt5-declarative
             qt5-tools
             qt6-tools)
optdepends=('qt5-declarative: for using Qt5 themes')
backup=('usr/share/sddm/scripts/Xsetup'
        'usr/share/sddm/scripts/Xstop'
        'etc/pam.d/sddm'
        'etc/pam.d/sddm-autologin'
        'etc/pam.d/sddm-greeter')
provides=(display-manager sddm)
conflicts=(sddm)
source=(git+https://github.com/$_pkgname/$_pkgname#tag=v$pkgver
        https://patch-diff.githubusercontent.com/raw/sddm/sddm/pull/1878.patch)
sha256sums=('67394c93f331fc02f89559f68e149a992efaed07690f548e6a83ec384ebb8000'
            '9cb66283309fe7274d289a93d76696904e4dc47b1dfb2c15a3d3a44e1d6573d3')

prepare() {
  git -C $_pkgname cherry-pick -n 228778c2b4b7e26db1e1d69fe484ed75c5791c3a # Fix build with cmake 4
  patch -d $_pkgname -Np1 -i "$srcdir/1878.patch"
}

build() {
  cmake -B build -S $_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
        -DBUILD_WITH_QT6=ON \
        -DDBUS_CONFIG_DIR=/usr/share/dbus-1/system.d \
        -DDBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
        -DBUILD_MAN_PAGES=ON \
        -DUID_MAX=60513
  cmake --build build

  cmake -B build5 -S $_pkgname \
        -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build5/src/greeter
  cmake --build build5/components
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  DESTDIR="$pkgdir" cmake --install build5/src/greeter
  DESTDIR="$pkgdir" cmake --install build5/components

  install -d "$pkgdir"/usr/lib/sddm/sddm.conf.d
  "$pkgdir"/usr/bin/sddm --example-config > "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
# Don't set PATH in sddm.conf
  sed -r 's|DefaultPath=.*|DefaultPath=/usr/local/sbin:/usr/local/bin:/usr/bin|g' -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
# Unset InputMethod https://github.com/sddm/sddm/issues/952
  sed -e "/^InputMethod/s/qtvirtualkeyboard//" -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
}

