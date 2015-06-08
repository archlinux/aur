#Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
#Contributor: Martin Villagra <mvillagra0@gmail.com>

pkgname=qbittorrent-nogui-git
pkgver=.5793
pkgrel=1
pkgdesc="Bittorrent client based on libtorrent-rasterbar (without X support)"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('GPL')
depends=('libtorrent-rasterbar' 'qt5-base')
makedepends=('boost')
conflicts=('qbittorrent-nogui')
source=("git://github.com/qbittorrent/qBittorrent.git"
        "qbittorrent.service")
md5sums=('SKIP'
         '7d04cc84253fa1b6c1bfaca6edce8c81')
        
pkgver() {
  cd ${srcdir}/qBittorrent
  echo $(cat ${srcdir}/qBittorrent/version.pri | grep -o '[0-9]..*[0-9]').$(git rev-list --count HEAD)
}

prepare() {
if [[ -d ${srcdir}/build ]]; then
      msg "Cleaning the previous build directory..."
      rm -rf ${srcdir}/build
  fi
 cp -r ${srcdir}/qBittorrent ${srcdir}/build
}

build() {
  cd ${srcdir}/build
  ./configure --prefix=/usr --disable-gui  --with-qt5
  make
}

package() {
  cd ${srcdir}/build
  make INSTALL_ROOT=${pkgdir} install
  install -D -m0755 "$srcdir/qbittorrent.service" "$pkgdir/usr/lib/systemd/system/qbittorrent.service"
}
