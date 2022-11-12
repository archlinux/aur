# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Michael Düll <mail@akurei.me>
# Contributor: Luca Corbatto <lucaatcorbatto.de>

# I would just like to take a minute here and state that synergy is
# some of the worst packaged software ever. They BUNDLE a fucking
# zip for cryptopp and do not provide an option to use a system-
# installed version of that library. They change around paths every
# update and just generally don't seem to care much.
pkgname=synergy
pkgver=1.11.1
pkgrel=1
pkgdesc='Share a single mouse and keyboard between multiple computers'
url='https://symless.com/synergy/'
arch=('x86_64')
license=('GPL2')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'libxkbcommon-x11' 'avahi' 'curl' 'openssl' 'hicolor-icon-theme')
makedepends=('libxt' 'cmake' 'qt5-base' 'qt5-tools' 'gmock' 'gtest')
optdepends=('qt5-base: gui support')
source=(synergy-${pkgver}.tar.gz::https://github.com/symless/synergy-core/archive/v${pkgver}-stable.tar.gz
        use-system-libs.patch
        fix-qt5_11-compatibility.patch
        enable-test-build.patch
        fix-test-build.patch
        synergys.socket
        synergys.service)
sha512sums=('54c84596c543eb799ba9244f100d67045b159ec5ef622375fb5b763144b211833999c05f6d5dae42086e28a90b3a87a9d3fc7d7469d4d900f2e4ad9b9a48e0a2'
            '6ed5384ec46e991958f48051c66b87febfb457a748cea48909f87a088c804907f480f123620a0a5921e281ca9871e251de8b7dd5803ffe8566841f68f396c160'
            'b8347b803a7baaeeab75e55778314298fc69e15ccda154a8622b4697c3a3e7d6ba51cb156f06c6b289c41cb0892be7fed5ce49591531ed1ef18fa3a1ec8a7d6d'
            '89b29994f238013393b90ad628d781ea6ea1d46c33819be561f031cc0790ef7f3860faaa2803e1459ed3c14affb749ea3bab6b15598c760424c8063195cb56a6'
            '158d218faa8d8c33cbea935a9dcad4bcf79309eb485bfea107cd160f894d1090db6fea6e60827509b985ff9a7493020fc819e5e150bdac85f5547e755f3ad9ec'
            'f9c124533dfd0bbbb1b5036b7f4b06f7f86f69165e88b9146ff17798377119eb9f1a4666f3b2ee9840bc436558d715cdbfe2fdfd7624348fae64871f785a1a62'
            '9663a11b915e10e60317e732a4d1191e8f8ff19176994c27dd20aa445daab7565bd624e5575c9c639d144293879fbe8376834a076723f778fd322ebd1c9f2029')

prepare() {
  cd synergy-core-${pkgver}-stable
  mkdir build

  # get rid of shitty bundled gtest and gmock
  patch -Np1 < "${srcdir}/use-system-libs.patch"
  # fix the build with qt5.11
  # this is likely to be obsolete in future versions
  # see: https://github.com/symless/synergy-core/pull/6359
  patch -Np1 < "${srcdir}/fix-qt5_11-compatibility.patch"
  # enable building of test executables
  patch -Np1 < "${srcdir}/enable-test-build.patch"
  # fix building of test executables
  patch -Np1 < "${srcdir}/fix-test-build.patch"
  # remove tests that need working X
  rm src/test/integtests/platform/XWindowsScreenTests.cpp \
    src/test/integtests/platform/XWindowsKeyStateTests.cpp
  # fix path for gmock and gtest
  sed -i 's|/usr/src/gmock|/usr/src/gmock/src|
          s|/usr/src/gtest|/usr/src/googletest|' src/test/CMakeLists.txt
}

build() {
  cd synergy-core-${pkgver}-stable/build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

check() {
  cd synergy-core-${pkgver}-stable/build
  ./bin/unittests
  ./bin/integtests
}

package() {
  cd synergy-core-${pkgver}-stable

  # install binary
  install -Dm 755 build/bin/{synergy,synergyc,synergyd,synergys,syntool} -t "${pkgdir}/usr/bin"

  # install config
  install -Dm 644 doc/${pkgname}.conf* -t "${pkgdir}/etc"

  # install manfiles
  install -Dm 644 doc/${pkgname}c.man "${pkgdir}/usr/share/man/man1/${pkgname}c.1"
  install -Dm 644 doc/${pkgname}s.man "${pkgdir}/usr/share/man/man1/${pkgname}s.1"

  # install systemd service and socket
  install -Dm 644 "${srcdir}"/synergys.{service,socket} -t "${pkgdir}/usr/lib/systemd/user"

  # install desktop/icon stuff
  install -Dm 644 res/synergy.svg -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps/"
  install -Dm 644 res/synergy.desktop -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
