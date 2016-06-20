# Maintainer: Marcin Wieczorek <marcin@marcin.co>
# Contributor: Michael Corrigan <ghost.vonage AT gmail DOT com>
# Contributor: tomsik68	<tomsik68 AT gmail DOT com>
# Contributor: gandl <gandlspam AT gmail DOT com>
# Contributor: Jristz <prflr88 AT gmail DOT com>

pkgname=messengerfordesktop
pkgver=1.4.8
pkgrel=1
pkgdesc="Beautiful desktop client for Facebook Messenger."
arch=('i686' 'x86_64')
url="http://messengerfordesktop.com/"
license=('MIT')
conflicts=('messengerfordesktop-git' 'messengerfordesktop-bin')
options=(!strip)
depends=('libxtst' 'alsa-lib' 'gtk2' 'gconf' 'libnotify' 'nss' 'xorg-xprop' 'xorg-xwininfo')
makedepends=('git' 'gulp' 'npm')
source=("https://github.com/Aluxian/Facebook-Messenger-Desktop/archive/v${pkgver}.tar.gz"
		"start.sh")

md5sums=('15606a5bf64cb52fde0b3d057591c5fe'
         '31abbecf99328b1b77ee1bdb1e2d981f')

if [ $CARCH == x86_64 ]; then
  _arch="64"
else
  _arch="32"
fi

build() {
  cd "${srcdir}/Facebook-Messenger-Desktop-${pkgver}"
  npm install
  gulp build:linux${_arch}
}

package() {
  mkdir -p "${pkgdir}/usr/share/messengerfordesktop/"

  cd "${srcdir}/Facebook-Messenger-Desktop-${pkgver}/build/Messenger/linux${_arch}"
  for file in `find . -type f`; do
	install -D -m644 "${file}" "${pkgdir}/usr/share/messengerfordesktop/${file}"
  done;

  cd "${srcdir}/Facebook-Messenger-Desktop-${pkgver}/"
  install -D -m755 "${srcdir}/start.sh"	  							"${pkgdir}/usr/bin/messengerfordesktop"
  install -D -m755 "build/Messenger/linux${_arch}/Messenger"		"${pkgdir}/usr/share/messengerfordesktop/Messenger"
  install -D -m644 "assets-linux/messengerfordesktop.desktop" 	    "${pkgdir}/usr/share/applications/messengerfordesktop.desktop"
  install -D -m644 "assets-linux/icons/256/messengerfordesktop.png" "${pkgdir}/usr/share/pixmaps/messengerfordesktop.png"
  install -D -m644 "LICENSE" 										"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  sed -i '6s/.*/Exec=sh \/usr\/bin\/messengerfordesktop/' "${pkgdir}/usr/share/applications/messengerfordesktop.desktop"
}
