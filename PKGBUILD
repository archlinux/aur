# Puppetdb: Installer: Arch
# Original Author: Niels Abspoel <aboe76 (at) Gmail (dot) com>
# Maintainer: Tim Meusel <tim@bastelfreak.de>

# RC style, reserved for later use
##pkgname=puppetdb
#_rc=1
#_pkgver=2.0.0
#pkgver=${_pkgver}_rc${_rc}

pkgname=puppetdb
pkgver=2.3.4
pkgrel=1
pkgdesc="Puppet data warehouse; it manages storage and retrieval of all platform-generated data"
arch=("any")
url="https://docs.puppetlabs.com/puppetdb/latest/"
license=("APACHE")
depends=("ruby" "facter" "puppet" "jre7-openjdk" )
backup=('etc/puppetdb/conf.d/jetty.ini' 'etc/puppetdb/conf.d/database.ini' 'etc/puppetdb/conf.d/config.ini' 'etc/puppetdb/conf.d/repl.ini')
provides=("puppetdb")
install="puppetdb.install"
source=("http://downloads.puppetlabs.com/puppetdb/$pkgname-${pkgver//_/-}.tar.gz"
        "puppetdb.service"
        "puppetdb-sysconfig"
        "build_defaults.yaml")
md5sums=('c3873bead77b62b9c2edffbaa886a090'
         'cc44a56414dc70fc01343c5ca4089038'
         '9407eb01415b37e2dcb52129ba41468b'
         'ddbe92f96248a11877877b168f56ae9a')
recommends=('postgresql-server')
package () {
  cd "${srcdir}/${pkgname}-${pkgver//_/-}"
  unset DESTDIR
  export LANG=en_US.UTF-8

  # Fix package bootstrap on archlinux
  cp ${startdir}/build_defaults.yaml $srcdir/${pkgname}-${pkgver//_/-}/ext/build_defaults.yaml 

  # clean wrong ext/files/ and pkg dir
  rake clean
  # recreate ext/files and pkg dir
  rake package:bootstrap
  # install puppetdb 
  rake install PARAMS_FILE= DESTDIR=${pkgdir}

  # add logrotate
  install -Dm 644 $srcdir/${pkgname}-${pkgver//_/-}/ext/files/puppetdb.logrotate $pkgdir/etc/logrotate.d/puppetdb

  #puppetdb documentation
  mkdir -p $pkgdir/usr/share/doc/puppetdb/documentation
  cp -r $srcdir/${pkgname}-${pkgver//_/-}/documentation $pkgdir/usr/share/doc/puppetdb/documentation
  install -D -m644 $srcdir/${pkgname}-${pkgver//_/-}/*.md $pkgdir/usr/share/doc/puppetdb/

  #archlinux specific systemd because of java binary in other place.
  install -D -m644 "${startdir}/puppetdb.service" "${pkgdir}/usr/lib/systemd/system/puppetdb.service"
  install -D -m644 "${startdir}/puppetdb-sysconfig" "${pkgdir}/etc/sysconfig/puppetdb"

}
# vim: set ft=sh ts=2 sw=2 et:
