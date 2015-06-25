 # Maintainer: saxonbeta <saxonbeta at gmail dot com>
pkgname=whatsapp-desktop-git
_pkgname=WhatsApp-Desktop
pkgver=20150625
pkgrel=1
pkgdesc="Simple & beautiful (Unofficial) desktop client for WhatsApp"
arch=('i686' 'x86_64')
url="http://whatsapp-desktop.com/"
license=('MIT')
depends=('libxtst' 'gtk2' 'libnotify' 'alsa-lib' 'gconf' 'gcc-libs' 'nss')
makedepends=('npm')
conflicts=('whatsapp-desktop' 'whatsapp-desktop-bin')
optdepends=()
[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64

source=(git+https://github.com/Aluxian/WhatsApp-Desktop.git
	'whatsapp-desktop.desktop')
sha256sums=('SKIP'
            'f62f69eb7276a4f3c5632e9100192d0a4311064406be18dafb445ecf8a669eb1')

pkgver() {
    cd "$srcdir/$_pkgname-$pkgver/"
    (git log -1 --format='%cd.%h' --date=short | tr -d -)
}

	    
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
