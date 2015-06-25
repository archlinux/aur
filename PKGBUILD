 # Maintainer: saxonbeta <saxonbeta at gmail dot com>
pkgname=whatsapp-desktop
_pkgname=WhatsApp-Desktop
pkgver=1.1.0
pkgrel=1
pkgdesc="Simple & beautiful desktop client for WhatsApp"
arch=('i686' 'x86_64')
url="http://whatsapp-desktop.com/"
license=('MIT')
depends=('libxtst' 'gtk2' 'libnotify' 'alsa-lib' 'gconf' 'gcc-libs' 'nss')
makedepends=('npm')
optdepends=()
[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64

source=("https://github.com/Aluxian/WhatsApp-Desktop/archive/v1.1.0.tar.gz"
	'whatsapp-desktop.desktop')
sha256sums=('d74035490b04f3cd898362d555c4ac547fc2697b1c34b73e827faf1b54ca5ea8'
            'f62f69eb7276a4f3c5632e9100192d0a4311064406be18dafb445ecf8a669eb1')

	    
prepare() {
cd $srcdir/$_pkgname-$pkgver
npm install gulp
npm install

}

build() {
  cd $srcdir/$_pkgname-$pkgver
  node_modules/.bin/gulp build:$_platform
}

package() {
  cd $srcdir/$_pkgname-$pkgver
  _bpath="${srcdir}/${_pkgname}-${pkgver}/build/WhatsApp/${_platform}"
  
  #License
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/"

  #Program
  install -d $pkgdir/usr/lib/$pkgname
  install -Dm644 $_bpath/{nw.pak,libffmpegsumo.so,WhatsApp} $pkgdir/usr/lib/$pkgname
  install -d $pkgdir/usr/bin
  ln -s "/usr/lib/${pkgname}/WhatsApp" "${pkgdir}/usr/bin/WhatsApp"
  
  #Desktop file
  install -Dm644 "${srcdir}/${pkgname}.desktop" \
		"${pkgdir}/usr/share/applications/${pkgname}.desktop"

  #Icon
  install -Dm644 $srcdir/$_pkgname-$pkgver/assets-linux/icons/256/whatsappfordesktop.png \
		$pkgdir/usr/share/pixmaps/$pkgname.png
  
}