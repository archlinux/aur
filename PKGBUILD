# Maintainer:  Markus Hansmair <archlinux at zendro dot de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nils Czernia <nils at czserver dot de>

pkgname=grav
pkgver=1.7.41.1
pkgrel=1
pkgdesc='Modern, Crazy Fast, Ridiculously Easy and Amazingly Powerful Flat-File CMS'
arch=('any')
url='https://getgrav.org'
license=('MIT')
provides=('grav')
depends=( )
optdepends=('php-apcu: Userland caching module for PHP' 
            'php-yaml: YAML de-/serialization using the LibYAML library'
            'php-fpm: FastCGI Process Manager'
            'apache: High performance Unix-based HTTP server' 
            'nginx: Lightweight HTTP server and IMAP/POP3 proxy server'
            'uwsgi: Fast and highly tuneable application server'
            'uwsgi-plugin-php: uwsgi plugin for PHP')
install=grav.install
source=("${pkgname}-${pkgver}.zip::https://github.com/getgrav/grav/releases/download/${pkgver}/${pkgname}-v${pkgver}.zip"
        "grav.patch"
        "grav.user.readme"
        "grav.sysusers.conf"
        "grav.tmpfiles.conf"
        "grav.uwsgi.ini"
        "grav.php-fpm.ini"
        "grav.php-fpm.d.grav.conf"
        "grav.php-fpm.service.d.override.conf")
sha256sums=('7ac6f6387e246a79a5a6f04d215525117d3aa1c8029d839902d891aee4a4f2c5'
            '773b4015af1eca07e154f8d555e08e021f7d8b6c19ea5d8905ec472e8e18d2bf'
            '125e08820ed477582d7ae716dac6495bca4eac485fa4d4263b11f2505fc355db'
            'ced168231a98be4816afc0a1928b54218c4ce4081be7b49acd704e2a9325f9db'
            'ca7197a1e73fec939ea25ee8f3cc05db2117463aa9db8b2911f889e647974228'
            '494e1fb15cc7ca15f8d543276396f87c9498564a167dc70b6cbe9f91ebbc2f42'
            '2cce6d5ff03f6c5cf66f4cd188df59522df69bdfd76ebdff7489585ab530e03c'
            'bdde9deebedd5d53e43b1d5ac2fb2348953903f0c21cfad35a1ebfb78e065385'
            '13230cd930dccfecd9b3cb5c8b516dc98b3f2167f188305a2e4682f445f9acb9')
backup=('etc/webapps/grav/config/site.yaml'
        'etc/webapps/grav/config/system.yaml')

prepare() {
  cd "${srcdir}/${pkgname}"
  patch --strip=1 --input="../grav.patch"
  rm -rf assets backup cache .github images logs .phan tests tmp
  rm *.md composer.* now.json
  find . -type f -name '.gitkeep' -exec rm {} \;
  find . -depth -type d -name '.github' -exec rm -rf {} \;
  mv user user.upstream
}

package() {
  depends=('php>=7.3.6' 'php-gd')
  mkdir -p "${pkgdir}/usr/share/webapps"
  gravroot="${pkgdir}/usr/share/webapps/${pkgname}"
  cp -ar "${srcdir}/${pkgname}" "${gravroot}"
  chmod -R 644 "${gravroot}"
  chmod -R 755 "${gravroot}/bin"
  find "${gravroot}" -type d -exec chmod 755 {} \;
  install -Dm 644 "${gravroot}/user.upstream/config/"{site,system}".yaml" -t "${pkgdir}/etc/webapps/${pkgname}/config"
  install -Dm 644 "${srcdir}/grav.sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/${pkgname}.conf"
  install -Dm 644 "${srcdir}/grav.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf"
  install -Dm 644 "${srcdir}/grav.uwsgi.ini" "${gravroot}/webserver-configs/uwsgi-${pkgname}.ini"
  install -Dm 644 "${srcdir}/grav.php-fpm.ini" "${gravroot}/webserver-configs/php-fpm.ini"
  install -Dm 644 "${srcdir}/grav.php-fpm.d.grav.conf" "${gravroot}/webserver-configs/php-fpm.d/grav.conf"
  install -Dm 644 "${srcdir}/grav.php-fpm.service.d.override.conf" "${gravroot}/webserver-configs/php-fpm.service.d/override.conf"
  install -Dm 644 "${gravroot}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 "${srcdir}/grav.user.readme" "${gravroot}/user.upstream/README.md"
}
