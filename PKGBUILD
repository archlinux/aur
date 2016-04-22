# Maintainer: Marcin Wieczorek <marcin@marcin.co>

pkgname=messengerfordesktop-git
pkgver=v1.4.7
pkgrel=2
pkgdesc="Beautiful desktop client for Facebook Messenger. Sytten's fork"
arch=('i686' 'x86_64')
url="http://messengerfordesktop.com/"
license=('MIT')
options=(!strip)
depends=('gcc-libs' 'cairo' 'libxtst' 'alsa-lib' 'gtk2' 'gconf' 'libnotify' 'fontconfig' 'nss')
makedepends=('git' 'gulp' 'npm')
source=("$pkgname::git+https://github.com/Sytten/Facebook-Messenger-Desktop.git")
md5sums=('SKIP')

if [ $(uname -m) == "i686" ]
 then
  _arch="linux32"
else
  _arch="linux64"
fi

build() {
  cd $pkgname
  npm install
  
  gulp build:${_arch}
}

package() {
  cd "${srcdir}/messengerfordesktop-git/build/Messenger/${_arch}"
  mkdir -p "${pkgdir}/opt/MessengerForDesktop/"
  install -D -m755 "Messenger"    "${pkgdir}/opt/MessengerForDesktop/Messenger"
  install -D -m644 "nw.pak"       "${pkgdir}/opt/MessengerForDesktop/nw.pak"
  install -D -m644 "icudtl.dat"   "${pkgdir}/opt/MessengerForDesktop/icudtl.dat"

  cd "${srcdir}/messengerfordesktop-git/assets-linux"
  install -D -m644 "${srcdir}/messengerfordesktop-git/assets-linux/messengerfordesktop.desktop" "${pkgdir}/usr/share/applications/messengerfordesktop.desktop"
  install -D -m644 "icons/256/messengerfordesktop.png"     "${pkgdir}/usr/share/pixmaps/messengerfordesktop.png"
}
