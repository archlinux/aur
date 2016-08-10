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
pkgver=1.8.2
pkgrel=1
pkgdesc='Share a single mouse and keyboard between multiple computers'
url='http://synergy-foss.org'
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'libxkbcommon-x11' 'avahi' 'curl')
makedepends=('libxt' 'cmake' 'qt5-base' 'unzip')
optdepends=('qt5-base: gui support'
            'openssl: encryption support')
source=(synergy-${pkgver}.tar.gz::https://github.com/symless/synergy/archive/v${pkgver}-stable.tar.gz
        synergys.socket
        synergys.service
        wrapper)
sha512sums=('48d7e18e92f239feddc7afd31b5614c2c27b7dc1cb30e58aa168095771a85d87c9c621daaef6ee0126381bcdcfa515d484545d763d0b1c5e6c181e0e5175639c'
            'f9c124533dfd0bbbb1b5036b7f4b06f7f86f69165e88b9146ff17798377119eb9f1a4666f3b2ee9840bc436558d715cdbfe2fdfd7624348fae64871f785a1a62'
            '9663a11b915e10e60317e732a4d1191e8f8ff19176994c27dd20aa445daab7565bd624e5575c9c639d144293879fbe8376834a076723f778fd322ebd1c9f2029'
            'a2e126ad3ac53fb855a331134982f86ef81ffc75b73e73b242e6f854fe7e2daec160fac2161acdc7020cd7f57ae0a8826ac7a249ad10b03db614ada0062b3e93')

prepare() {
  cd synergy-${pkgver}-stable
  (cd ext
    unzip gmock-1.6.0.zip -d gmock-1.6.0
    unzip gtest-1.6.0.zip -d gtest-1.6.0
  )
}

build() {
  cd synergy-${pkgver}-stable

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  # unittests don't pass with optimization (segfault on nullptr)
  sed 's|\-O2|\-O0|g' -i src/test/unittests/CMakeFiles/unittests.dir/{flags.make,link.txt}
  make

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
  install -Dm 644 "doc/${pkgname}.conf.example" "${pkgdir}/etc/${pkgname}.conf.example"
  install -Dm 644 "doc/${pkgname}.conf.example-advanced" "${pkgdir}/etc/${pkgname}.conf.example-advanced"
  install -Dm 644 "doc/${pkgname}.conf.example-basic" "${pkgdir}/etc/${pkgname}.conf.example-basic"

  # install manfiles
  install -Dm 644 "doc/${pkgname}c.man" "${pkgdir}/usr/share/man/man1/${pkgname}c.1"
  install -Dm 644 "doc/${pkgname}s.man" "${pkgdir}/usr/share/man/man1/${pkgname}s.1"

  # install systemd service and socket
  install -Dm 644 "${srcdir}/synergys.service" "${pkgdir}/usr/lib/systemd/user/synergys.service"
  install -Dm 644 "${srcdir}/synergys.socket" "${pkgdir}/usr/lib/systemd/user/synergys.socket"

  # install desktop/icon stuff
  install -Dm 644 "res/synergy.ico" "${pkgdir}/usr/share/icons/synergy.ico"
  install -Dm 644 "res/synergy.desktop" "${pkgdir}/usr/share/applications/synergy.desktop"
}

# vim:set ts=2 sw=2 et:
