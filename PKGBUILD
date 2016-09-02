# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=bcfg2-git
pkgver=1.4.0pre2.r88.g7586aee
pkgrel=1
pkgdesc="Configuration management tool"
url="http://bcfg2.org"
license=('BSD')
arch=('any')
depends=('python2' 'python2-setuptools' 'python2-lxml' 'python2-lockfile'
'python2-daemon' 'python2-pyinotify' 'python2-genshi' 'python2-yaml')
optdepends=(
  'python2-cheetah: Cheetah templating plugin'
  'apache: Web interface'
  'mod_wsgi2: Web interface'
  'python2-django: Web interface'
  'python2-south: Web interface'
  'python2-pygments: Web interface diff highlighting'
  'sqlite: Web interface sqlite backend'
  'python2-pysqlite: Web interface sqlite backend'
  'mariadb: Web interface mariadb backend'
  'mysql-python: Web interface mariadb backend')
makedepends=('git')
conflicts=('bcfg2')
source=(git+https://github.com/Bcfg2/bcfg2.git
        httpd-bcfg2.conf
        bcfg2-report-collector.service)
md5sums=('SKIP'
         '4f5958b9bbfc119db45eee0f3eedaba8'
         'c0dc757d7ae08741519c932662d55698')

pkgver() {
  cd bcfg2

  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd bcfg2

  python2 setup.py build
}

package() {
  cd bcfg2

  python2 setup.py install --root="$pkgdir"

  install -Dm 644 redhat/systemd/bcfg2.service \
    "$pkgdir"/usr/lib/systemd/system/bcfg2.service
  install -Dm 644 redhat/systemd/bcfg2-server.service \
    "$pkgdir"/usr/lib/systemd/system/bcfg2-server.service
  install -Dm 644 ../bcfg2-report-collector.service \
    "$pkgdir"/usr/lib/systemd/system/bcfg2-report-collector.service
  install -Dm 644 ../httpd-bcfg2.conf \
    "$pkgdir"/etc/httpd/conf/extra/httpd-bcfg2.conf
}
