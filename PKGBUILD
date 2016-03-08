# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgname=puppetserver1
_pkgname=puppetserver
pkgver=1.1.3
pkgrel=1
pkgdesc="Server automation framework and application"
arch=('any')
url="http://docs.puppetlabs.com/puppetserver/1.1/"
license=("APACHE")
depends=("ruby" "puppet3" "java-runtime-headless" "logrotate" "jruby"
         "facter2" "net-tools")
backup=('etc/logrotate.d/puppetserver'
        'etc/puppetserver/bootstrap.cfg'
        'etc/puppetserver/conf.d/ca.conf'
        'etc/puppetserver/conf.d/global.conf'
        'etc/puppetserver/conf.d/os-settings.conf'
        'etc/puppetserver/conf.d/puppetserver.conf'
        'etc/puppetserver/conf.d/web-routes.conf'
        'etc/puppetserver/conf.d/webserver.conf'
        'etc/puppetserver/logback.xml'
        'etc/puppetserver/request-logging.xml'
        'etc/default/puppetserver')
provides=('puppetserver')
conflicts=('puppetserver')
install=$_pkgname.install
source=(http://downloads.puppetlabs.com/puppet/$_pkgname-$pkgver.tar.gz)
md5sums=('ce786f4958132dbca309de474578e2be')

prepare() {
  cd $_pkgname-$pkgver

  sed -i 's:sysconfig:default:' ext/redhat/puppetserver.service
  sed -i '/ExecStartPre/d' ext/redhat/puppetserver.service
}

package() {
  cd $_pkgname-$pkgver

  env EZ_VERBOSE=1 DESTDIR="$pkgdir" prefix=/usr confdir=/etc \
    bindir=/usr/bin rundir=/var/lib/puppetserver localstatedir="" \
    rubylibdir="$( ruby -e 'puts RbConfig::CONFIG["vendorlibdir"]' )" \
    bash install.sh install_redhat

  env EZ_VERBOSE=1 DESTDIR="$pkgdir" prefix=/usr confdir=/etc \
    bindir=/usr/bin rundir=/var/lib/puppetserver \
    defaultsdir=/etc/default unitdir=/usr/lib/systemd/system \
    bash install.sh systemd_redhat

  env EZ_VERBOSE=1 DESTDIR="$pkgdir" confdir=/etc bash install.sh logrotate

  install -d "$pkgdir"/run/puppet
  install -d "$pkgdir"/var/log/puppet
}
