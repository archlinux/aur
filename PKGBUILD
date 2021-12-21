# Maintainer: Jorge Pizarro-Callejas <jpizarrocallejas@gmail.com>

pkgname=lanshare-git
_pkgname="LAN-Share"
pkgver=continuous.r4.gaa7a3bc
pkgrel=1
pkgdesc="LAN Share is a cross platform local area network file transfer application, built using Qt GUI framework."
arch=(i686 x86_64 arm armv6h armv7h aarch64)
url="https://github.com/abdularis/LAN-Share"
license=(GPL)
depends=(qt5-base)
source=("git+https://github.com/abdularis/$_pkgname.git")
sha256sums=('SKIP')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname/packaging/linux/debian"
  sed -i "/Path=.*/d" LANShare.desktop 
  sed -i "s^Exec=.*^Exec=/usr/bin/LANShare^" LANShare.desktop 
  sed -i "s/Name\[en_US\]=.*/Name\[en_US\]=LANShare/" LANShare.desktop
}

build() {
  cd "$srcdir/$_pkgname/src"
  qmake
  make
}

package() {
  install -Dm755 "$srcdir/$_pkgname"/src/LANShare "$pkgdir"/usr/bin/LANShare
  ln -s /usr/bin/LANShare "$pkgdir/usr/bin/lanshare"

  cd "$srcdir/$_pkgname/packaging/linux/debian"
  install -D LANShare.desktop  "$pkgdir"/usr/share/applications/LANShare.desktop
  install -D lanshare-icon.png "$pkgdir"/usr/share/pixmaps/lanshare-icon.png
}
