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
options=(emptydirs)
install=$pkgname.install
source=(
    "msmtprc.$pkgname"
    'nginx.conf'
    'nginx.svc.conf'
    "$pkgname.ini"
    'sudoers'
    "$pkgname.service"
    "$pkgname.target"
)
md5sums=('d43026960060bc677549baa26a24c9ee'
         '829ac9283a168f796354e78e8bc8e496'
         '86395485765bb73ae09d28e0d7101613'
         '879237d0ca0dc54d5cdb4307adb40005'
         'cb3462fda27156851badf51d5a0595ae'
         '25414ba4e4bd50f31286db9a349afa4d'
         '5020ae6d02a9796e979d1619a9a02957')

#~ pkgver() {
    #~ echo \
      #~ $(drush rl --fields=version --field-labels=0 provision | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' ') \
      #~ $(drush rl --fields=version --field-labels=0 hostmaster | sort | grep -v 'dev' | tail -n1 | tr '-' '_' | tr -d ' ') \
      #~ | tr ' ' $'\n' | sort -ur | head -n1
#~ }

prepare() {
    for extension in gd pdo_mysql; do
        echo -e "; Required extension for $pkgname\nextension=$extension.so" >| "$extension.$pkgname.ini"
    done
}

package() {
    msg2 'Adding config files'
    install -dm750                  "$pkgdir/etc/sudoers.d"
    install -Dm440 sudoers          "$pkgdir/etc/sudoers.d/$pkgname"
    install -Dm644 nginx.conf       "$pkgdir/etc/nginx/$pkgname.conf"
    install -Dm644 "$pkgname.ini"   "$pkgdir/etc/php/conf.d/$pkgname.ini"
    install -Dm644 "msmtprc.$pkgname" "$pkgdir/etc/msmtprc.$pkgname"
    install -Dm644 <( ) "$pkgdir/var/spool/cron/$pkgname"
    for extension in gd pdo_mysql; do
      install -Dm644 $extension.$pkgname.ini "$pkgdir/etc/php/conf.d/$extension.$pkgname.ini"
    done

    msg2 'Adding systemd files'
    install -Dm644 nginx.svc.conf   "$pkgdir/usr/lib/systemd/system/nginx.service.d/$pkgname.conf"
    install -Dm644 "$pkgname.service"  "$pkgdir/usr/lib/systemd/system/$pkgname.service"
    install -Dm644 "$pkgname.target" "$pkgdir/usr/lib/systemd/system/$pkgname.target"

    msg2 'Creating $pkgname directory structure'
    mkdir -p "$pkgdir/var/lib/$pkgname"
    ln -s /etc/drush "$pkgdir/var/lib/$pkgname/.drush"
    umask 077
    mkdir -p "$pkgdir/var/lib/$pkgname/"{backups,clients/admin,config/{includes,self,server_master/nginx/{platform,post,pre,subdir,platform,vhost}.d}}
    umask 022
    mkdir -p "$pkgdir/var/lib/$pkgname/"{,config{includes,self,server_localhost,server_master/nginx}}

    ln -s "/var/lib/$pkgname/config/server_master/nginx.conf"         "$pkgdir/var/lib/$pkgname/config/nginx.conf"
    ln -s "/var/lib/$pkgname/config/includes/nginx_vhost_common.conf" "$pkgdir/var/lib/$pkgname/config/includes/nginx_advanced_include.conf"
    ln -s "/var/lib/$pkgname/config/includes/nginx_vhost_common.conf" "$pkgdir/var/lib/$pkgname/config/includes/nginx_simple_include.conf"

    chown -R 696:http "$pkgdir/var/lib/$pkgname" "$pkgdir/var/spool/cron/$pkgname"
}
