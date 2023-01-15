# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=sddm
pkgver=0.19.0
pkgrel=9
pkgdesc='QML based X11 and Wayland display manager'
arch=(x86_64)
url='https://github.com/sddm/sddm'
license=(GPL)
depends=(qt5-declarative xorg-xauth xorg-server ttf-font)
makedepends=(extra-cmake-modules python-docutils qt5-tools)
backup=('usr/share/sddm/scripts/Xsetup'
        'usr/share/sddm/scripts/Xstop'
        'etc/pam.d/sddm'
        'etc/pam.d/sddm-autologin'
        'etc/pam.d/sddm-greeter')
provides=(display-manager)
source=($pkgname-$pkgver.tar.gz::"https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz"
        sddm.sysusers sddm.tmpfiles
        pam-faillock.patch
        sddm-fix-race-pre.patch::https://github.com/sddm/sddm/commit/68cc9e31.patch
        sddm-fix-race.patch::https://patch-diff.githubusercontent.com/raw/sddm/sddm/pull/1324.patch
        sddm-desktop-session.patch::https://github.com/sddm/sddm/commit/5fd5ed27.patch
        sddm-no-portal.patch
        sddm-fix-build.patch)
sha256sums=('e76da1f13d5ad5e0179e3fec57543126044339405ef19c397e105e0807bd4e41'
            '9fce66f325d170c61caed57816f4bc72e9591df083e89da114a3bb16b0a0e60f'
            'db625f2a3649d6d203e1e1b187a054d5c6263cadf7edd824774d8ace52219677'
            '441f441fc63c16c5dbd83411a305d88b17e50836c958677db881b9b6c13c668a'
            '2911474a2921c7cf73fd2a358b64e1fe07154f1d2ce05a3d0b88998a3e27f2f6'
            '0cb428a7eee95774791e7df727c35b9fe43ca0614369cc779cf9c1cbf00a3332'
            '3a2c331177efb9530791d777297aba32822c55f0e9de116d89c640d3d1ba0843'
            '5809f21a93a26a610a11c2e41fe6c9b64a142877c2accd45c83350459b1d357c'
            'e9058d261138e637248b20243e3e81ff337ab669a4a25fbff387bf9558a682c6')

prepare() {
  patch -d $pkgname-$pkgver -p1 < pam-faillock.patch # Port away from deprecated pam_tally2
  patch -d $pkgname-$pkgver -p1 < sddm-fix-race-pre.patch # Make next patch apply
  patch -d $pkgname-$pkgver -p1 < sddm-fix-race.patch # Fix race at startup
  patch -d $pkgname-$pkgver -p1 < sddm-desktop-session.patch # Fix desktop session name
  patch -d $pkgname-$pkgver -p1 < sddm-fix-build.patch # Fix build with Qt post 5.15.2
  patch -d $pkgname-$pkgver -p1 < sddm-no-portal.patch # Don't launch xdg-desktop-portal
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

  install -Dm644 sddm.sysusers "$pkgdir"/usr/lib/sysusers.d/sddm.conf
  install -Dm644 sddm.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/sddm.conf

  install -d "$pkgdir"/usr/lib/sddm/sddm.conf.d
  "$pkgdir"/usr/bin/sddm --example-config > "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
# Don't set PATH in sddm.conf
  sed -r 's|DefaultPath=.*|DefaultPath=/usr/local/sbin:/usr/local/bin:/usr/bin|g' -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
# Unset InputMethod https://github.com/sddm/sddm/issues/952
  sed -e "/^InputMethod/s/qtvirtualkeyboard//" -i "$pkgdir"/usr/lib/sddm/sddm.conf.d/default.conf
}
