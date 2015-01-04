# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-hostmaster
_pkgname=hostmaster
pkgver=3.0_alpha2
pkgrel=1
pkgdesc="mass Drupal hosting system - frontend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=(
    'aegir-provision'
    'cron'
    'nginx'
    'php-fpm'
    'php-gd'
    'rsync'
    'mariadb'
    'sudo'
    'smtp-forwarder'
    'unzip'
)
install=$pkgname.install
options=(!upx !strip)
source=(
    "http://ftp.drupal.org/files/projects/${_pkgname}-7.x-${pkgver/_/-}-core.tar.gz"
    'http://ftp.drupal.org/files/projects/devel-7.x-1.5.tar.gz'
    'php.ini'
    'php-fpm.conf'
    'php-fpm.svc.conf'
    'nginx.conf'
    'nginx.svc.conf'
    'service'
    'sudoers'
    'http://ftp.drupal.org/files/projects/eldir-7.x-3.0-alpha1.tar.gz'
    'http://ftp.drupal.org/files/projects/hosting-7.x-3.0-alpha2.tar.gz'
    'http://ftp.drupal.org/files/projects/hosting_platform_pathauto-7.x-2.1.tar.gz'
)
md5sums=('cc1039871c38efeef918b3facecf2d86'
         'f06c912eb4edbd48fbcc2867516726a3'
         '6bd6a1c6264fe7c06d79d1f5159b1e68'
         'e3c0a33e3ce714b4fdbd2e30416456c2'
         'e052eeae1565fcd35550900003ffa840'
         'a849c7594eedec0ef415b972da048815'
         'e8b6c3748c26caf4af21d402e7a0b947'
         '675f8f7b0bec18b3a02c6a5db5de5360'
         '21178d56a58133e39309dd98d94409cc'
         '5f168aedc6800fd3620fbc46d48c88a9'
         '5aafb84a768533b7389fa704f20afd02'
         '70d7c42d55588e59646526a4afc2a7f5')

package() {
    cd "${_pkgname}-7.x-${pkgver/_/-}"

    msg2 'Adding hostmaster site files'
    install -m755 -d "${pkgdir}/var/lib/aegir/hostmaster"
    mv sites "${pkgdir}/var/lib/aegir/hostmaster"
    chown -R http:http "${pkgdir}/var/lib/aegir"

    msg2 'Adding hostmaster static files'
    install -m755 -d "${pkgdir}/usr/share/webapps/aegir"
    ln -s /var/lib/aegir/hostmaster/sites "${pkgdir}/usr/share/webapps/aegir"
    mv * "${pkgdir}/usr/share/webapps/aegir"

    # Known issue: http://community.aegirproject.org/3.0-alpha1
    msg2 'Adding devel module (known 7.x-3.0-alpha1 bug)'
    cd $srcdir
    install -m755 -d "${pkgdir}/var/lib/aegir/hostmaster/sites/all/modules"
    mv devel "${pkgdir}/var/lib/aegir/hostmaster/sites/all/modules"

    # Upgrading modules
    mv eldir "${pkgdir}/var/lib/aegir/hostmaster/sites/all/modules"
    mv hosting "${pkgdir}/var/lib/aegir/hostmaster/sites/all/modules"
    mv hosting_platform_pathauto "${pkgdir}/var/lib/aegir/hostmaster/sites/all/modules"

    msg2 'Adding misc config files'
    cd $srcdir
    install -Dm644 php.ini          "${pkgdir}/etc/php/conf.d/aegir.ini"
    install -dm750                  "${pkgdir}/etc/sudoers.d"
    install -Dm440 sudoers          "${pkgdir}/etc/sudoers.d/aegir"
    install -Dm644 php-fpm.conf     "${pkgdir}/etc/php/fpm.d/aegir.conf"
    install -Dm644 nginx.conf       "${pkgdir}/etc/nginx/aegir.conf"
    install -Dm644 service          "${pkgdir}/usr/lib/systemd/system/aegir.service"
    install -Dm644 php-fpm.svc.conf "${pkgdir}/usr/lib/systemd/system/php-fpm.service.d/aegir.conf"
    install -Dm644 nginx.svc.conf   "${pkgdir}/usr/lib/systemd/system/nginx.service.d/aegir.conf"
    mkdir -p "{pkgdir}/var/lib/aegir/{backups,clients,config/{includes,self,server_localhost,server_master/nginx/{platform,post,pre,subdir,platform}.d},platforms}"
    install -dm711 "${pkgdir}/var/lib/aegir/config"
    ln -sr /var/lib/aegir/config/server_master/nginx.conf "${pkgdir}/var/lib/aegir/config/nginx.conf"

    msg2 'Applying file permissions'
    chown -R 170:170 "${pkgdir}/usr/share/webapps/aegir"
    chown -R 170:170 "${pkgdir}/var/lib/aegir"
    find "${pkgdir}/usr/share/webapps/aegir" -type f -exec chmod 0644 {} +
    find "${pkgdir}/usr/share/webapps/aegir" -type d -exec chmod 0755 {} +
    find "${pkgdir}/var/lib/aegir" -type f -exec chmod 0644 {} +
    find "${pkgdir}/var/lib/aegir" -type d -exec chmod 0755 {} +
    chmod -R ga-rwx "${pkgdir}/var/lib/aegir/config"
}
