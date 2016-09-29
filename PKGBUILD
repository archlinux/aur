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
pkgver=1.8.3
pkgrel=1
pkgdesc='Share a single mouse and keyboard between multiple computers'
url='http://synergy-foss.org'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'libxkbcommon-x11' 'avahi' 'curl')
makedepends=('libxt' 'cmake' 'qt5-base' 'gmock' 'gtest')
optdepends=('qt5-base: gui support'
            'openssl: encryption support')
source=(synergy-${pkgver}.tar.gz::https://github.com/symless/synergy/archive/v${pkgver}-stable.tar.gz
        system-gtest.patch
        synergys.socket
        synergys.service
        wrapper)
sha512sums=('a5e51e68a16b4e84d916aa54f03925c9db0df70b80c586d020c599f9685d820f097dd6519e07ad31704e769dd9072eb79f0f95465a12890a8caca44d0fac0688'
            '4bef039f59b565d08079a8187df76f9773cfddeb81376ccc42f5570049389f114559721ed7b0464c4a4d1431ba72a736b11755573019583d0075d9da08c03ed2'
            'f9c124533dfd0bbbb1b5036b7f4b06f7f86f69165e88b9146ff17798377119eb9f1a4666f3b2ee9840bc436558d715cdbfe2fdfd7624348fae64871f785a1a62'
            '9663a11b915e10e60317e732a4d1191e8f8ff19176994c27dd20aa445daab7565bd624e5575c9c639d144293879fbe8376834a076723f778fd322ebd1c9f2029'
            'a2e126ad3ac53fb855a331134982f86ef81ffc75b73e73b242e6f854fe7e2daec160fac2161acdc7020cd7f57ae0a8826ac7a249ad10b03db614ada0062b3e93')

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
  install -Dm 755 bin/synergy "${pkgdir}/usr/lib/synergy/synergy"
  install -Dm 755 bin/synergyc "${pkgdir}/usr/lib/synergy/synergyc"
  install -Dm 755 bin/synergyd "${pkgdir}/usr/lib/synergy/synergyd"
  install -Dm 755 bin/synergys "${pkgdir}/usr/lib/synergy/synergys"
  install -Dm 755 bin/syntool "${pkgdir}/usr/lib/synergy/syntool"
  install -Dm 755 bin/usynergy "${pkgdir}/usr/lib/synergy/usynergy"

  # unfuck wrapper
  install -Dm 755 "${srcdir}/wrapper" "${pkgdir}/usr/lib/synergy/wrapper"
  install -d "${pkgdir}/usr/bin"
  ln -sf /usr/lib/synergy/wrapper "${pkgdir}/usr/bin/synergy"
  ln -sf /usr/lib/synergy/wrapper "${pkgdir}/usr/bin/synergyc"
  ln -sf /usr/lib/synergy/wrapper "${pkgdir}/usr/bin/synergyd"
  ln -sf /usr/lib/synergy/wrapper "${pkgdir}/usr/bin/synergys"
  ln -sf /usr/lib/synergy/wrapper "${pkgdir}/usr/bin/syntool"
  ln -sf /usr/lib/synergy/wrapper "${pkgdir}/usr/bin/usynergy"

  # plugin
  install -Dm 755 bin/plugins/libns.so "${pkgdir}/usr/lib/${pkgname}/libns.so"

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
