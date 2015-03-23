# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
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
pkgver=1.6.3
pkgrel=1
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'crypto++' 'libxkbcommon-x11' 'avahi')
makedepends=('libxt' 'cmake' 'qt5-base' 'unzip' 'subversion')
optdepends=('qt5-base: gui support')
license=('GPL2')
source=("synergy-${pkgver}.tar.gz::https://github.com/synergy/synergy/archive/${pkgver}.tar.gz"
        "synergys_at.socket"
        "synergys_at.service"
        "unfuck-cryptopp-thanks-gentoo.patch")
sha1sums=('c4c26ee983f0684a5cbe45520adc0b50a71a3524'
          '7ec33221725fc496b807e0f435c5e87b590beb5d'
          '65ab58cc3546d6374a05a6a260f15045632e43ce'
          '8e321e664ae4b7a763175524dd938a88d85c7909')

build() {
  cd "${srcdir}/synergy-${pkgver}"

  # Unfuck the bundled cryptopp stuff. Thanks a lot, Gentoo!
  # You and Fedora are our only friends in this crazy world.
  patch -Np1 < "${srcdir}/unfuck-cryptopp-thanks-gentoo.patch"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_CXX_FLAGS="${CXXFLAGS} -pthread" .
  make -j1

  cd src/gui
  qmake
  make
}

package() {
  cd "${srcdir}/synergy-${pkgver}"

  # install binary
  install -Dm755 bin/synergy "$pkgdir/usr/bin/synergy"
  install -Dm755 bin/synergyc "$pkgdir/usr/bin/synergyc"
  install -Dm755 bin/synergys "$pkgdir/usr/bin/synergys"

  # install config
  install -Dm644 "doc/${pkgname}.conf.example" "${pkgdir}/etc/${pkgname}.conf.example" 
  install -Dm644 "doc/${pkgname}.conf.example-advanced" "${pkgdir}/etc/${pkgname}.conf.example-advanced"
  install -Dm644 "doc/${pkgname}.conf.example-basic" "${pkgdir}/etc/${pkgname}.conf.example-basic" 

  # install manfiles
  install -Dm644 "doc/${pkgname}c.man" "${pkgdir}/usr/share/man/man1/${pkgname}c.1"
  install -Dm644 "doc/${pkgname}s.man" "${pkgdir}/usr/share/man/man1/${pkgname}s.1"

  # install systemd service and socket
  install -Dm644 "$srcdir/synergys_at.service" "$pkgdir/usr/lib/systemd/system/synergys@.service"
  install -Dm644 "$srcdir/synergys_at.socket" "$pkgdir/usr/lib/systemd/system/synergys@.socket"

  # install desktop/icon stuff
  install -Dm644 "res/synergy.ico" "$pkgdir/usr/share/icons/synergy.ico"
  install -Dm644 "res/synergy.desktop" "$pkgdir/usr/share/applications/synergy.desktop"
}
