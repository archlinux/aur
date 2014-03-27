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
pkgver=1.4.17
_pkgver=2055
pkgrel=1
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'crypto++')
makedepends=('libxt' 'cmake' 'qt5-base' 'unzip')
optdepends=('qt5-base: gui support')
license=('GPL2')
source=("http://fossfiles.com/synergy/synergy-${pkgver}-r${_pkgver}-Source.tar.gz"
        "synergys.socket"
        "synergys.service"
        "unfuck-cryptopp-thanks-gentoo.patch")
sha1sums=('a28fd5c7e709e6ee85501e9ed4496d060d3e5c22'
          '947406e72351145c65ba9884ed175bf781482d46'
          '00f2259c31c9551c0830d9e889fd0a0790cf9045'
          '8e321e664ae4b7a763175524dd938a88d85c7909')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

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
  cd "${srcdir}/${pkgname}-${pkgver}-Source/bin"

  # install binary
  install -Dm755 synergy "$pkgdir/usr/bin/synergy"
  install -Dm755 synergyc "$pkgdir/usr/bin/synergyc"
  install -Dm755 synergys "$pkgdir/usr/bin/synergys"

  # install config
  install -Dm644 "$srcdir/$pkgname-$pkgver-Source/doc/${pkgname}.conf.example" "${pkgdir}/etc/${pkgname}.conf.example" 
  install -Dm644 "$srcdir/$pkgname-$pkgver-Source/doc/${pkgname}.conf.example-advanced" "${pkgdir}/etc/${pkgname}.conf.example-advanced"
  install -Dm644 "$srcdir/$pkgname-$pkgver-Source/doc/${pkgname}.conf.example-basic" "${pkgdir}/etc/${pkgname}.conf.example-basic" 

  # install manfiles
  install -Dm644 "$srcdir/$pkgname-$pkgver-Source/doc/${pkgname}c.man" "${pkgdir}/usr/share/man/man1/${pkgname}c.1"
  install -Dm644 "$srcdir/$pkgname-$pkgver-Source/doc/${pkgname}s.man" "${pkgdir}/usr/share/man/man1/${pkgname}s.1"

  # install systemd service and socket
  install -d "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/synergys.service" "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/synergys.socket" "$pkgdir/usr/lib/systemd/system/"

  # install desktop/icon stuff
  cd ../res
  install -Dm644 "synergy.ico" "$pkgdir/usr/share/icons/synergy.ico"
  install -Dm644 "synergy.desktop" "$pkgdir/usr/share/applications/synergy.desktop"
}
