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
pkgver=1.7.6
pkgrel=1
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'libxkbcommon-x11' 'avahi' 'curl')
makedepends=('libxt' 'cmake' 'qt5-base' 'unzip')
optdepends=(
  'qt5-base: gui support'
  'openssl: encryption support'
)
source=(synergy-${pkgver}.tar.gz::https://github.com/symless/synergy/archive/v${pkgver}-stable.tar.gz
        synergys_at.socket
        synergys_at.service
        fix-incompetence.patch
        wrapper)
sha512sums=('025305fc1aca425b27c1d4f16dd0c6ee7798c048e234c8a27272b81b03c0c1cb35fab6639707c1b55d58e7676fe2abf058b6f93e994ae5b256034c32c6fe806a'
            'f9c124533dfd0bbbb1b5036b7f4b06f7f86f69165e88b9146ff17798377119eb9f1a4666f3b2ee9840bc436558d715cdbfe2fdfd7624348fae64871f785a1a62'
            'e85cc3452bb8ba8fcccb1857386c77eb1e4cabb149a1c492c56b38e1b121ac0e7d96c6fcbd3c9b522d3a4ae9d7a9974f4a89fc32b02a56f665be92af219e371c'
            'd598f05614d0db894781e85ecab9a1196da3df6967e3bd44f5b8246c7cba76859734cf953edddf0addf6464f62f88b99da52fb5674e8db4a58bf971d078da83a'
            'a2e126ad3ac53fb855a331134982f86ef81ffc75b73e73b242e6f854fe7e2daec160fac2161acdc7020cd7f57ae0a8826ac7a249ad10b03db614ada0062b3e93')

prepare() {
  cd synergy-${pkgver}-stable
  patch -p1 < "${srcdir}/fix-incompetence.patch"
  (cd ext
    unzip gmock-1.6.0.zip -d gmock-1.6.0
    unzip gtest-1.6.0.zip -d gtest-1.6.0
  )
}

build() {
  cd synergy-${pkgver}-stable

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
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
  install -Dm 644 "${srcdir}/synergys_at.service" "${pkgdir}/usr/lib/systemd/system/synergys@.service"
  install -Dm 644 "${srcdir}/synergys_at.socket" "${pkgdir}/usr/lib/systemd/system/synergys@.socket"

  # install desktop/icon stuff
  install -Dm 644 "res/synergy.ico" "${pkgdir}/usr/share/icons/synergy.ico"
  install -Dm 644 "res/synergy.desktop" "${pkgdir}/usr/share/applications/synergy.desktop"
}

# vim:set ts=2 sw=2 et:
