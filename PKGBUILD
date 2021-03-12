# Contributor: Patrick McCarty <pnorcks at gmail dot com>
# Contributor: Chao Wang <chaowang@redhat.com>

pkgname=koji
pkgver=1.24.0
pkgrel=1
pkgdesc='shared libraries and the command-line interface for building and tracking RPMS'
arch=('any')
license=('GPL2' 'LGPL2.1')
url="https://pagure.io/koji"
depends=('python-dateutil' 'python-six' 'python-requests-kerberos' 'python-pyopenssl' 'rpm-tools')
makedepends=('python')
backup=('etc/httpd/conf.d/kojihub.conf'
        'etc/httpd/conf.d/kojiweb.conf'
        'etc/koji-gc/koji-gc.conf'
        'etc/koji-hub/hub.conf'
        'etc/koji-hub/plugins/messagebus.conf'
        'etc/koji-hub/plugins/protonmsg.conf'
        'etc/koji-hub/plugins/rpm2maven.conf'
        'etc/koji-shadow/koji-shadow.conf'
        'etc/koji.conf'
        'etc/kojid/kojid.conf'
        'etc/kojid/plugins/runroot.conf'
        'etc/kojira/kojira.conf'
        'etc/kojivmd/kojivmd.conf'
        'etc/kojiweb/web.conf')
source=("https://releases.pagure.org/koji/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('032876f9fb0381318ea1a77ed165f64bec8141563ff09f4f96307a7b555ce1c9')

prepare() {
  cd "$pkgname-$pkgver"
  find . -name Makefile -exec sed -i 's|sbin|bin|' {} \;
  find . -name '*.service' -exec sed -i 's|sbin|bin|' {} \;
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" PYTHON=python install
  sed -i 's|^\(#!/usr/bin/\)python2|\1python|' "$pkgdir"/usr/bin/*
}
