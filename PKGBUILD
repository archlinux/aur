# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributo: Jianhui Z <jianhui@outlook.com>
# Contributo: Tau Tsao <realturner at gmail.com>
# Contributor: Tomasz Zok <tomasz.zok [at] gmail.com>
# Contributor: techryda <techryda at silentdome dot com>
# Contributor: Mathias R. <pu154r@overlinux.org>
pkgname=xrdp
pkgver=0.8.0
pkgrel=1
pkgdesc="An open source remote desktop protocol (RDP) server"
url="http://xrdp.sourceforge.net/"
arch=('i686' 'x86_64' 'armv6h')
license=('Apache')
makedepends=('libpulse' 'fuse')
depends=('tigervnc' 'libxrandr')
optdepends=('libpulse: to use the pule audio module'
            'fuse: to use the file clipboard module')
backup=('etc/xrdp/sesman.ini' 'etc/xrdp/xrdp.ini')
install=xrdp.install
source=(https://github.com/neutrinolabs/${pkgname}/archive/v${pkgver}.tar.gz
        arch-config.diff)
md5sums=('2b0c3affc65ee77ad251514c62896757'
         '12bcbdf83cae9754da5e39aaf5e013e8')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i 's|/etc/sysconfig/xrdp|/etc/xrdp/xrdp.ini|' instfiles/xrdp.service
  sed -i 's|/etc/sysconfig/xrdp|/etc/xrdp/xrdp.ini|' instfiles/xrdp-sesman.service

  sed -i 's|/usr/local/sbin|/usr/bin|' instfiles/xrdp.sh
  sed -i 's|/usr/sbin|/usr/bin|' instfiles/xrdp.service
  sed -i 's|/usr/sbin|/usr/bin|' instfiles/xrdp-sesman.service
#  patch -p1 < ../arch-config.diff

  ./bootstrap
}

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --sbindir=/usr/bin \
              --with-systemdsystemdunitdir=/usr/lib/systemd/system \
              --enable-jpeg \
              --enable-simplesound \
              --enable-fuse \
              --enable-loadpulsemodules
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
