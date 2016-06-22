# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=messengerfordesktop-git
pkgver=1.5.0.beta.0.r0.g225a528
pkgrel=1
pkgdesc="Beautiful desktop client for Facebook Messenger. Git version."
arch=('i686' 'x86_64')
url="http://messengerfordesktop.com/"
license=('MIT')
conflicts=('messengerfordesktop' 'messengerfordesktop-bin')
options=(!strip)
depends=('libxtst' 'alsa-lib' 'gtk2' 'gconf' 'libnotify' 'nss' 'xorg-xprop' 'xorg-xwininfo')
makedepends=('git' 'gulp' 'npm')
source=("$pkgname::git+https://github.com/Aluxian/Facebook-Messenger-Desktop.git#branch=V1.5.X"
		"start.sh")

md5sums=('SKIP'
         '31abbecf99328b1b77ee1bdb1e2d981f')

if [ $CARCH == x86_64 ]; then
  _arch="64"
else
  _arch="32"
fi

pkgver() {
  cd ${pkgname}
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  npm install
  gulp build:linux${_arch}
}

package() {
  mkdir -p "${pkgdir}/usr/share/messengerfordesktop/"

  cd "${srcdir}/messengerfordesktop-git/build/Messenger/linux${_arch}"
  for file in `find . -type f`; do
	install -D -m644 "${file}"   "${pkgdir}/usr/share/messengerfordesktop/${file}"
  done;

  install -D -m755 "${srcdir}/start.sh"	  															  "${pkgdir}/usr/bin/messengerfordesktop"
  install -D -m755 "${srcdir}/messengerfordesktop-git/build/Messenger/linux${_arch}/Messenger"		  "${pkgdir}/usr/share/messengerfordesktop/Messenger"
  install -D -m644 "${srcdir}/messengerfordesktop-git/assets-linux/messengerfordesktop.desktop" 	  "${pkgdir}/usr/share/applications/messengerfordesktop.desktop"
  install -D -m644 "${srcdir}/messengerfordesktop-git/assets-linux/icons/256/messengerfordesktop.png" "${pkgdir}/usr/share/pixmaps/messengerfordesktop.png"
  install -D -m644 "${srcdir}/messengerfordesktop-git/LICENSE" 										  "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  sed -i '6s/.*/Exec=sh \/usr\/bin\/messengerfordesktop/' "${pkgdir}/usr/share/applications/messengerfordesktop.desktop"
}
