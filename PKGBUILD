#Contributor: Diego Principe <cdprincipe@at@gmail@dot@com>
#Contributor: Martin Villagra <mvillagra0@gmail.com>

pkgname=qbittorrent-nogui-git
pkgver=.7189
pkgrel=1
pkgdesc="Bittorrent client based on libtorrent-rasterbar (without X support)"
arch=('i686' 'x86_64')
url="http://www.qbittorrent.org/"
license=('GPL')
depends=('libtorrent-rasterbar' 'qt5-base')
makedepends=('boost' 'qt5-tools')
conflicts=('qbittorrent-nogui')
source=("git://github.com/qbittorrent/qBittorrent.git"
        "qbittorrent.service"
        "qbittorrent@.service"
        "qbittorrent-libtorrent-1.1.1.patch")
md5sums=('SKIP'
         '98ac5dd1f2a5ab78ece106ac2df1ec1c'
         '375b80818026e6cdd586fca37379b0ab'
         '1da24b5e84f642a2f2790a77e36d496c')
        
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
  patch -Np1 -i "$srcdir/qbittorrent-libtorrent-1.1.1.patch"
  ./configure --prefix=/usr --disable-gui
  make
}

package() {
  cd ${srcdir}/build
  make INSTALL_ROOT=${pkgdir} install
  install -Dm644 "$srcdir/qbittorrent.service" "$pkgdir/usr/lib/systemd/user/qbittorrent.service"
  install -Dm644 "$srcdir/qbittorrent@.service" "$pkgdir/usr/lib/systemd/system/qbittorrent@.service"
}
