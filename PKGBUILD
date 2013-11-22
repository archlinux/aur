# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>
# Contributor: Michael Düll <mail@akurei.me>

pkgname=synergy
pkgver=1.4.15
pkgrel=2
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'crypto++')
makedepends=('libxt' 'cmake' 'qt4' 'unzip')
optdepends=('qt4: gui support')
license=('GPL2')
source=("http://synergy.googlecode.com/files/$pkgname-$pkgver-Source.tar.gz"
        "synergys.socket"
        "synergys.service"
        "unfuck-cryptopp-thanks-gentoo.patch")
sha1sums=('0766bc3d95d6971746764d30e0853db14926ae73'
          '947406e72351145c65ba9884ed175bf781482d46'
          '00f2259c31c9551c0830d9e889fd0a0790cf9045'
          '129151952e6d25504ca823aee8ebe93ce3d376ce')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  # Unfuck the bundled cryptopp stuff. Thanks a lot, Gentoo!
  # You and Fedora are our only friends in this crazy world.
  patch -Np1 < "${srcdir}/unfuck-cryptopp-thanks-gentoo.patch"

  cmake -D CMAKE_INSTALL_PREFIX=/usr . 
  make

  cd src/gui
  qmake-qt4
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source/bin"

  # install binary
  install -Dm755 synergy "$pkgdir/usr/bin/synergy"
  install -Dm755 synergyc "$pkgdir/usr/bin/synergyc"
  install -Dm755 synergys "$pkgdir/usr/bin/synergys"

  # install config
  install -Dm644 "$srcdir/$pkgname-$pkgver-Source/doc/${pkgname}.conf.example" "${pkgdir}/etc/${pkgname}.conf.example" 

  # install systemd service and socket
  install -d "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/synergys.service" "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/synergys.socket" "$pkgdir/usr/lib/systemd/system/"

  # install desktop/icon stuff
  cd ../res
  install -Dm644 "synergy.ico" "$pkgdir/usr/share/pixmaps/synergy.ico"
  install -Dm644 "synergy.desktop" "$pkgdir/usr/share/applications/synergy.desktop"
}
