# Maintainer: Dis McCarthy <aurarch@sigkill.net>
# Contributor: Stephan Conrad <stephan.conrad@gmail.com
pkgname=kimchi
_gitname=kimchi-1.4.1
pkgver=1.4.1
pkgrel=4

pkgdesc="HTML5 management for KVM"

arch=(any)

url="https://github.com/kimchi-project/kimchi"

license=('LGPL2.1' 'APACHE')

depends=('python2-cherrypy'
  'python2-cheetah'
  'libvirt-python'
  'python2-imaging'
  'pypam2-bzr'
  'python2-m2crypto'
  'python2-jsonschema'
  'qemu'
  'python2-psutil'
  'python2-ethtool'
  'python2-ipaddr'
  'python2-lxml'
  'open-iscsi'
  'lvm2'
  'python2-lxml'
  'python2-pyparted'
  'libguestfs'
  'nginx'
  'bridge-utils'
  'ebtables'
  'dnsmasq'
  'openbsd-netcat'
  'python2-ldap'
  'websockify'
  'novnc'
  'sudo'
)


makedepends=('git')

# User files that should be saved. They are kept as Pacnew and Pacsave Files
backup=('etc/kimchi/kimchi.conf')

#Git: "git+git://github.com/kimchi-project/kimchi.git#tag=${pkgver}"
source=(
 "https://github.com/kimchi-project/kimchi/archive/1.4.1.tar.gz"
 "python2.patch"
 "proxy.patch"
 "kimchid.service"
 "arch_support.path"
)

md5sums=('92be5f41bd08a7a769880767bf03a435'
         '1106f1f362e0b7f01409242486b2c495'
         'd8b6bfc1b210cc819dac46931aaecd7f'
         '356d68fd7735c826c36cbde651ebd675'
         'bc3c6a1ed184240370fadecaac1b0f59')

build() {
  cd "$srcdir/${pkgname}-${pkgver}"
  msg "Patching for python2"
  patch -p1 -i ../python2.patch
  msg "Patching for www user"
  patch -p1 -i ../proxy.patch
  msg "Patching for Arch support"
  patch -p1 -i ../arch_support.path
  #./autogen.sh --prefix=/usr --sysconfdir=/etc --localstatedir=/var PYTHON=/usr/bin/python3
  PYTHON=/usr/bin/python2.7 ./autogen.sh --system
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}"
  make DESTDIR=$pkgdir install
  # Systemd units
  install -Dm0644 ../kimchid.service "${pkgdir}/usr/lib/systemd/system/kimchid.service"
}
