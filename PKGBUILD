# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sddm
pkgver=0.20.0
pkgrel=4
pkgdesc='QML based X11 and Wayland display manager'
arch=(x86_64)
url='https://github.com/sddm/sddm'
license=(GPL-2.0-only)
depends=(gcc-libs
         glibc
         libxau
         libxcb
         pam
         qt5-base
         qt5-declarative
         sh
         systemd-libs
         ttf-font
         xorg-server
         xorg-xauth)
makedepends=(extra-cmake-modules
             python-docutils
             qt5-tools)
backup=('usr/share/sddm/scripts/Xsetup'
        'usr/share/sddm/scripts/Xstop'
        'etc/pam.d/sddm'
        'etc/pam.d/sddm-autologin'
        'etc/pam.d/sddm-greeter')
provides=(display-manager)
source=(https://github.com/$pkgname/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/sddm/sddm/commit/b002d02b.patch)
sha256sums=('467c8bd91e0d4f76d4bc4e57ab334f1f48a33478482ba9476d93b0b3d7ace9fb'
            'b57c5e2fec316116dc09aa5c11700c79b36e2e2c82fb21c10a3e10a7bf8c2cdd')

prepare() {
  patch -d $pkgname-$pkgver -p1 < b002d02b.patch # Prevent systemd from removing old xauth files
}

build() {
  cmake -B build -S $pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib/sddm \
        -DDBUS_CONFIG_DIR=/usr/share/dbus-1/system.d \
        -DDBUS_CONFIG_FILENAME=sddm_org.freedesktop.DisplayManager.conf \
        -DBUILD_MAN_PAGES=ON \
        -DUID_MAX=60513
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  install -d "$pkgdir"/usr/lib/sddm/sddm.conf.d
  "$pkgdir"/usr/bin/sddm --example-config > "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
# Don't set PATH in sddm.conf
  sed -r 's|DefaultPath=.*|DefaultPath=/usr/local/sbin:/usr/local/bin:/usr/bin|g' -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
# Unset InputMethod https://github.com/sddm/sddm/issues/952
  sed -e "/^InputMethod/s/qtvirtualkeyboard//" -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
}
