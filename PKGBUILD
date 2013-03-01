# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=synergy
pkgver=1.4.10
pkgrel=2
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama')
makedepends=('libxt' 'cmake' 'qt4')
optdepends=('qt4: gui support')
license=('GPL2')
source=("http://synergy.googlecode.com/files/$pkgname-$pkgver-Source.tar.gz"
        "synergys.socket"
        "synergys.service"
        "synergy.png"
        "synergy.desktop")
md5sums=('18aee04a7e232e4d821f46ff24da3364'
         '58f48336836d6faf3d5eecbe4155b77e'
         'b95e4b83d8a19c0bd81a15280078fcd5'
         '11fdb13390908e02c6e2f19c4c09eded'
         '1e8d574c19994d13e6f342ed08e531bb')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

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
  install -Dm644 "$srcdir/synergy.png" "$pkgdir/usr/share/pixmaps/synergy.png"
  install -Dm644 "$srcdir/synergy.desktop" "$pkgdir/usr/share/applications/synergy.desktop"
}
