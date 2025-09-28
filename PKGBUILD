# Maintainer: Martchus <martchus@gmx.net>

# All my PKGBUILDs are managed at https://github.com/Martchus/PKGBUILDs where
# you also find the URL of a binary repository.

_pkgname=kirigami
_android_arch=aarch64

pkgname=android-${_android_arch}-${_pkgname}
pkgver=6.18.0
pkgrel=1
pkgdesc="A QtQuick based components set (Android, $_android_arch)"
arch=('any')
url='https://community.kde.org/Frameworks'
license=(LGPL-2.0-only LGPL-3.0-only)
depends=("android-$_android_arch-qt6"-{declarative,shadertools,svg,5compat})
makedepends=('cmake' 'android-ndk' 'android-sdk' 'android-cmake' 'extra-cmake-modules' 'ninja' 'qt6-base' 'qt6-declarative' 'qt6-tools' 'qt6-shadertools')
provides=(android-${_android_arch}-${_pkgname}2)
conflicts=(android-${_android_arch}-${_pkgname}2)
replaces=(android-${_android_arch}-${_pkgname}2)
source=(https://download.kde.org/stable/frameworks/${pkgver%.*}/$_pkgname-$pkgver.tar.xz{,.sig})
sha256sums=('e0574bf5f530a7cd98e0342498681f4374beff108e74262063b105e1c977f866'
            'SKIP')
validpgpkeys=(53E6B47B45CEA3E0D5B7457758D0EE648A48B3BB # David Faure <faure@kde.org>
              E0A3EB202F8E57528E13E72FD7574483BB57B18D # Jonathan Esk-Riddell <jr@jriddell.org>
              90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1 # Nicolas Fella <nicolas.fella@kde.org>
              )
options=(!buildflags staticlibs !strip !emptydirs)

build() {
  source android-env ${_android_arch}
  android-${_android_arch}-cmake -G Ninja -B build-$_android_arch -S $_pkgname-$pkgver \
    -DCMAKE_FIND_ROOT_PATH="${ANDROID_PREFIX}" \
    -DECM_DIR:PATH=/usr/share/ECM/cmake \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTING=OFF \
    -DBUILD_QCH=OFF
  VERBOSE=1 cmake --build build-$_android_arch
}

package() {
  source android-env ${_android_arch}
  DESTDIR="$pkgdir" VERBOSE=1 cmake --install build-$_android_arch
  mkdir -p "$pkgdir/$ANDROID_PREFIX/qml/org"
  ln -rs "$pkgdir/$ANDROID_PREFIX/lib/qml/org/kde" "$pkgdir/$ANDROID_PREFIX/qml/org/kde"
}
