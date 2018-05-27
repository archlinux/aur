# Maintainer: Zdenek Janecek <ycdmdj@gmail.com>
pkgname=airdcpp-webclient-git
pkgver=r3043.6dd17de5
pkgrel=1
_gitname=airdcpp-webclient
pkgdesc="A peer-to-peer file sharing client with web user interface."
arch=('i686' 'x86_64' 'armv7h')
url="https://airdcpp-web.github.io"
license=('GPL')

depends=('miniupnpc' 'boost' 'openssl-1.0' 'geoip' 'libnatpmp' 'npm' 'websocketpp' 'leveldb' 'intel-tbb' 'libmaxminddb')
makedepends=('cmake' 'git')
source=('git+https://github.com/airdcpp-web/airdcpp-webclient.git'
        'airdcpp.service'
        'airdcpp.socket'
        'airdcpp.sysusers'
        'airdcpp.tmpfiles')
sha256sums=('SKIP'
            '6fe0977db676dc4fdcd872ed866b4d8189a4800e0c96ef0c7f2ba57c93a6ff19'
            '452e4689a9b62c4e1c5cb30c79e2720946c8460d5228c6697444abbfbcc4bf68'
            '4de13425653648ee086b924310e025b365eb0ee06c271a8f02f4161c828b4d96'
            'b8dd6c435e1140c169211c36fdded45a8bd8e675f7b78b2db769aaa05b176659')

install="airdcpp-webclient-git.install"

pkgver() {
  cd ${srcdir}/${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_gitname}

  export PKG_CONFIG_PATH=/usr/lib/openssl-1.0/pkgconfig

  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${srcdir}/${_gitname}
  make DESTDIR=${pkgdir}/ install

  install -d "${pkgdir}"/usr/lib
  mv ${pkgdir}/usr/lib64/* ${pkgdir}/usr/lib
  rmdir ${pkgdir}/usr/lib64

  cd ..
  install -Dm644 airdcpp.service ${pkgdir}/usr/lib/systemd/system/airdcpp.service
  install -Dm644 airdcpp.socket ${pkgdir}/usr/lib/systemd/system/airdcpp.socket
  install -Dm644 airdcpp.sysusers ${pkgdir}/usr/lib/sysusers.d/airdcpp.conf
  install -Dm644 airdcpp.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/airdcpp.conf
}
