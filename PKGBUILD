# Maintainer: Noel Kuntze <noel@familie-kuntze.de>
# Contributor: Bidulock <bidulock@openss7.org>

pkgname=pcs-git
_pkgname=pcs
pkgver=0.10.1.r54.g93da15a7
pkgrel=1
pkgdesc='pacemaker corosync shell utility for cluster configuration'
arch=('any')
url='http://clusterlabs.org/'
license=('GPL2')
depends=('pacemaker-git'
         'python'
         'python-pycurl'
         'python-lxml'
         'python-dateutil'
         'python-yaml'
         'python-urllib3'
         'python-simplejson'
         'ruby'
         'ruby-backports'
         'ruby-ethon'
         'ruby-ffi'
         'ruby-json'
         'ruby-multi_json'
         'ruby-open4'
         'ruby-rack'
         'ruby-rack-protection'
         'ruby-rack-test'
         'ruby-sinatra'
         'ruby-tilt'
         'ttf-liberation')
makedepends=('git' 'wget' 'python-setuptools' 'ruby-bundler' 'fontconfig')
provides=($_pkgname)
conflicts=($_pkgname)
source=("$pkgname::git+https://github.com/ClusterLabs/${_pkgname}")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --tags --long|sed -E 's,^[^0-9]*,,;s,-([0-9]*),.r\1,;s,-,.,g'
}

prepare() {
  cd $pkgname
  sed -i -e 's,ethon-0.10.1,ethon-0.11.0,' pcsd/Makefile
  sed -i -e 's,ethon (0.10.1),ethon (0.11.0),' pcsd/Gemfile.lock
  sed -i -e 's,ffi-1.9.18,ffi-1.9.23,' pcsd/Makefile
  sed -i -e 's,ffi (1.9.18),ffi (1.9.23),' pcsd/Gemfile.lock
  sed -i -e 's,backports-3.9.1,backports-3.11.1,' pcsd/Makefile
  sed -i -e 's,backports (3.9.1),backports (3.11.1),' pcsd/Gemfile.lock
  sed -i -e 's,multi_json-1.12.2,multi_json-1.13.1,' pcsd/Makefile
  sed -i -e 's,multi_json (1.12.2),multi_json (1.13.1),' pcsd/Gemfile.lock
  sed -i -e 's,rack-1.6.4,rack-2.0.4,' pcsd/Makefile
  sed -i -e 's,rack (1.6.4),rack (2.0.4),' pcsd/Gemfile.lock
  sed -i -e 's,rack-protection-1.5.5,rack-protection-2.0.1,' pcsd/Makefile
  sed -i -e 's,rack-protection (1.5.5),rack-protection (2.0.1),' pcsd/Gemfile.lock
}

build() {
  cd $pkgname
# make -C pcsd BUILD_GEMS=true build_gems
}

package() {
  cd $pkgname
  make BUILD_GEMS=false SYSTEMCTL_OVERRIDE=true DESTDIR="${pkgdir}" install
# make DESTDIR="${pkgdir}" install install_pcsd
  rm -fr "${pkgdir}/usr/bin"
  mv "${pkgdir}/usr/sbin" "${pkgdir}/usr/bin"
}

# vim: set sw=2 et: