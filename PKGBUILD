# Maintainer: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=synergy
pkgver=1.4.10
pkgrel=1
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' )
license=('GPL2')
makedepends=('libxt' 'cmake')       # used by configure to test for libx11...
backup=('etc/synergy.conf')
source=("http://synergy.googlecode.com/files/$pkgname-$pkgver-Source.tar.gz" "${pkgname}s.rc" "synergys.socket" "synergys.service")


build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  cmake  -D CMAKE_INSTALL_PREFIX=/usr . 
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source/bin"

  #make DESTDIR="$pkgdir" install # doesn't work atm

  # install binary
  install -d "$pkgdir/usr/bin/"
  install -Dm755 synergyc $pkgdir/usr/bin/
  install -Dm755 synergys $pkgdir/usr/bin/

  # install rc.d script  and config
  install -d "${pkgdir}/etc/rc.d"
  install -Dm644 $srcdir/$pkgname-$pkgver-Source/doc/${pkgname}.conf.example "${pkgdir}/etc" 
  install -Dm755 $srcdir/${pkgname}s.rc "${pkgdir}/etc/rc.d/${pkgname}s" 

  # Install systemd service and socket
  install -d "$pkgdir/usr/lib/systemd/system"
  install -Dm644 "$srcdir/synergys.service" "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 "$srcdir/synergys.socket" "$pkgdir/usr/lib/systemd/system/"
}
md5sums=('18aee04a7e232e4d821f46ff24da3364'
         '8f8c01add9bf6e3ae9f37a36ca6345b6'
         '58f48336836d6faf3d5eecbe4155b77e'
         'b95e4b83d8a19c0bd81a15280078fcd5')
