# Maintainer : Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=puppetserver
pkgver=2.7.2
pkgrel=1
pkgdesc="Server automation framework and application"
arch=('any')
url="https://docs.puppetlabs.com/puppetserver/latest/services_master_puppetserver.html"
license=("APACHE")
depends=("ruby" "puppet>=4" "java-runtime-headless" "logrotate" "jruby"
         "facter>=3.1.3-4" "net-tools")
backup=('etc/default/puppetserver'
        'etc/logrotate.d/puppetserver'
        'etc/puppetlabs/puppetserver/bootstrap.cfg'
        'etc/puppetlabs/puppetserver/conf.d/auth.conf'
        'etc/puppetlabs/puppetserver/conf.d/global.conf'
        'etc/puppetlabs/puppetserver/conf.d/puppetserver.conf'
        'etc/puppetlabs/puppetserver/conf.d/web-routes.conf'
        'etc/puppetlabs/puppetserver/conf.d/webserver.conf'
        'etc/puppetlabs/puppetserver/logback.xml'
        'etc/puppetlabs/puppetserver/request-logging.xml')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::http://downloads.puppetlabs.com/puppet/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9f7586ce0b32a41ec47431ba0f8b1c2ddbcb79dc6efb220c1c6328eb747a4baf3e252c9717027f029e13df9e2dc4d2eea45977e1b1d42db4aed0690bf5c9c51c')

prepare() {
  cd "${pkgname}-${pkgver}"

  sed -i 's:sysconfig:default:' ext/redhat/puppetserver.service
  sed -i "s:\[/opt/puppetlabs/puppet/lib/ruby/vendor_ruby\]:\[$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' ),$( ruby -e \
    'puts RbConfig::CONFIG["vendordir"]' )\]:" "ext/config/conf.d/${pkgname}.conf"
}

package() {
  cd "${pkgname}-${pkgver}"

_prefix=${_prefix:=/usr}
_unitdir=${_unitdir:=/usr/lib/systemd/system}
_real_name=${_real_name:=puppetserver}
_confdir=${_confdir:=/etc}
_sysconfdir=/etc
_app_bindir=${_bindir:=/opt/puppetlabs/server/apps/${_real_name}/bin}
_sym_bindir=${_symbindir:=/opt/puppetlabs/server/bin}
_app_prefix=${_app_prefix:=/opt/puppetlabs/server/apps/${_real_name}}
_app_data=${_app_data:=/opt/puppetlabs/server/data/${_real_name}}
_app_logdir=${_app_logdir:=/var/log/puppetlabs/${_real_name}}

  env EZ_VERBOSE=1 DESTDIR="${pkgdir}" prefix=${_prefix} \
    app_prefix=${_app_prefix} app_data=${_app_data} \
    confdir=${_sysconfdir} bindir=${_app_bindir} symbindir=${_sym_bindir} \
    rundir=${_app_rundir} rubylibdir=${rubylibdir} \
    bash install.sh install_redhat

  env EZ_VERBOSE=1 DESTDIR="${pkgdir}" prefix=${_prefix} \
    app_prefix=${_app_prefix} app_data=${_app_data} \
    confdir=${_sysconfdir} bindir=${_app_bindir} \
    symbindir=${_sym_bindir} rundir=${_app_rundir} \
    defaultsdir=${_sysconfdir}/default unitdir=${_unitdir} \
    bash install.sh systemd_redhat

  env EZ_VERBOSE=1 DESTDIR="${pkgdir}" confdir=${_sysconfdir} \
    bash install.sh logrotate

    install -d -m 0755 "${pkgdir}/usr/bin"
    ln -s "${_symbindir}/${_real_name}" "${pkgdir}/usr/bin/${_real_name}"
    install -d "${pkgdir}"/opt/puppetlabs/server/data/puppetserver/jruby-gems
    rm -r "${pkgdir}"/var/run
}
