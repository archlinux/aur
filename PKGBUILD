# Maintainer: Greg Sutcliffe <greg.sutcliffe@gmail.com>>

pkgname=foreman-proxy
pkgver=1.13.0
pkgrel=1
pkgdesc='Manages services like DNS, DHCP, TFTP and Puppet though a HTTP Restful API. Used by foreman'
arch=('any')
url='https://github.com/theforeman/smart-proxy'
license=('GPL3')
depends=('ruby'
         'ruby-bundler_ext'
         'ruby-sinatra>=1.3.3'
         'ruby-json')
optdepends=('ruby-gssapi: REALM module dependanecy'
            'ruby-rb-inotify: DHCP module dependency'
            'sudo: PUPPET module dependency'
            'wget: TFTP module dependency')
backup=("etc/foreman-proxy/settings.yml")
options=(emptydirs)
install="foreman-proxy.install"
source=(https://github.com/theforeman/smart-proxy/archive/${pkgver}.tar.gz
        foreman-proxy.systemd
        foreman-proxy.conf.d
        foreman-proxy.logrotate
        foreman-proxy.tmpfiles.conf)
md5sums=('dca0a2bf1e6842243c20830f0a8a4107'
         'd1c95e8be469b9d67ada1f8ad9a09ca0'
         '930f65dfe6bac87a276d02a76b691058'
         'd41d8cd98f00b204e9800998ecf8427e'
         'dedfafe3fd8ee6efcbc7fd9ae90a75cd')

prepare() {
  #replace default location of 'settings.d'
  sed -i '/^---/ a #replace default location of "settings.d"\n:settings_directory: /etc/foreman-proxy/settings.d\n' \
    $srcdir/smart-proxy-${pkgver}/config/settings.yml.example

  # switches to bundler_ext instead of bundler
  mv $srcdir/smart-proxy-${pkgver}/Gemfile $srcdir/smart-proxy-${pkgver}/Gemfile.in
}

package() {
# Dirs
  install -d -m0755 ${pkgdir}/usr/share/${pkgname}
  install -d -m0755 ${pkgdir}/usr/share/${pkgname}/config
  install -d -m0755 ${pkgdir}/etc/${pkgname}
  install -d -m0755 ${pkgdir}/etc/${pkgname}/settings.d
  install -d -m0755 ${pkgdir}/var/lib/${pkgname}
  install -d -m0750 ${pkgdir}/var/log/${pkgname}

  # Systemd
  install -Dp -m0644 $srcdir/foreman-proxy.systemd $pkgdir/usr/lib/systemd/system/foreman-proxy.service
  install -Dp -m0644 $srcdir/foreman-proxy.tmpfiles.conf $pkgdir/usr/lib/tmpfiles.d/foreman-proxy.conf

  # Logrotate
  install -Dp -m0644 ${srcdir}/foreman-proxy.logrotate ${pkgdir}/etc/logrotate.d/${pkgname}

  # Conf.d
  install -Dp -m0644 ${srcdir}/foreman-proxy.conf.d ${pkgdir}/etc/conf.d/foreman-proxy

  # Main codebase
  cd ${srcdir}/smart-proxy-${pkgver}
  cp -p -r bin extra lib modules Rakefile Gemfile.in smart_proxy.gemspec bundler.d config.ru VERSION ${pkgdir}/usr/share/${pkgname}

  # Install binary
  chmod a+x ${pkgdir}/usr/share/${pkgname}/bin/smart-proxy

  # Cleanup
  rm -rf ${pkgdir}/usr/share/${pkgname}/*.rb
  # remove all test units from productive release
  find ${pkgdir}/usr/share/${pkgname} -type d -name "test" |xargs rm -rf

  # Move config files to /etc
  install -Dp -m0644 ${srcdir}/smart-proxy-${pkgver}/config/settings.yml.example ${pkgdir}/etc/${pkgname}/settings.yml
  ln -sv /etc/${pkgname}/settings.yml ${pkgdir}/usr/share/${pkgname}/config/settings.yml
  install -Dp -m0644 ${srcdir}/smart-proxy-${pkgver}/config/settings.d/*.example ${pkgdir}/etc/${pkgname}/settings.d/
  rename .example '' ${pkgdir}/etc/${pkgname}/settings.d/*
  touch ${pkgdir}/etc/${pkgname}/migration_state
  ln -sv /etc/${pkgname}/migration_state ${pkgdir}/usr/share/${pkgname}/config/migration_state

  # Put logs in /var/log
  ln -sv /var/log/${pkgname} ${pkgdir}/usr/share/${pkgname}/logs

  # Link temp directory to system wide temp
  ln -sv /tmp ${pkgdir}/usr/share/${pkgname}/tmp

}

# vim:set ts=2 sw=2 et:
