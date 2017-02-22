# Maintainer: James An <james@jamesan.ca>

pkgname=aegir
pkgver=7.x_3.9
pkgrel=7
pkgdesc="Configuration for a dedicated Aegir server to host Drupal sites."
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=(
    "$pkgname-provision"
    "$pkgname-hostmaster"
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
optdepends=(
    'ruby-mailcatcher: catch mail forwarded to it and serve it on a web UI'
    'msmtp-mta: smtp forwarder'
)
options=(emptydirs)
install=$pkgname.install
source=("$pkgname.service"
        "$pkgname.target"
        'msmtprc'
        'nginx.conf'
        'nginx.systemd.conf'
        'php-fpm.conf'
        'php-fpm.systemd.conf'
        'sudoers'
)
md5sums=('81c8f6285f3f17184dc8655e2942f3fc'
         '95bce00a6c0ac2a0b51642449554105b'
         'd43026960060bc677549baa26a24c9ee'
         'e1bb28d05fc072f6cf86d18716cf1f97'
         '75535f9870f06c540f513262a9b7b1ab'
         '0b805c7084f94f46590f4b6ca73ec902'
         'f9ae0c781a7ccefc63329daaf81fca36'
         '54d222d45106c7ec6b13e9805eed882b')

package() {
    msg2 'Adding config files'
    install -dm750 "$pkgdir/etc/sudoers.d"
    install -Dm644 msmtprc "$pkgdir/etc/msmtprc.$pkgname"
    install -Dm644 nginx.conf "$pkgdir/etc/nginx/$pkgname.conf"
    install -Dm644 php-fpm.conf   "$pkgdir/etc/php/fpm.d/$pkgname.conf"
    install -Dm400 sudoers "$pkgdir/etc/sudoers.d/$pkgname"
    install -Dm644 --owner=http --group=http <( ) "$pkgdir/var/spool/cron/$pkgname"

    msg2 'Adding systemd files'
    install -Dm644 "$pkgname.service"  "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$pkgname.target" "$pkgdir/usr/lib/systemd/system/$pkgname.target"
    install -Dm644 nginx.systemd.conf "$pkgdir/usr/lib/systemd/system/nginx.service.d/aegir.conf"
    install -Dm644 php-fpm.systemd.conf "$pkgdir/usr/lib/systemd/system/php-fpm.service.d/aegir.conf"

    msg2 'Creating $pkgname directory structure'
    install --directory --owner=http --group=http --mode=ug=rwxs,o=rx "$pkgdir/etc/drush"{,/cache{,/{complete,default,download,usage}}}
    install --directory --owner=http --group=http --mode=ug=rwxs,o=rx "$pkgdir/var/lib/$pkgname"
    install --directory --owner=http --group=http --mode=u=rx "$pkgdir/var/lib/$pkgname/.ssh"{,/ctrl-sockets}
    mkdir -p "$pkgdir/srv/http" "$pkgdir/etc/skel"
    ln -s /etc/drush "$pkgdir/srv/http/.drush"
    ln -s /etc/drush "$pkgdir/etc/skel/.drush"
    ln -s /etc/drush "$pkgdir/var/lib/$pkgname/.drush"
    ln -s "/var/lib/$pkgname/.ssh" "$pkgdir/srv/http/.ssh"
    #~ umask 066
    mkdir -p "$pkgdir/var/lib/$pkgname/"{config{,/{includes,server_{localhost,master{,/nginx}},{self-signed,ssl}.d,letsencrypt{,.d/well-known/acme-challenge}}},clients}
    #~ umask 077
    mkdir -p "$pkgdir/var/lib/$pkgname/"{backups,config/server_master/nginx/{platform,post,pre,subdir,platform,vhost}.d}
    #~ umask 027
    mkdir -p "$pkgdir/var/lib/$pkgname/"clients/admin
    #~ umask 007
    mkdir -p "$pkgdir/var/lib/$pkgname/"config/self
    ln -s "/var/lib/$pkgname/config/server_master/nginx.conf" "$pkgdir/var/lib/$pkgname/config/nginx.conf"
    ln -sr "nginx_vhost_common.conf" "$pkgdir/var/lib/$pkgname/config/includes/nginx_advanced_include.conf"
    ln -sr "nginx_vhost_common.conf" "$pkgdir/var/lib/$pkgname/config/includes/nginx_simple_include.conf"

    chown -R http:http "$pkgdir/etc/drush" "$pkgdir/var/lib/$pkgname" "$pkgdir/var/spool/cron/$pkgname"
}
