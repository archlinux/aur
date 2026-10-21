# Maintainer : L. Bradley LaBoon <brad@laboon.io>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
# Contributor: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Niels Abspoel <aboe76 (at) Gmail (dot) com>

pkgname=openvox-server
pkgver=9.1.0
pkgrel=1
pkgdesc='Server automation framework and application'
arch=('any')
url='https://github.com/OpenVoxProject/openvox-server'
license=('APACHE')
depends=('ruby' 'puppet>=6' 'java-runtime-headless=25' 'logrotate' 'jruby'
         'openfact' 'net-tools')
conflicts=('puppetserver')
provides=('puppetserver')
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
_hiera_eyaml_ver=5.0.1
source=("${pkgname}-${pkgver}.tar.gz::https://artifacts.voxpupuli.org/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'puppetserver.tmpfiles')
sha512sums=('2515ef857603b85b593dee12b4b51620ba71c1d1532d7d0600433648b6e508ab04c5d1933a618a60105da4000a3c7bccce5faa05d183b10d5ae0f9bfb0dd31e5'
            'd6266c1f9710fd948f94e1bb085e44fbaffd9bdc2215d610071ca41fa3f8d86af08d34cd746c5f2353b4e5a3ee2adb226ca23617c49d65855078ce5077efa30c')

prepare() {
  cd "puppetserver-${pkgver}"

  echo "hiera-eyaml ${_hiera_eyaml_ver}" >> ext/build-scripts/jruby-gem-list.txt
  sed -i 's:sysconfig:default:' ext/redhat/puppetserver.service
  sed -i "s:\[/opt/puppetlabs/puppet/lib/ruby/vendor_ruby\]:\[$( ruby -e \
    'puts RbConfig::CONFIG["vendorlibdir"]' ),$( ruby -e \
    'puts Gem.default_dir' )/gems/openfact-$( facter -v )/lib\]:" \
    "ext/config/conf.d/puppetserver.conf"
  sed -i "s:/opt/puppetlabs/puppet/lib/ruby/vendor_gems:$( ruby -e \
    'puts Gem.default_dir' ):" \
    ext/build-scripts/install-vendored-gems.sh
  sed -i 's:#!/opt/.*/ruby:#!/usr/bin/ruby:' ext/cli/ca
}

package() {
  cd "puppetserver-${pkgver}"

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
    install -vDm 644 "${srcdir}/puppetserver.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/puppetserver.conf"
}
