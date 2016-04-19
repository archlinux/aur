# Maintainer: James An <james@jamesan.ca>

pkgname=aegir
pkgver=7.x_3.4
pkgrel=1
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
        'php.ini'
        'sudoers'
)
md5sums=('b0f2e5dca01b32c967cd823dab6b8779'
         '95bce00a6c0ac2a0b51642449554105b'
         'd43026960060bc677549baa26a24c9ee'
         '2a640d69beeea0c03d80b75357a040fe'
         '75535f9870f06c540f513262a9b7b1ab'
         '496b1fa2533d1306318115e2b02984bd'
         'f9ae0c781a7ccefc63329daaf81fca36'
         '0b53c23730e511946859d4e3c7fff982'
         '0dab31966eada66adb159355ed814a54')

#~ pkgver() {
    #~ echo \
      #~ $(drush rl --fields=version --field-labels=0 provision | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' ') \
      #~ $(drush rl --fields=version --field-labels=0 hostmaster | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' ') \
      #~ | tr ' ' $'\n' | sort -ur | head -n1
#~ }

package() {
    msg2 'Adding config files'
    install -dm750 "$pkgdir/etc/sudoers.d"
    install -Dm644 msmtprc "$pkgdir/etc/msmtprc.$pkgname"
    install -Dm644 nginx.conf "$pkgdir/etc/nginx/$pkgname.conf"
    install -Dm644 php.ini   "$pkgdir/etc/php/conf.d/$pkgname.ini"
    install -Dm644 php-fpm.conf   "$pkgdir/etc/php/fpm.d/$pkgname.conf"
    install -Dm400 sudoers "$pkgdir/etc/sudoers.d/$pkgname"
    install -Dm644 --owner=http --group=http <( ) "$pkgdir/var/spool/cron/$pkgname"

    msg2 'Adding systemd files'
    install -Dm644 "$pkgname.service"  "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$pkgname.target" "$pkgdir/usr/lib/systemd/system/$pkgname.target"
    install -Dm644 nginx.systemd.conf "$pkgdir/usr/lib/systemd/system/nginx.service.d/aegir.conf"
    install -Dm644 php-fpm.systemd.conf "$pkgdir/usr/lib/systemd/system/php-fpm.service.d/aegir.conf"

    msg2 'Creating $pkgname directory structure'
    install --directory --owner=http --group=http --mode=6775 "$pkgdir/etc/drush"{,/cache{,/{complete,default,download,usage}}}
    install --directory --owner=http --group=http --mode=6775 "$pkgdir/usr/share/webapps/$pkgname"
    install --directory --owner=http --group=http --mode=0700 "$pkgdir/usr/share/webapps/$pkgname/.ssh"{,/ctrl-sockets}
    mkdir -p "$pkgdir/srv/http" "$pkgdir/etc/skel"
    ln -s /etc/drush "$pkgdir/srv/http/.drush"
    ln -s /etc/drush "$pkgdir/etc/skel/.drush"
    ln -s /etc/drush "$pkgdir/usr/share/webapps/$pkgname/.drush"
    ln -s "/usr/share/webapps/$pkgname/.ssh" "$pkgdir/srv/http/.ssh"
    umask 066
    mkdir -p "$pkgdir/usr/share/webapps/$pkgname/"{config{,/{includes,server_{localhost,master{,/nginx}}}},clients}
    umask 077
    mkdir -p "$pkgdir/usr/share/webapps/$pkgname/"{backups,config/server_master/nginx/{platform,post,pre,subdir,platform,vhost}.d}
    umask 027
    mkdir -p "$pkgdir/usr/share/webapps/$pkgname/"clients/admin
    umask 007
      mkdir -p "$pkgdir/usr/share/webapps/$pkgname/"config/self
    ln -s "/usr/share/webapps/$pkgname/config/server_master/nginx.conf"         "$pkgdir/usr/share/webapps/$pkgname/config/nginx.conf"
    ln -s "/usr/share/webapps/$pkgname/config/includes/nginx_vhost_common.conf" "$pkgdir/usr/share/webapps/$pkgname/config/includes/nginx_advanced_include.conf"
    ln -s "/usr/share/webapps/$pkgname/config/includes/nginx_vhost_common.conf" "$pkgdir/usr/share/webapps/$pkgname/config/includes/nginx_simple_include.conf"

    chown -R http:http "$pkgdir/etc/drush" "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/var/spool/cron/$pkgname"
}
