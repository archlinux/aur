# Maintainer: Hubert Kario <kario@wsisiz.edu.pl>
# based on official PKGBUILD for smartmontools made by:
# Maintainer: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Jeff Mickey <jeff@archlinux.org>
# Contributor: Jani Talikka <jani.talikka@gmail.com>
# Contributor: Ralf Barth <archlinux.org@haggy.org>
# Contributor: Christopher Arndt <chris@chrisarndt.de>
# Maintainer: ava1ar <mail(at)ava1ar(dot)me>

pkgname=smartmontools-svn
_pkgname=smartmontools
pkgver=5337
pkgrel=1
pkgdesc="Control and monitor S.M.A.R.T. enabled ATA and SCSI Hard Drives - latest SVN version"
url="http://smartmontools.sourceforge.net"
license=('GPL')
arch=('i686' 'x86_64')
depends=('bash' 'gcc-libs' 'libcap-ng')
makedepends=('subversion')
backup=('etc/smartd.conf'
        'etc/conf.d/smartd')
source=("$pkgname"::"svn+https://svn.code.sf.net/p/smartmontools/code/trunk/smartmontools"
        'smartd.conf')
sha256sums=('SKIP'
            'c2c0f2f6b4a3f3d76da1c7706139297aef6e3f2a705eb7fdd800544812427c74')
provides=($_pkgname)
conflicts=($_pkgname)

pkgver() {
  cd "$srcdir/$pkgname"
  local ver="$(svnversion)"
  printf "%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "$srcdir/$pkgname"

  ./autogen.sh
  ./configure --prefix=/usr \
              --sbindir=/usr/bin \
              --sysconfdir=/etc \
              --with-drivedb \
              --with-libcap-ng=yes \
              --with-smartdscriptdir=/usr/share/smartmontools \
              --with-systemdsystemunitdir=/usr/lib/systemd/system
  make
}

package() {
  cd "$srcdir/$pkgname"

  sed -i -e "s:sysconfig/smartmontools:conf.d/smartd:g" smartd.service
  sed -i -e "s:smartd_opts:SMARTD_ARGS:g" smartd.service

  make DESTDIR="${pkgdir}" install

  rm -rf ${pkgdir}/etc/rc.d
  install -Dm644 ${srcdir}/smartd.conf "${pkgdir}/etc/conf.d/smartd"
}
