# Maintainer: Chih-Hsuan Yen <yan12125@archlinux.org>
# Based on libkscreen package; original contributors:
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

_name=libkscreen
pkgname=${_name}5
pkgver=5.27.12
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='KDE screen management software'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL)
# Both libkscreen in upstream Plasma 5 and 6 provides the dbus service org.kde.KScreen, and thus they conflict with each other.
# To allow older libkscreen without affecting the newer one, I make older libkscreen use the dbus service from newer libkscreen.
# As a result, depends include 'libkscreen>=6.0'
# This follows the Fedora approach: https://src.fedoraproject.org/rpms/libkscreen-qt5/c/4438d64b134bd39956526a91c9320c4f1e332832?branch=rawhide
# See also discussions around lxqt-config, a user of libkscreen: https://github.com/lxqt/lxqt/discussions/2139#discussioncomment-7699652
depends=(qt5-x11extras kwayland5 kconfig5 'libkscreen>=6.0')
makedepends=(extra-cmake-modules doxygen qt5-tools qt5-doc plasma-wayland-protocols)
conflicts=("$_name<6.0")
source=(https://download.kde.org/stable/plasma/$_dirver/$_name-$pkgver.tar.xz{,.sig})
sha256sums=('ae64e87b8f69b065f18623981c2defcb9c33a5294b3343f29d293f247051fa44'
            'SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

build() {
  cmake -B build -S $_name-$pkgver \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=ON
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # Remove the unneeded daemon and files that conflict with KF6 libkscreen
  rm -r "${pkgdir}"/usr/bin/
  rm -r "${pkgdir}"/usr/lib/kf5/
  rm -r "${pkgdir}"/usr/lib/systemd/
  rm -r "${pkgdir}"/usr/share/dbus-1/
  rm -r "${pkgdir}"/usr/share/zsh/
}
