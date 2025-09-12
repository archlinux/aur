# Maintainer:  Markus Hansmair <archlinux at zendro dot de>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Nils Czernia <nils at czserver dot de>

pkgname=grav
pkgver=1.7.49.5
pkgrel=1
pkgdesc='Modern, Crazy Fast, Ridiculously Easy and Amazingly Powerful Flat-File CMS'
arch=('any')
url='https://getgrav.org'
license=('MIT')
provides=('grav')
depends=( )
optdepends=('php-apcu: Userland caching module for PHP' 
            'php-legacy-apcu: Userland caching module for PHP' 
            'php-yaml: YAML de-/serialization using the LibYAML library'
            'php-legacy-yaml: YAML de-/serialization using the LibYAML library'
            'php-fpm: FastCGI Process Manager'
            'php-legacy-fpm: FastCGI Process Manager'
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
sha256sums=('c29a3020ab3912e2604102def6faf95aad7cfe953cef86233a341dae0dbe13e6'
            '80d8a9e6788fc7efca9ce78f96902d37a3e3c3df363224480db6901bd7d7fcb3'
            '125e08820ed477582d7ae716dac6495bca4eac485fa4d4263b11f2505fc355db'
            'ced168231a98be4816afc0a1928b54218c4ce4081be7b49acd704e2a9325f9db'
            'ca7197a1e73fec939ea25ee8f3cc05db2117463aa9db8b2911f889e647974228'
            '9eee21d2ab9beb2169fcf9bd67ad0727071aeff13e5b335a633bec7f4c8c2634'
            '3fc8ca05caf57e5e8d1203f55057c30025d3933cf8b90988d4673a2f75af5470'
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
  depends=('php-interpreter' 'php-gd-interpreter')
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
