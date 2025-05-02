# Maintainer : L. Bradley LaBoon <me@bradleylaboon.com>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=puppetserver
pkgver=8.7.0
pkgrel=2
pkgdesc="Server automation framework and application"
arch=('any')
url="https://docs.puppetlabs.com/puppetserver/latest/services_master_puppetserver.html"
license=("APACHE")
depends=("ruby" "puppet>=6" "java-runtime-headless" "logrotate" "jruby"
         "facter" "net-tools")
backup=('etc/default/puppetserver'
        'etc/logrotate.d/puppetserver'
        'etc/puppetlabs/puppetserver/conf.d/auth.conf'
        'etc/puppetlabs/puppetserver/conf.d/global.conf'
        'etc/puppetlabs/puppetserver/conf.d/puppetserver.conf'
        'etc/puppetlabs/puppetserver/conf.d/web-routes.conf'
        'etc/puppetlabs/puppetserver/conf.d/webserver.conf'
        'etc/puppetlabs/puppetserver/logback.xml'
        'etc/puppetlabs/puppetserver/request-logging.xml'
        'etc/puppetlabs/puppetserver/services.d/ca.cfg')
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::https://downloads.puppetlabs.com/puppet/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://downloads.puppetlabs.com/puppet/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=('151a468b573c003b7e41c477e8dc540f4ede7274720e53f321167507db395df50be3a3cee9cb6294feb0fffd290accf577679b077c2538c59471be1aa365d83f'
            'SKIP')
validpgpkeys=('D6811ED3ADEEB8441AF5AA8F4528B6CD9E61EF26')

prepare() {
  cd "${pkgname}-${pkgver}"

  echo 'hiera-eyaml 4.2.0' >> ext/build-scripts/jruby-gem-list.txt
  sed -i 's:sysconfig:default:' ext/redhat/puppetserver.service
  sed -i "s:\[/opt/puppetlabs/puppet/lib/ruby/vendor_ruby\]:\[$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' ),$( ruby -e \
    'puts Gem.default_dir' )/gems/facter-$( facter -v )/lib\]:" \
    "ext/config/conf.d/${pkgname}.conf"
  sed -i "s:/opt/puppetlabs/puppet/lib/ruby/vendor_gems:$( ruby -e \
    'puts Gem.default_dir' ):" \
    ext/build-scripts/install-vendored-gems.sh
  sed -i 's:#!/opt/.*/ruby:#!/usr/bin/ruby:' ext/cli/ca
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
    rundir=${_app_rundir} \
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
    sed -i 's/\/var\/run/\/run/g' "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
}
