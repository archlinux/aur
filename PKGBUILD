# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=meo-login-manager-59d689c0008bbb7efe2846d869657c004a5fb679
pkgname=meo-plasma-login-manager
pkgver=6.8.1
pkgrel=2
pkgdesc="Meo Login display manager for MeoArch"
arch=('x86_64')
url='https://github.com/QwQdoge/meo-login-manager'
license=('GPL-2.0-or-later')
depends=('glibc' 'kauth' 'kcmutils' 'kconfig' 'kcoreaddons' 'kdbusaddons'
         'ki18n' 'kio' 'kirigami' 'kpackage' 'kservice' 'kwindowsystem'
         'layer-shell-qt' 'libkscreen' 'libplasma>=6.8' 'libstdc++' 'libxau' 'pam'
         'plasma-workspace>=6.8' 'qt6-5compat' 'qt6-base' 'qt6-declarative' 'sh'
         'systemd-libs')
makedepends=('cmake' 'ninja' 'extra-cmake-modules' 'qt6-tools')
options=('!debug')
provides=('plasma-login-manager=6.8.1')
conflicts=('plasma-login-manager')
replaces=('plasma-login-manager')
source=('meo-login-manager-59d689c0008bbb7efe2846d869657c004a5fb679.tar.gz::https://codeload.github.com/QwQdoge/meo-login-manager/tar.gz/59d689c0008bbb7efe2846d869657c004a5fb679'
        'meo-session.conf')
sha256sums=('dfbb699f3fb9d63310d84bbe5f35e4ad18332e1543dc08dae03bb7d5e79c5b68'
            '0e533634254bc76e0b090310c7704ee59222cb2164b1999e8a17fd43edce60f1')

# The protected renderer supplies the reviewed Meo main checkout as
# $srcdir/$_srcdir. The public product is Meo Login, while PAM, systemd,
# configuration and service identifiers intentionally stay compatible with
# upstream Plasma Login Manager.
build() {
  cmake -S "$srcdir/$_srcdir" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DINSTALL_PAM_CONFIGURATION=ON
  cmake --build build --parallel "${MEO_BUILD_PARALLEL_LEVEL:-1}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$srcdir/$_srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Preselect Meo without autologin. The greeter still exposes every installed
  # Wayland session, including ordinary KDE Plasma, so users can switch freely.
  install -Dm644 "$srcdir/meo-session.conf" \
    "$pkgdir/etc/plasmalogin.conf.d/20-meo-session.conf"
}
