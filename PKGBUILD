# Maintainer: Zdenek Janecek <ycdmdj@gmail.com>
pkgname=airdcpp-webclient-git
pkgver=r2725.1a932a46
pkgrel=1
_gitname=airdcpp-webclient
pkgdesc="A peer-to-peer file sharing client with web user interface."
arch=('i686' 'x86_64' 'armv7h')
url="https://airdcpp-web.github.io"
license=('GPL')
depends=('miniupnpc' 'boost' 'openssl' 'geoip' 'leveldb' 'websocketpp' 'libnatpmp' 'intel-tbb')
makedepends=('cmake' 'git')
source=('git+https://github.com/airdcpp-web/airdcpp-webclient.git'
        'airdcpp.service'
        'airdcpp-system.socket'
        'airdcpp-user.socket')
sha256sums=('SKIP'
            'c7127ba4f361eb156b436791f7aa486636959bfe4d6d8e772e220beb4db04d30'
            '452e4689a9b62c4e1c5cb30c79e2720946c8460d5228c6697444abbfbcc4bf68'
            '452e4689a9b62c4e1c5cb30c79e2720946c8460d5228c6697444abbfbcc4bf68')

install=airdcpp.install

pkgver() {
  cd ${srcdir}/${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_gitname}

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make -j4
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir}/ install

  install -d "${pkgdir}"/usr/lib
  mv ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib
  rmdir ${pkgdir}/usr/lib64

  cd ..
  install -d -g 170 -o 170 ${pkgdir}/var/lib/airdcpp
  install -Dm644 airdcpp.service ${pkgdir}/usr/lib/systemd/user/airdcpp.service
  install -Dm644 airdcpp-system.socket ${pkgdir}/usr/lib/systemd/system/airdcpp.socket
  install -Dm644 airdcpp-user.socket ${pkgdir}/usr/lib/systemd/user/airdcpp.socket
}
