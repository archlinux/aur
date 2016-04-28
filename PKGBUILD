## Maintainer: peerchemist <peerchemist@protonmail.ch>

pkgname=('peerunityd' 'peerunity')
pkgbase=peerunity
_gitname=Peerunity
pkgdesc="Community made Peercoin client."
pkgver=0.2.1
pkgrel=1
arch=('i686' 'x86_64' 'armv7h' 'armv6h')
url="https://github.com/Peerunity/Peerunity"
makedepends=('boost' 'qrencode' 'miniupnpc' 'qt4')
depends=('boost-libs' 'openssl' 'miniupnpc' 'qt4')
license=('MIT')
source=("https://github.com/peerunity/peerunity/archive/v$pkgver.tar.gz"
	"upnp-1.9.patch"
  "peerunityd@.service"
  "peerunityd-tor@.service"
  "peerunity@.service"
  "peerunity-tor@.service"
	"peerunity.desktop"
)
sha256sums=('b76ed814f19d7c2474801e4846c267a44059e09224f63ffe8686923c3d2deb31'
            '3060917f8e327002da842534265392a1849239ec5049f25c1ae8a81c3952e7b1'
            '8d25b07ca8e3a7d972d584600a0083fe52b811efc0af0f98eba39c22cd173336'
            '5765241c7a1db1742cb034cd220cc65221f0c041299b9783ecc609aaa8ac120f'
            '7f8d2021ed95edb09971246e1fa578064057d7e4134c99558901d0d1960e80d9'
            'a9919759f080d09d1604962affc9117f444903ecddd0544e42ff291a0d05000d'
            '250aa80695bbb95228286850856d1f1bac9336c98e884cba0b148c9b837d196c')

prepare() {
  cd "$srcdir/${_gitname}-$pkgver"
  patch -p1 -i ../upnp-1.9.patch
}

build() {
  cd "$srcdir/${_gitname}-${pkgver}"

  ## make qt gui
  qmake-qt4 USE_QRCODE=1 USE_UPNP=1 USE_SSL=0 \
      QMAKE_CFLAGS="${CFLAGS}"\
      QMAKE_CXXFLAGS="${CXXFLAGS} -pie"
  make

  ## make daemon
    make -f makefile.unix USE_UPNP=1 USE_SSL=0 -e PIE=1 -C src
}

package_peerunityd() {
  depends=('boost-libs' 'openssl' 'miniupnpc')
  optdepends=('tor')
  install=peerunityd.install
  pkgdesc="Community client for Peercoin peer-to-peer network digital currency (daemon)"

  install -Dm644 $pkgname@.service "$pkgdir/usr/lib/systemd/system/${pkgname}@.service"
  install -Dm644 $pkgname-tor@.service "$pkgdir/usr/lib/systemd/system/${pkgname}@.service"
  cd "$srcdir/Peerunity-$pkgver"
  install -Dm755 src/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

package_peerunity() {
  depends=('boost-libs' 'qt4' 'qrencode' 'miniupnpc')
  optdepends=('tor')
  install=peerunity-qt.install
  pkgdesc="Comunity client for Peercoin peer-to-peer network digital currency (Qt)"

  install -Dm644 peerunity@.service "$pkgdir/usr/lib/systemd/system/${pkgname}@.service"
  install -Dm644 peerunity-tor@.service "$pkgdir/usr/lib/systemd/system/${pkgname}@.service"

  install -Dm644 peerunity.desktop "$pkgdir"/usr/share/applications/{$pkgbase}.desktop

  cd "$srcdir/Peerunity-$pkgver"

  install -Dm644 share/pixmaps/$pkgbase.ico "${pkgdir}/usr/share/pixmaps/$pkgbase.ico"
  install -Dm644 share/pixmaps/${pkgbase}64.png "${pkgdir}/usr/share/pixmaps/$pkgbase.ico"
  install -Dm644 share/pixmaps/${pkgbase}64.xpm "${pkgdir}/usr/share/pixmaps/$pkgbase.ico"
  install -Dm644 share/pixmaps/${pkgbase}128.png "${pkgdir}/usr/share/pixmaps/$pkgbase.ico"
  install -Dm644 share/pixmaps/${pkgbase}128.xpm "${pkgdir}/usr/share/pixmaps/$pkgbase.ico"
  install -Dm644 share/pixmaps/${pkgbase}256.png "${pkgdir}/usr/share/pixmaps/$pkgbase.ico"
  install -Dm644 share/pixmaps/${pkgbase}256.xpm "${pkgdir}/usr/share/pixmaps/$pkgbase.ico"
  
  install -Dm755 peerunity "$pkgdir"/usr/bin/peerunity
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

