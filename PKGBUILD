# Maintainer: Sergej Pupykin <arch+pub@sergej.pp.ru>
# Previous maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgbase=swift
pkgname=(swift-im swiften)
pkgver=4.0.3
pkgrel=1
arch=(x86_64)
pkgdesc="XMPP client written in C++ with Qt and Swiften"
url="https://swift.im"
license=(GPL3)
makedepends=(scons openssl boost qt5-base qt5-multimedia
  qt5-webkit qt5-x11extras qt5-tools qt5-svg)
source=("${url}/git/${pkgbase}/snapshot/${pkgbase}-${pkgver}.tar.bz2"
  'swift-4.0.2-boost-1.69-compatibility.patch'
  'swift-4.0.2-qt-5.15-compatibility.patch'
  repro-builds.patch
  swift-gcc11.patch
  swift-python3.patch)
sha256sums=('6a3f93e807afb51f1b8ab6ec8fef379dfcc50ba71fef6abeee7c123348da66b0'
  'd166362c146f859ec89c535f8676ac12c6e51e281e6c88c5e36b25e4ea5655d1'
  '18feef21870b0f441a6fb0faf7b35a826cfec4fe4a1d717bbb1c373a8c1ccb95'
  '90c586cc67dc9831a0e8ce75c12478f674b5d429dd46dae4c47f241d7902beb1'
  'eae6d270660353e0038dfbbdebff974e84e59cd44992ce7fc37add9926fb49c0'
  '2f36c529fd7771eaaf1775c7df728810007b4b8c032f98c2ccec5876695b4705')

# Those options need to be consistent between each scons invocation.
_scons_options=(max_jobs=1 optimize=1 debug=0 swiften_dll=1 cflags="${CPPFLAGS} ${CFLAGS}" cxxflags="${CPPFLAGS} ${CFLAGS}" linkflags="${LDFLAGS}")

prepare() {
  cd $pkgbase-$pkgver
  patch -p1 -i ../swift-4.0.2-boost-1.69-compatibility.patch
  patch -p1 -i ../swift-4.0.2-qt-5.15-compatibility.patch
  # https://github.com/swift/swift/pull/129
  patch -p1 -i ../repro-builds.patch
  # Fix build with GCC 11
  patch -p1 -i ../swift-gcc11.patch
  # Port to Python3
  patch -p1 -i ../swift-python3.patch
}

build() {
  cd $pkgbase-$pkgver
  scons "${_scons_options[@]}" Swift Swiften
}

package_swift-im() {
  pkgdesc='XMPP client written in C++ with Qt and Swiften'
  depends=("swiften=$pkgver" 'qt5-base' 'qt5-multimedia' 'qt5-webkit'
    'qt5-x11extras' 'qt5-svg' 'libxss' 'hicolor-icon-theme')

  cd $pkgbase-$pkgver
  scons "${_scons_options[@]}" SWIFT_INSTALLDIR="$pkgdir"/usr "$pkgdir"/usr
}

package_swiften() {
  pkgdesc='XMPP library written in C++ with Boost'
  depends=('boost-libs' 'libxml2' 'libidn' 'avahi' 'openssl')

  cd $pkgbase-$pkgver
  scons "${_scons_options[@]}" SWIFTEN_INSTALLDIR="$pkgdir"/usr "$pkgdir"/usr
}
