# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
# Contributor: Mesmer <mesmer@fisica.if.uff.br>
# Contributor: Troy Will <troydwill at gmail dot com>
# Contributor: /dev/rs0                  </dev/rs0@secretco.de.com>
# Contributor: Jacek Burghardt           <jacek@hebe.us>
# Contributor: Vojtech Aschenbrenner     <v@asch.cz>
# Contributor: Jason Gardner             <buhrietoe@gmail.com>
# Contributor: Ross melin                <rdmelin@gmail.com>
# Contributor (Parabola): Márcio Silva   <coadde@lavabit.com>
# Contributor (Parabola): André Silva    <emulatorman@lavabit.com>
# Contributor: Charles Spence IV         <cspence@unomaha.edu>
# Contributor: Joe Julian                <me@joejulian.name>     
# Orginally based on a Debian Squeeze package




### Important notes for version 1.34.x ###
#
#   1) From now on, this package will only install ZoneMinder itself. In other words, this means that after the setup is complete, ZoneMinder
#   will NOT be fully deployed and thus will NOT be able to function properly without manual intervention.
#
#   As a bare minimum, on a fresh install you will also need to at least install and configure a MySQL-compatible server and a web server, as well
#   as perform some other small tweaks needed to finalize the setup (e.g. you will need to refresh systemd's tmpfiles and, if you'll be using Nginx,
#   you will also need to install and configure fcgiwrap, spawn-fcgi and multiwatch).
#
#   For more detailed info on how to configure ZoneMinder, you should check the following links:
#
#   * https://wiki.archlinux.org/index.php/ZoneMinder
#   * https://zoneminder.readthedocs.io/en/latest/
#
#   Also, a separate script (zmsetup.sh) is now provided to help with automating the above procedure, if so desired.
#
#   2) As an extension to the above, there is now no hard dependency on either Apache, Nginx or MariaDB.
#
#   3) ZoneMinder's webroot has been relocated from /srv/zoneminder to /usr/share/webapps/zoneminder. The default configuration files have
#   been adjusted for this change, but if you've ever manually edited your local copies then they will not be automatically overwritten with the new
#   versions, which means updating to 1.34 will probably break your existing setup. Do look for any rogue .pacsave files in /etc after you update!
#
#   Bug reports and packaging suggestions are always welcome at https://aur.archlinux.org/packages/zoneminder/




pkgname=zoneminder
pkgver=1.34.7
pkgrel=1
pkgdesc='A full-featured, open source, state-of-the-art video surveillance software system'
arch=('any')
url='https://www.zoneminder.com/'
license=('GPL2')
depends=('polkit' 'ffmpeg' 'libmp4v2'
         'php-apcu' 'php-fpm' 'php-gd'
         'perl-archive-zip' 'perl-data-dump' 'perl-date-manip' 'perl-datetime' 'perl-dbd-mysql' 'perl-device-serialport' 'perl-file-slurp'
         'perl-image-info' 'perl-libwww' 'perl-mime-lite' 'perl-mime-tools' 'perl-net-sftp-foreign' 'perl-number-bytes-human' 'perl-php-serialization'
         'perl-sys-cpu' 'perl-sys-meminfo' 'perl-sys-mmap' 'perl-uri-encode'
         # Needed for ONVIF support
         'perl-class-load' 'perl-data-uuid' 'perl-io-socket-multicast' 'perl-soap-wsdl' 'perl-xml-parser'
         # Needed for SSL support
         'perl-lwp-protocol-https'
         # Needed for Telemetry support
         'perl-json-maybexs'         
         # Needed for encryption
         'perl-crypt-eksblowfish' 'perl-data-entropy'
         )
makedepends=('cmake' 'git')
optdepends=('mariadb'
            'apache'
            'nginx'
            'fcgiwrap: required if using nginx'
            'spawn-fcgi: required if using nginx'
            'multiwatch: required if using nginx'
            'pod2man: required for Docker support'
            'zmeventnotification-git: machine learning powered recognition engine & event notification server'
            'vlc: provides libvlc, which may achieve better performance with some camera models')
conflicts=('zoneminder-git')
backup=("etc/nginx/sites-available/$pkgname.conf"
        "etc/httpd/conf/extra/$pkgname.conf"
        "etc/php/conf.d/$pkgname.ini")
install=$pkgname.install
source=("git+https://github.com/ZoneMinder/zoneminder.git#tag=$pkgver"
        "zoneminder-nginx.conf"
        "zoneminder-httpd.conf"
        "zoneminder-php.ini"
        "zoneminder.service"
        "zoneminder-tmpfile.conf"
        "fcgiwrap-multiwatch.service"
        "zmsetup.sh")
sha256sums=('SKIP'
            'c60e855428a56cc327214aa13d02a70011bf3b63a94a0d845b1c5ea1fab28ad2'
            '1f0d2276861065caf0b6c030ba27a6edb6a2988c7a1ac0fdf4e8fcb856972715'
            '2d7f5ac073687be75c7724b0acd3785d8c358e4f65341e60d39eb6006f31389b'
            '3e4de227e3154dffa887f2286c339ab3cf456f6d74a400b2786192b7e2b129c0'
            'b69ac1deaaf3cf84b4ae4dbab794e1b062823de817f1e3a816ccf5438db440c0'
            'e95f9bef77aef647dd633bd9ad75dc099b6d7184684e133f2f20702de83a6260'
            '255374c400e01c7666cc7b3e1f06da8445dc57afda631868d33ced62ba631c98')

prepare () {
    cd $pkgname
    
    # Download and move extra PHP plugins into place
    git submodule update --init --recursive
    
    # Fix the launcher
    sed -i 's|localhost/zm|localhost:8095|g' misc/$pkgname.desktop.in
}

build() {
    cd $pkgname
   
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DZM_CONFIG_DIR=/etc/$pkgname \
          -DZM_CONFIG_SUBDIR=/etc/$pkgname/conf.d \
          -DZM_RUNDIR=/run/$pkgname \
          -DZM_SOCKDIR=/run/$pkgname \
          -DZM_LOGDIR=/var/log/$pkgname \
          -DZM_TMPDIR=/var/tmp/$pkgname \
          -DZM_CONTENTDIR=/var/lib/$pkgname \
          -DZM_CACHEDIR=/var/lib/$pkgname/cache \
          -DZM_WEBDIR=/usr/share/webapps/$pkgname/www \
          -DZM_CGIDIR=/usr/share/webapps/$pkgname/cgi-bin \
          -DZM_WEB_USER=http .

    make
}
     
package() {
    cd $pkgname

    make DESTDIR=$pkgdir install
    
    # Set Polkit directory permissions in accordance with Arch policy
    chmod 750                                               $pkgdir/usr/share/polkit-1/rules.d
    chown root:polkitd                                      $pkgdir/usr/share/polkit-1/rules.d
    
    # Create ZM_LOGDIR
    install -dm755 -o http -g http                          $pkgdir/var/log/$pkgname
    
    # Create ZM_CONTENTDIR and its subfolders
    install -dm775 -o http -g http                          $pkgdir/var/lib/$pkgname/{cache,events,images}
    
    # Link ZM_CGIDIR and ZM_CACHEDIR inside ZM_WEBDIR and set correct permissions
    ln -sf /usr/share/webapps/$pkgname/cgi-bin              $pkgdir/usr/share/webapps/$pkgname/www
    ln -sf /var/lib/$pkgname/cache                          $pkgdir/usr/share/webapps/$pkgname/www
    chown -Rh http:http                                     $pkgdir/usr/share/webapps/$pkgname
    
    # Link ZM_WEBDIR/api/app/tmp to ZM_TMPDIR
    ln -sf /var/tmp/$pkgname                                $pkgdir/usr/share/webapps/$pkgname/www/api/app/tmp
    
    # Temporary fix for hardcoded /zm/ links (credit goes to @Kubax on AUR)
    ln -sf /usr/share/webapps/$pkgname/www                  $pkgdir/usr/share/webapps/$pkgname/www/zm
    
    # Set correct permissions for ZM_CONFIG_DIR & ZM_CONFIG_SUBDIR
    chmod -R 755                                            $pkgdir/etc/$pkgname
    chmod 644                                               $pkgdir/etc/$pkgname/zm.conf
    chmod 644                                               $pkgdir/etc/$pkgname/conf.d/*
    
    
    # Nginx conf file
    install -Dm644 $srcdir/$pkgname-nginx.conf              $pkgdir/etc/nginx/sites-available/$pkgname.conf    
    
    # Apache conf file
    install -Dm644 $srcdir/$pkgname-httpd.conf              $pkgdir/etc/httpd/conf/extra/$pkgname.conf
    
    # systemd service
    install -Dm644 $srcdir/$pkgname.service                 $pkgdir/usr/lib/systemd/system/$pkgname.service
    
    # systemd tmpfile
    install -Dm644 $srcdir/$pkgname-tmpfile.conf            $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
    
    # php.ini file
    install -Dm644 $srcdir/$pkgname-php.ini                 $pkgdir/etc/php/conf.d/$pkgname.ini
    
    # fcgiwrap-multiwatch service
    install -Dm644 $srcdir/fcgiwrap-multiwatch.service      $pkgdir/usr/lib/systemd/system/fcgiwrap-multiwatch.service
    
    # optional install script
    install -Dm755 $srcdir/zmsetup.sh                       $pkgdir/usr/bin/zmsetup.sh
    
    # logrotate conf file
    install -Dm644 misc/logrotate.conf                      $pkgdir/etc/logrotate.d/$pkgname

    # database schemas
    install -Dm644 db/zm*.sql                               $pkgdir/usr/share/$pkgname/db
}
