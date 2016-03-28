 # Maintainer: saxonbeta <saxonbeta at gmail dot com>
pkgname=whatsapp-desktop-git
_pkgname=Sup-for-WhatsApp
pkgver=20160130.e713c45
pkgrel=1
pkgdesc="Simple & beautiful (Unofficial) desktop client for WhatsApp"
arch=('i686' 'x86_64')
url="http://whatsapp-desktop.com/"
license=('MIT')
depends=('libxtst' 'gtk2' 'libnotify' 'alsa-lib' 'gconf' 'nss')
makedepends=('npm')
conflicts=('whatsapp-desktop' 'whatsapp-desktop-bin')
optdepends=()
options=('!strip')
[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64

source=(git+https://github.com/zweicoder/$_pkgname.git
	'whatsapp-desktop.desktop')
sha256sums=('SKIP'
            'f62f69eb7276a4f3c5632e9100192d0a4311064406be18dafb445ecf8a669eb1')

pkgver() {
    cd "$srcdir/$_pkgname"
    (git log -1 --format='%cd.%h' --date=short | tr -d -)
}

	    
prepare() {
cd $srcdir/$_pkgname
npm install gulp
npm install

}

build() {
  cd $srcdir/$_pkgname
  node_modules/.bin/gulp build:$_platform
}

package() {
  cd $srcdir/$_pkgname
  _bpath="${srcdir}/${_pkgname}/build/supforwhatsapp/${_platform}"
  
  #License
  install -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${pkgname}/"

  #Program
  install -d $pkgdir/usr/lib/$pkgname
  install -Dm755 $_bpath/{nw.pak,libffmpegsumo.so,supforwhatsapp,icudtl.dat} $pkgdir/usr/lib/$pkgname
  install -d $pkgdir/usr/bin
  ln -s "/usr/lib/${pkgname}/SupForWhatsApp" "${pkgdir}/usr/bin/WhatsApp"
  
  #Desktop file
  install -Dm644 "${srcdir}/whatsapp-desktop.desktop" \
		"${pkgdir}/usr/share/applications/whatsapp-desktop.desktop"

  #Icon
  install -Dm644 $srcdir/$_pkgname/assets-linux/icons/256/whatsappfordesktop.png \
		$pkgdir/usr/share/pixmaps/$pkgname.png
  
}
