# Maintainer: James An <james@jamesan.ca>

pkgname=aegir
pkgver=7.x_3.0_alpha2
pkgrel=3
pkgdesc="Configuration for a dedicated Aegir server."
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=(
    'aegir-provision'
    'aegir-hostmaster'
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
options=(emptydirs)
install=$pkgname.install
source=(
    'msmtprc'
    'nginx.conf'
    'nginx.svc.conf'
    'php.ini'
    'sudoers'
    'systemd.service'
    'systemd.target'
)
md5sums=('1e9dd39b8c305eaab83e41a782e7c3c9'
         '3079abdb035783843375b1745d651f8b'
         '75535f9870f06c540f513262a9b7b1ab'
         '451f623150d84118f6801a63053226f0'
         'b3bd87cc4571873fd860bf4b6a0e51fa'
         '4889b3de48732ec149a71aeb72039455'
         '80773e4278e09b14cc6843e346540a9d')

package() {
    msg2 'Adding config files'
    install -dm750                  "$pkgdir/etc/sudoers.d"
    install -Dm440 sudoers          "$pkgdir/etc/sudoers.d/$pkgname"
    install -Dm644 nginx.conf       "$pkgdir/etc/nginx/$pkgname.conf"
    install -Dm644 php.ini          "$pkgdir/etc/php/conf.d/$pkgname.ini"
    install -Dm644 msmtprc          "$pkgdir/etc/msmtprc.aegir"

    msg2 'Adding systemd files'
    install -Dm644 nginx.svc.conf   "$pkgdir/usr/lib/systemd/system/nginx.service.d/$pkgname.conf"
    install -Dm644 systemd.service  "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    msg2 'Creating aegir directory structure'
    mkdir -pm700 "$pkgdir/var/lib/aegir/config/server_master/nginx/"{platform,post,pre,subdir,platform,vhost}".d"
    mkdir -pm755 "$pkgdir/var/lib/aegir/"{backups,clients,config{,/{includes,self,server_localhost,server_master{,/nginx}}}}
    mkdir -pm755 "$pkgdir/var/lib/aegir/"{.drush/cache,platforms}
    ln -sr server_master/nginx.conf "$pkgdir/var/lib/aegir/config/nginx.conf"
    ln -sr nginx_vhost_common.conf "$pkgdir/var/lib/aegir/config/includes/nginx_advanced_include.conf"
    ln -sr nginx_vhost_common.conf "$pkgdir/var/lib/aegir/config/includes/nginx_simple_include.conf"

    install -Dm644 <( ) "$pkgdir/var/spool/cron/http"
    install -Dm644 systemd.target "$pkgdir/usr/lib/systemd/system/$pkgname.target"

    chown -R http:http "$pkgdir/var/lib/$pkgname" "$pkgdir/var/spool/cron/http"
}
