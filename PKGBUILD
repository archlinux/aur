# Maintainer: James An <james@jamesan.ca>

pkgname=aegir
pkgver=7.x_3.0
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
        'mysqld-aegir.service'
        'nginx-aegir.service'
        'nginx.conf'
        'php-fpm-aegir.service'
        'php-fpm.conf'
        'sudoers'
)
md5sums=('b0f2e5dca01b32c967cd823dab6b8779'
         'c279899d0b987e4d53ea85d0f154a510'
         'd43026960060bc677549baa26a24c9ee'
         '7559c51ec89b4d65a1193b3d6d6da297'
         'ef858752158383dfde4c8b7f8cb7c6f0'
         '7edbcc6b449a2f09ed93f88b77f300a5'
         'f9f1b1a7e551c718c154c1c745827b1e'
         'b1300cd3bd23a2544e2eff247cad2f80'
         'cb65729f01d5d641fc85518c2175a13a')

#~ pkgver() {
    #~ echo \
      #~ $(drush rl --fields=version --field-labels=0 provision | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' ') \
      #~ $(drush rl --fields=version --field-labels=0 hostmaster | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' ') \
      #~ | tr ' ' $'\n' | sort -ur | head -n1
#~ }

package() {
    msg2 'Adding config files'
    install -dm750                  "$pkgdir/etc/sudoers.d"
    install -Dm440 sudoers          "$pkgdir/etc/sudoers.d/$pkgname"
    install -Dm644 nginx.conf       "$pkgdir/etc/nginx/$pkgname.conf"
    install -Dm644 php-fpm.conf   "$pkgdir/etc/php/fpm.d/$pkgname.conf"
    install -Dm644 msmtprc "$pkgdir/etc/msmtprc.$pkgname"
    install -Dm644 <( ) "$pkgdir/var/spool/cron/$pkgname"

    msg2 'Adding systemd files'
    for unit in {mysqld,nginx,php-fpm}-aegir.service; do
      install -Dm644 "$unit" "$pkgdir/usr/lib/systemd/system/$unit"
    done
    install -Dm644 "$pkgname.service"  "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$pkgname.target" "$pkgdir/usr/lib/systemd/system/$pkgname.target"

    msg2 'Creating $pkgname directory structure'
    mkdir -p "$pkgdir/etc/drush" "$pkgdir/usr/share/webapps/$pkgname"
    ln -s /etc/drush "$pkgdir/usr/share/webapps/$pkgname/.drush"
    umask 077
    mkdir -p "$pkgdir/usr/share/webapps/$pkgname/"{backups,clients/admin,config/{includes,self,server_master/nginx/{platform,post,pre,subdir,platform,vhost}.d}}
    umask 022
    mkdir -p "$pkgdir/usr/share/webapps/$pkgname/"{,config{includes,self,server_localhost,server_master/nginx}}

    ln -s "/usr/share/webapps/$pkgname/config/server_master/nginx.conf"         "$pkgdir/usr/share/webapps/$pkgname/config/nginx.conf"
    ln -s "/usr/share/webapps/$pkgname/config/includes/nginx_vhost_common.conf" "$pkgdir/usr/share/webapps/$pkgname/config/includes/nginx_advanced_include.conf"
    ln -s "/usr/share/webapps/$pkgname/config/includes/nginx_vhost_common.conf" "$pkgdir/usr/share/webapps/$pkgname/config/includes/nginx_simple_include.conf"

    chown -R http:http "$pkgdir/etc/drush" "$pkgdir/usr/share/webapps/$pkgname" "$pkgdir/var/spool/cron/$pkgname"
}
