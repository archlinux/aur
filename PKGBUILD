# Puppetdb: Installer: Arch
# Original Author: Niels Abspoel <aboe76 (at) Gmail (dot) com>
# Maintainer: Tim Meusel <tim@bastelfreak.de>

# RC style, reserved for later use
##pkgname=puppetdb
#_rc=1
#_pkgver=2.0.0
#pkgver=${_pkgver}_rc${_rc}

pkgname=puppetdb
pkgver=2.3.8
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
sha512sums=('06133934c1496693ab239b1fdf17b8bc292f746efc08741d0172e7889d2b9908f8142777bda415c2ade9f65f58c5573abb35db5cbf15b22ad70a56d4233159fd'
            'ab12b3da8420b582a018b6ec61de14eed0987159af6a799f102a62839a32f5e457850cc80183c42db1fbe123747c34ac44af7a055983faa59e440494de3907a1'
            '378b85c4b5895d2d05ff2701a4fba0967bfa45dd937512c4125f7f8bbb29f210d1ca5945e75fce3e344231d124df1eda900e8151de9a11d6f5ede5d01f8e003b'
            'adee2b426f943573b004a62c488950a87c16bc2c44fd786f8bc8e6fefc30355d078a41494570bf34c6b9c6d6124499ffa29c511b611ff562b45586b6f670438f')
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
  rake package:bootstrap --trace
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
