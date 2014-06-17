# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname="smcroute-git"
pkgver=1.99.2.r65.ga8326b7
pkgrel=1
pkgdesc="A command line tool to manipulate the multicast routes of a UNIX kernel. It supports both IPv4 and IPv6 multicast routing."
arch=('i686' 'x86_64')
url="https://github.com/troglobit/smcroute"
license=('GPL2')
groups=()
depends=('bash')
provides=('smcroute' 'mcsender')
conflicts=('smcroute' 'mcsender')
backup=('etc/smcroute.conf' 'etc/conf.d/smcrouted')
source=("$pkgname::git+https://github.com/troglobit/smcroute.git"
        'smcroute.conf.example'
        'smcrouted.conf.d'
        'smcrouted.rc.d')
noextract=()   
md5sums=('SKIP'
         '59fdb2baf1184d0cb5c59b576b1b5e1c'
         'aed88a7472e9daef0b783d017735c8f4'
         'b925ad844fe57f017ed5f840b86e701d')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^0\.95\./1.99.2./'
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install

  # install rc script and its configuration file
  install -Dm644 "${srcdir}/smcroute.conf.example" "${pkgdir}/etc/smcroute.conf"
  install -Dm644 "${srcdir}/smcrouted.conf.d" "${pkgdir}/etc/conf.d/smcrouted"
  install -Dm755 "${srcdir}/smcrouted.rc.d" "${pkgdir}/etc/rc.d/smcrouted"
}

# vim:set ts=2 sw=2 et:
