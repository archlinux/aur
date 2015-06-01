# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
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
pkgver=1.7.3
pkgrel=2
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'libxkbcommon-x11' 'avahi' 'curl')
makedepends=('libxt' 'cmake' 'qt5-base' 'unzip')
optdepends=(
  'qt5-base: gui support'
  'openssl: encryption support'
)
license=('GPL2')
source=("synergy-${pkgver}.tar.gz::https://github.com/synergy/synergy/archive/v${pkgver}-stable.tar.gz"
        "synergys_at.socket"
        "synergys_at.service"
        fix-incompetence.patch)
sha1sums=('8b29b172ef6d025f3cdf8fb434eb0e23b6ed896f'
          '7ec33221725fc496b807e0f435c5e87b590beb5d'
          '65ab58cc3546d6374a05a6a260f15045632e43ce'
          '10a899901ef62828280f21979625495f4da159f5')

prepare() {
  cd "${srcdir}/synergy-${pkgver}-stable"
  patch -p1 < ../fix-incompetence.patch

  cd ext
  unzip gmock-1.6.0.zip -d gmock-1.6.0
  unzip gtest-1.6.0.zip -d gtest-1.6.0
}

build() {
  cd "${srcdir}/synergy-${pkgver}-stable"

  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make

  cd src/gui
  qmake
  make
}

check() {
  cd "${srcdir}/synergy-${pkgver}-stable/bin"
  ./unittests
}

package() {
  cd "${srcdir}/synergy-${pkgver}-stable"

  # install binary
  install -Dm755 bin/synergy "${pkgdir}/usr/bin/synergy"
  install -Dm755 bin/synergyc "${pkgdir}/usr/bin/synergyc"
  install -Dm755 bin/synergyd "${pkgdir}/usr/bin/synergyd"
  install -Dm755 bin/synergys "${pkgdir}/usr/bin/synergys"
  install -Dm755 bin/syntool "${pkgdir}/usr/bin/syntool"
  install -Dm755 bin/usynergy "${pkgdir}/usr/bin/usynergy"

  # install config
  install -Dm644 "doc/${pkgname}.conf.example" "${pkgdir}/etc/${pkgname}.conf.example" 
  install -Dm644 "doc/${pkgname}.conf.example-advanced" "${pkgdir}/etc/${pkgname}.conf.example-advanced"
  install -Dm644 "doc/${pkgname}.conf.example-basic" "${pkgdir}/etc/${pkgname}.conf.example-basic" 

  # install manfiles
  install -Dm644 "doc/${pkgname}c.man" "${pkgdir}/usr/share/man/man1/${pkgname}c.1"
  install -Dm644 "doc/${pkgname}s.man" "${pkgdir}/usr/share/man/man1/${pkgname}s.1"
  
  # plugin
  install -Dm644 bin/plugins/libns.so "${pkgdir}/usr/lib/${pkgname}/libns.so"

  # install systemd service and socket
  install -Dm644 "${srcdir}/synergys_at.service" "${pkgdir}/usr/lib/systemd/system/synergys@.service"
  install -Dm644 "${srcdir}/synergys_at.socket" "${pkgdir}/usr/lib/systemd/system/synergys@.socket"

  # install desktop/icon stuff
  install -Dm644 "res/synergy.ico" "${pkgdir}/usr/share/icons/synergy.ico"
  install -Dm644 "res/synergy.desktop" "${pkgdir}/usr/share/applications/synergy.desktop"
}

# vim:set ts=2 sw=2 et:
