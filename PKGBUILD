# Maintainer: samip537 <sm+aur AT samip DOT fi>
# Contributor: rafaelsoaresbr <rafaelsoaresbr@gmail.com>
# Contributing: https://github.com/rafaelsoaresbr/pkgbuild
# Builds: https://gitlab.com/rafaelsoaresbr/pkgbuild/builds
# Contributor: Dis McCarthy <aurarch@sigkill.net>
# Contributor: Stephan Conrad <stephan.conrad@gmail.com
 
pkgname=kimchi
pkgver=3.0.0
pkgrel=5
pkgdesc="KVM management plugin for WoK."
arch=(any)
url="https://github.com/kimchi-project/kimchi"
license=('LGPL' 'Apache')
groups=('kimchi-project')
depends=('libvirt-python'
        'open-iscsi'
        'nfs-utils'
        'python-paramiko'
        'python-pillow'
        'python-ipaddr'
        'python-magic'
        'python-configobj'
        'python-pyparted'
        'python-ethtool'
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
 
sha256sums=('feef8c324831e1b66173da0041fc4e512a140c67c35f89d20edb80df916b21ad')
 
build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var PYTHON=/usr/bin/python3
  #PYTHON=/usr/bin/python2 ./autogen.sh --system && make
}
 
package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
  cd $pkgdir/etc/systemd/system/wokd.service.d
  sed s:wokd.service::g kimchi.conf > kimchi.conf.new
  mv kimchi.conf.new kimchi.conf
}
