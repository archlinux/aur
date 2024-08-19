# Maintainer: omgold@aur
# Contibutor: Brian Bidulock <bidulock@openss7.org>

pkgname=fence-agents
pkgver=4.11.0
pkgrel=1
pkgdesc="OCF fence agents for rgmanager and pacemaker"
arch=('x86_64')
url='http://clusterlabs.org/'
license=('GPL2')
makedepends=('libxslt' 'python' 'libvirt' 'libxml2' 'python-boto3' 'python-suds' 'python-google-auth')
depends=('python-pexpect' 'python-pycurl' 'python-requests')
optdepends=(
    'python-boto3: for aws'
    'python-suds: for ovh and vmware_soap'
    'python-google-auth: for gce'
    'libvirt: for virt'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/ClusterLabs/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('21be9fcbc6f49815ca989d4f7b584cb1793b360be34da3b0afa9c0e21dbf2c7db363716abd702ba38f7863904c7a3bd26caba2005b0572d6e336c052f210328f')

prepare() {
  cd $pkgname-$pkgver
  echo "$pkgver" >.tarball-version
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr \
              --bindir=/usr/bin \
              --sbindir=/usr/bin \
              --libdir=/usr/lib \
              --libexecdir=/usr/lib \
              --sysconfdir=/etc \
              --localstatedir=/var \
              --with-systemdsystemunitdir=/usr/lib/systemd/system \
              --disable-cpg-plugin
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  rm -fr "${pkgdir}/var"
  rm -fr "${pkgdir}/etc/init.d"
  install -Dm644 /dev/null "${pkgdir}/usr/lib/tmpfiles.d/fence-agents.conf"
  ( echo "# /usr/lib/tmpfiles.d/fence-agents.conf"
    echo "d /run/fence-agents 0755 root root -"
  )>>"${pkgdir}/usr/lib/tmpfiles.d/fence-agents.conf"
}

# vim: set sw=2 et:

