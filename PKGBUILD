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
pkgver=1.5.0
_pkgver=2278
pkgrel=2
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' 'crypto++' 'libxkbcommon-x11')
makedepends=('libxt' 'cmake' 'qt5-base' 'unzip')
optdepends=('qt5-base: gui support')
license=('GPL2')
source=("http://synergy-project.org/files/packages/synergy-${pkgver}-r${_pkgver}-Source.tar.gz"
        "synergys_at.socket"
        "synergys_at.service"
        "unfuck-cryptopp-thanks-gentoo.patch")
sha1sums=('808f1d793e5e977241bbef7e28fd02990adf8a47'
          '7ec33221725fc496b807e0f435c5e87b590beb5d'
          '4bd12cd0674ef317af1f7df32d84e94582855140'
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
  install -Dm644 "$srcdir/synergys_at.service" "$pkgdir/usr/lib/systemd/system/synergys@.service"
  install -Dm644 "$srcdir/synergys_at.socket" "$pkgdir/usr/lib/systemd/system/synergys@.socket"

  # install desktop/icon stuff
  cd ../res
  install -Dm644 "synergy.ico" "$pkgdir/usr/share/icons/synergy.ico"
  install -Dm644 "synergy.desktop" "$pkgdir/usr/share/applications/synergy.desktop"
}
