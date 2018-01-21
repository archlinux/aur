# Maintainer: cr0mag <phillips.julian AT gmail DOT com>
# Contributor: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
# Contributor: Dis McCarthy <aurarch@sigkill.net>
# Contributor: Stephan Conrad <stephan.conrad@gmail.com

pkgname=kimchi
pkgver=2.5.0
pkgrel=1
pkgdesc="KVM management plugin for WoK."
arch=(any)
url="https://github.com/kimchi-project/kimchi"
license=('LGPL' 'Apache')
groups=('kimchi-project')
depends=('bridge-utils'
         'dnsmasq'
         'ebtables'
	 'libvirt-python2'
	 'open-iscsi'
	 'nfs-utils'
         'python2-paramiko'
         'python2-pillow'
	 'python2-ipaddr'
	 'python2-magic'
	 'python2-configobj'
	 'python2-pyparted'
	 'python2-ethtool'
         'novnc'
	 'libguestfs'
         'spice-html5'
         'wokd'
)
#optdepends=()
makedepends=('git' 'libxslt')
#checkdepends=()
conflicts=('kimchi-git')

# User files that should be saved. They are kept as Pacnew and Pacsave Files
backup=('etc/wok/plugins.d/kimchi.conf')

source=('https://github.com/kimchi-project/'${pkgname}'/archive/'${pkgver}'.tar.gz')

sha256sums=('45a04534abcdd31550b1604b42f72397285b80006be404cac8248b4ceddc7eb6')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  #./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var PYTHON=/usr/bin/python3
  PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
  cd $pkgdir/etc/systemd/system/wokd.service.d
  sed s:wokd.service::g kimchi.conf > kimchi.conf.new
  mv kimchi.conf.new kimchi.conf
}
