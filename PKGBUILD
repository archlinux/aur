# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=puppetserver
pkgver=2.1.1
pkgrel=5
pkgdesc="Server automation framework and application"
arch=('any')
url="https://docs.puppetlabs.com/puppetserver/latest/services_master_puppetserver.html"
license=("APACHE")
depends=("ruby" "puppet>=4" "java-environment" "logrotate" "jruby" "facter2")
backup=('etc/default/puppetserver'
        'etc/logrotate.d/puppetserver'
        'etc/puppetlabs/puppetserver/bootstrap.cfg'
        'etc/puppetlabs/puppetserver/conf.d/ca.conf'
        'etc/puppetlabs/puppetserver/conf.d/global.conf'
        'etc/puppetlabs/puppetserver/conf.d/puppetserver.conf'
        'etc/puppetlabs/puppetserver/conf.d/web-routes.conf'
        'etc/puppetlabs/puppetserver/conf.d/webserver.conf'
        'etc/puppetlabs/puppetserver/logback.xml'
        'etc/puppetlabs/puppetserver/request-logging.xml')
install=$pkgname.install
source=(http://pkgbuild.com/~jsteel/arch/puppet/$pkgname-$pkgver.tar.gz)
md5sums=('d88cc2815ae198eaf794af73856e197f')

prepare() {
  cd $pkgname-$pkgver

  sed -i 's:sysconfig:default:' ext/redhat/puppetserver.service
  sed -i "s:/opt/puppetlabs/puppet/lib/ruby/vendor_ruby:$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' ):" ext/config/conf.d/$pkgname.conf
  sed -i "s:run/puppetlabs:run/puppet:" ext/config/conf.d/$pkgname.conf
}

package() {
  cd $pkgname-$pkgver

_prefix=${_prefix:=/usr}
_unitdir=${_unitdir:=/usr/lib/systemd/system}
_datadir=${_datadir:=${_prefix}/share}
_real_name=${_real_name:=puppetserver}
_proj_datadir=${_proj_datadir:=${_datadir}/${_real_name}}
_confdir=${_confdir:=/etc}
_projconfdir=${_projconfdir:=${confdir}/puppetlabs/${_real_name}}
# Application specific bin directory
_bindir=${_bindir:=/opt/puppetlabs/server/apps/${_real_name}/bin}
# User facing bin directory, expected to be added to interactive shell PATH
_uxbindir=${_uxbindir:=/opt/puppetlabs/bin}
# symlinks of server binaries
_symbindir=${_symbindir:=/opt/puppetlabs/server/bin}
_app_prefix=${_app_prefix:=/opt/puppetlabs/server/apps/${_real_name}}
_app_data=${_app_data:=/opt/puppetlabs/server/data/${_real_name}}
_app_logdir=${_app_logdir:=/var/log/puppetlabs/${_real_name}}
_defaultsdir=/etc/default

    install -d -m 0755 "${pkgdir}${_app_prefix}"
    install -d -m 0755 "${pkgdir}${_app_data}"
    install -m 0644 puppet-server-release.jar "${pkgdir}${_app_prefix}"
    install -m 0774 ext/ezbake-functions.sh "${pkgdir}${_app_prefix}"
    install -m 0644 ext/ezbake.manifest "${pkgdir}${_app_prefix}"
    install -d -m 0755 "${pkgdir}${_projconfdir}/conf.d"
    install -m 0644 ext/config/conf.d/puppetserver.conf "${pkgdir}${_projconfdir}/conf.d/puppetserver.conf"
    install -m 0644 ext/config/conf.d/ca.conf "${pkgdir}${_projconfdir}/conf.d/ca.conf"
    install -m 0644 ext/config/request-logging.xml "${pkgdir}${_projconfdir}/request-logging.xml"
    install -m 0644 ext/config/logback.xml "${pkgdir}${_projconfdir}/logback.xml"
    install -m 0644 ext/config/bootstrap.cfg "${pkgdir}${_projconfdir}/bootstrap.cfg"
    install -m 0644 ext/config/conf.d/global.conf "${pkgdir}${_projconfdir}/conf.d/global.conf"
    install -m 0644 ext/config/conf.d/web-routes.conf "${pkgdir}${_projconfdir}/conf.d/web-routes.conf"
    install -m 0644 ext/config/conf.d/webserver.conf "${pkgdir}${_projconfdir}/conf.d/webserver.conf"
    install -d -m 0755 "${pkgdir}${_app_prefix}/scripts"
    install -d -m 0755 "${pkgdir}${_app_prefix}/cli"
    install -d -m 0755 "${pkgdir}${_app_prefix}/cli/apps"
    install -d -m 0755 "${pkgdir}${_bindir}"
    install -m 0755 "ext/bin/${_real_name}" "${pkgdir}${_bindir}/${_real_name}"
    install -d -m 0755 "${pkgdir}${_symbindir}"
    ln -s "../apps/${_real_name}/bin/${_real_name}" "${pkgdir}${_symbindir}/${_real_name}"
    install -d -m 0755 "${pkgdir}${_uxbindir}"
    ln -s "../server/apps/${_real_name}/bin/${_real_name}" "${pkgdir}${_uxbindir}/${_real_name}"
    install -d -m 0755 "${pkgdir}/usr/bin"
    ln -s "${_symbindir}/${_real_name}" "$pkgdir/usr/bin/${_real_name}"
    install -m 0755 ext/cli/irb "${pkgdir}${_app_prefix}/cli/apps/irb"
    install -m 0755 ext/cli/foreground "${pkgdir}${_app_prefix}/cli/apps/foreground"
    install -m 0755 ext/cli/gem "${pkgdir}${_app_prefix}/cli/apps/gem"
    install -m 0755 ext/cli/ruby "${pkgdir}${_app_prefix}/cli/apps/ruby"
    install -d -m 750 "${pkgdir}${_app_logdir}"
    install -d -m 0755 "${pkgdir}${_defaultsdir}"
    install -m 0644 ext/default "${pkgdir}${_defaultsdir}/puppetserver"
    install -d -m 0755 "${pkgdir}${_unitdir}"
    install -m 0755 ext/redhat/puppetserver.service "${pkgdir}${_unitdir}/puppetserver.service"
    install -d "$pkgdir"/opt/puppetlabs/server/data/puppetserver/jruby-gems
    install -d -m 0755 "${pkgdir}${_confdir}/logrotate.d"
    install ext/puppetserver.logrotate.conf "${pkgdir}${_confdir}/logrotate.d/puppetserver"
}
