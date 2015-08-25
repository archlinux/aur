# Maintainer: icaruseffect <icaruseffect at posteo dot net>
pkgname="burp-backup-git"
_pkgname="burp"
pkgver=2.0.16.r0.g2aacabd
pkgrel=2
pkgdesc="Burp is a backup and restore program. It uses librsync in order to save on the amount of space that is used by each backup. Builts from Git-master"
arch=('any')
license=('AGPLv3')
depends=('librsync' 'openssl')
makedepends=('uthash' 'git')
conflicts=('burp-backup' 'burp-backup-dev')
provides=(burp-backup)

url='http://burp.grke.org/'
source=(
        'burp::git+https://github.com/grke/burp.git#branch=master'
        'burp.service'
        )

sha256sums=(
        'SKIP' #git source
        'e598b81d6d3dff2d336cf87191d52a7f336adc497c818742424fea73070cef24' # burp.service
        ) 

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"
  sed -i 's/\/var\/run/\/run/' Makefile.in
}

build() {
  cd "$srcdir/$_pkgname"
  ./configure --sbindir=/usr/bin || return 1
}

backup=(  'etc/burp/burp.conf'
  'etc/burp/burp-server.conf'
  'etc/cron.d/burp'
  'etc/burp/CA-client'
  'etc/burp/clientconfdir'
)

package() {

  cd "$srcdir/$_pkgname"
  make || return 1
  make DESTDIR="$pkgdir/" install
  
 # install systemd service
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp ../burp.service $pkgdir/usr/lib/systemd/system

 # cron.d logrotate
  mkdir $pkgdir/etc/cron.d
  cp debian/burp.cron.d $pkgdir/etc/cron.d/burp
  mkdir $pkgdir/etc/logrotate.d
  cp debian/logrotate $pkgdir/etc/logrotate.d/burp


 # fix permissions
  mkdir -p $pkgdir/var/spool/burp
  chmod 755 $pkgdir/var/spool
  chmod 0600 $pkgdir/etc/burp/burp.conf
  chmod 0600 $pkgdir/etc/burp/burp-server.conf
  chmod 0700 $pkgdir/etc/burp/clientconfdir
  chmod 0700 $pkgdir/var/spool/burp
  
}
