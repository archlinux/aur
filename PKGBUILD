# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Michael Düll <mail@akurei.me>

# I would just like to take a minute here and state that synergy is
# some of the worst packaged software ever. They BUNDLE a fucking
# zip for cryptopp and do not provide an option to use a system-
# installed version of that library. They change around paths every
# update and just generally don't seem to care much.
pkgname=synergy
pkgver=1.8.4
pkgrel=1
pkgdesc='Share a single mouse and keyboard between multiple computers'
url='http://synergy-foss.org'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'libxkbcommon-x11' 'avahi' 'curl' 'openssl')
makedepends=('libxt' 'cmake' 'qt5-base' 'gmock' 'gtest')
optdepends=('qt5-base: gui support')
source=(synergy-${pkgver}.tar.gz::https://github.com/symless/synergy/archive/v${pkgver}-stable.tar.gz
        system-gtest.patch
        synergys.socket
        synergys.service)
sha512sums=('7d01138a0481662c5d78bec0a6cacadeb5927a9ea283adb6a63d9c7ab0d97a39484b5ede5f70fe4fbc7a5a296caa581e81cddeddb82687c379686f469ab3b584'
            '4bef039f59b565d08079a8187df76f9773cfddeb81376ccc42f5570049389f114559721ed7b0464c4a4d1431ba72a736b11755573019583d0075d9da08c03ed2'
            'f9c124533dfd0bbbb1b5036b7f4b06f7f86f69165e88b9146ff17798377119eb9f1a4666f3b2ee9840bc436558d715cdbfe2fdfd7624348fae64871f785a1a62'
            '9663a11b915e10e60317e732a4d1191e8f8ff19176994c27dd20aa445daab7565bd624e5575c9c639d144293879fbe8376834a076723f778fd322ebd1c9f2029')

prepare() {
  cd synergy-${pkgver}-stable
  mkdir build
  # get rid of shitty bundled gtest and gmock
  patch -p1 < "${srcdir}/system-gtest.patch"
}

build() {
  cd synergy-${pkgver}-stable

  msg2 "Building core..."
  (cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    # unittests don't pass with optimization (segfault on nullptr)
    sed 's|\-O2|\-O0|g' -i src/test/unittests/CMakeFiles/unittests.dir/{flags.make,link.txt}
    make
  )

  msg2 "Building GUI..."
  (cd src/gui
    qmake
    make
  )
}

check() {
  cd synergy-${pkgver}-stable
  ./bin/unittests
}

package() {
  cd synergy-${pkgver}-stable

  # install binary
  install -Dm 755 bin/{synergy,synergyc,synergyd,synergys,syntool,usynergy} -t "${pkgdir}/usr/bin"

  # install config
  install -Dm 644 doc/${pkgname}.conf* -t "${pkgdir}/etc"

  # install manfiles
  install -Dm 644 "doc/${pkgname}c.man" "${pkgdir}/usr/share/man/man1/${pkgname}c.1"
  install -Dm 644 "doc/${pkgname}s.man" "${pkgdir}/usr/share/man/man1/${pkgname}s.1"

  # install systemd service and socket
  install -Dm 644 "${srcdir}"/synergys.{service,socket} -t "${pkgdir}/usr/lib/systemd/user"

  # install desktop/icon stuff
  install -Dm 644 "res/synergy.ico" -t "${pkgdir}/usr/share/icons"
  install -Dm 644 "res/synergy.desktop" -t "${pkgdir}/usr/share/applications"
}

# vim:set ts=2 sw=2 et:
