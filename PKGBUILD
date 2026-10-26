# Maintainer: MeoArch <https://github.com/QwQdoge>
_srcdir=meo-kde-4f2b18778ecf19bc22e75eabc4fc7c159ec78f77
pkgname=meo-kde-runtime
pkgver=0.4.0beta3
pkgrel=8
pkgdesc="Minimal Meo KDE runtime bridge for Meo applications"
arch=('x86_64')
url='https://github.com/QwQdoge/meo-kde'
license=('GPL-3.0-or-later' 'GPL-2.0-or-later' 'MIT' 'Apache-2.0')
depends=('meoui-qml>=1.0.4beta1' 'qt6-declarative' 'kirigami'
         'networkmanager-qt' 'bluez-qt' 'solid' 'pulseaudio-qt'
         'libxcursor' 'kguiaddons' 'libplasma>=6.8' 'kconfig' 'plasma-workspace>=6.8')
# plasma-workspace also provides LibTaskManagerConfig.cmake for the source-tree
# task role smoke target; its runtime QML modules are consumed too.
makedepends=('cmake' 'ninja' 'extra-cmake-modules')
source=('meo-kde-4f2b18778ecf19bc22e75eabc4fc7c159ec78f77.tar.gz::https://codeload.github.com/QwQdoge/meo-kde/tar.gz/4f2b18778ecf19bc22e75eabc4fc7c159ec78f77')
sha256sums=('e4367a456e67516e1842f7acb29c215d526c5caae3aba51bbbdd836a02fef68f')

# The protected release renderer supplies a pinned MeoKDE tree as
# $srcdir/$_srcdir.  Building only native/system keeps the application-facing
# bridge independent from the full desktop-defaults package: installing
# Settings on an existing Arch/KDE system must not replace /etc/os-release,
# SDDM, KWin, Plasma, or input-method defaults.
build() {
  cmake -S "$srcdir/$_srcdir/native/system" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=OFF
  cmake --build build --parallel "${MEO_BUILD_PARALLEL_LEVEL:-1}"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -d "$pkgdir/usr/lib/systemd/user/default.target.wants"
  ln -s ../meo-weather-refresh.timer \
    "$pkgdir/usr/lib/systemd/user/default.target.wants/meo-weather-refresh.timer"
  install -d "$pkgdir/usr/lib/qt6/qml/MeoKDE"
  cp -a "$srcdir/$_srcdir/qml/MeoKDE/." \
    "$pkgdir/usr/lib/qt6/qml/MeoKDE/"
  install -Dm644 "$srcdir/$_srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/$_srcdir/assets/licenses/GPL-2.0-or-later.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/GPL-2.0-or-later.txt"
  install -Dm644 "$srcdir/$_srcdir/THIRD_PARTY_NOTICES.md" \
    "$pkgdir/usr/share/licenses/$pkgname/THIRD_PARTY_NOTICES.md"
  install -Dm644 "$srcdir/$_srcdir/native/third_party/material-color-utilities/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/Material-Color-Utilities-Apache-2.0.txt"
  install -Dm644 "$srcdir/$_srcdir/assets/licenses/DankMaterialShell-MIT.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/DankMaterialShell-MIT.txt"
}
