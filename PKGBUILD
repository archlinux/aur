# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Mesmer <mesmer@fisica.if.uff.br>
# Contributor: Troy Will <troydwill at gmail dot com>
# Contributor: /dev/rs0                  </dev/rs0@secretco.de.com>
# Contributor: Jacek Burghardt           <jacek@hebe.us>
# Contributor: Vojtech Aschenbrenner     <v@asch.cz>
# Contributor: Jason Gardner             <buhrietoe@gmail.com>
# Contributor: Ross melin                <rdmelin@gmail.com>
# Contributor: (Parabola): Márcio Silva   <coadde@lavabit.com>
# Contributor: (Parabola): André Silva    <emulatorman@lavabit.com>
# Contributor: Charles Spence IV         <cspence@unomaha.edu>
# Contributor: Joe Julian                <me@joejulian.name>
# Orginally based on a Debian Squeeze package
# Update to 1.33.15 - based on https://aur.archlinux.org/packages/zoneminder/ by Alexandros Michalopoulos (Nocifer)

### Important notes for version 1.32.x ###
#
# 1) git-clone for CakePHP and Crud sources was replaced with published precompiled packages, as follows:
# - CakePHP-Enum-Behaviour is pulled from the ZoneMinder repo, because a change is needed that has not yet been merged upstream.
# - Crud is pulled from its official repo, since Pull Request #582 has been merged as required by the ZoneMinder devs.
#
# 2) By default, ZoneMinder now runs at localhost:8095 instead of localhost/zm (this can be changed by editing the provided conf files).
#
# 3) Apache was switched out in favor of Nginx, but remains as an optional dependency.

#######################################################################################################################
#                                                                                                                     #
#  If you're upgrading from a release older than 1.32.0:                                                              #
#                                                                                                                     #
#  Due to the many breaking changes in new releases (both upstream and in the packaging), it's recommended to backup  #
#  any existing ZoneMinder databases and perform a clean installation. Failure to do so may have very weird results.  #
#                                                                                                                     #
#######################################################################################################################

pkgname=zoneminder-git
_pkgname=zoneminder
pkgver=1.33.15.r14276.5e4c3e1ed
pkgrel=3
pkgdesc='A complete surveillance solution allowing capture, analysis, recording and monitoring of any CCTV or security cameras'
arch=('x86_64')
url='https://github.com/ZoneMinder/ZoneMinder'
license=('GPL2')
depends=('polkit' 'ffmpeg' 'libmp4v2'
         'php-apcu' 'php-fpm' 'php-gd'
         'perl-archive-zip' 'perl-data-dump' 'perl-date-manip' 'perl-dbd-mysql' 'perl-device-serialport' 'perl-file-slurp' 'perl-image-info'
         'perl-libwww' 'perl-mime-lite' 'perl-mime-tools' 'perl-number-bytes-human' 'perl-sys-meminfo' 'perl-sys-mmap'
         #Needed for upgrade with zmupdate.pl
         'perl-crypt-eksblowfish' 'perl-data-entropy'
         # Needed for ONVIF support
         'perl-class-load' 'perl-data-uuid' 'perl-io-socket-multicast' 'perl-soap-wsdl' 'perl-xml-parser' 'perl-datetime'
         # Needed for SSL support
         'perl-lwp-protocol-https'
         # Apparently needed for Telemetry support
         'perl-json-maybexs'
         # Unverified dependencies. So far not installing them hasn't raised any red flags, but I can't be 100% sure whether they're leftovers from
         # previous ZoneMinder incarnations or if they're needed for proper operation during runtime, so for the time being I'm leaving them in.
         'perl-net-sftp-foreign' 'perl-php-serialization' 'perl-sys-cpu' 'perl-uri-encode'
         # Remove the following line if you don't need Nginx
         'nginx-mainline' 'fcgiwrap' 'spawn-fcgi' 'multiwatch'
         # Remove the following line if you don't need MariaDB
         'mariadb'
)

makedepends=('cmake')
optdepends=('apache: alternative web server'
            'vlc: provides libvlc (may achieve better performance with some camera models)')
conflicts=('zoneminder')
backup=("etc/nginx/sites-available/$_pkgname.conf"
        "etc/httpd/conf/extra/$_pkgname.conf"
        "etc/php/conf.d/$_pkgname.ini")
install=$_pkgname.install
source=("git://github.com/$_pkgname/$_pkgname.git"
        "https://github.com/FriendsOfCake/crud/archive/v3.2.0.tar.gz"
        "https://github.com/ZoneMinder/CakePHP-Enum-Behavior/archive/1.0-zm.tar.gz"
        "zoneminder-nginx.conf"
        "zoneminder-httpd.conf"
        "zoneminder-php.ini"
        "zoneminder.service"
        "zoneminder-tmpfile.conf"
        "fcgiwrap-multiwatch.service"
)
sha256sums=('SKIP'
            '55be29e1eccb44d4ad0db8b23c37cec50f5341f8e498583d472ed1f0493876e3'
            'dbd231e97b950c698f0f501d6a53c7291c9985e766b09e3afe00cfe69a969f44'
            'f176e0262e3ad0a93b73760ba01eee47f97b3e51c58ebbd82c0dc31eadafc274'
            '091b9167cb381b8a81c57dfd19f68e35b7319ed1f7a41814daa2a26d97776c6b'
            'c02653c52acb790a95d4d28166a087077eb25ae2921590c890247c0396f13b62'
            '3e4de227e3154dffa887f2286c339ab3cf456f6d74a400b2786192b7e2b129c0'
            'b69ac1deaaf3cf84b4ae4dbab794e1b062823de817f1e3a816ccf5438db440c0'
            'e95f9bef77aef647dd633bd9ad75dc099b6d7184684e133f2f20702de83a6260')

pkgver() {
    cd "$_pkgname"
    printf $(<version) && printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare () {
    cd $_pkgname

    # Move extra PHP plugins into place
    cp -R $srcdir/crud-3.2.0/*                          web/api/app/Plugin/Crud
    cp -R $srcdir/CakePHP-Enum-Behavior-1.0-zm/*        web/api/app/Plugin/CakePHP-Enum-Behavior

    # Fix the launcher
    sed -i 's|localhost/zm|localhost:8095|g' misc/$_pkgname.desktop.in
}

build() {
    cd $_pkgname
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DZM_CONFIG_DIR=/etc/$_pkgname \
          -DZM_CONFIG_SUBDIR=/etc/$_pkgname/conf.d \
          -DZM_RUNDIR=/run/$_pkgname \
          -DZM_SOCKDIR=/run/$_pkgname \
          -DZM_LOGDIR=/var/log/$_pkgname \
          -DZM_TMPDIR=/var/tmp/$_pkgname \
          -DZM_CONTENTDIR=/var/lib/$_pkgname \
          -DZM_CACHEDIR=/var/lib/$_pkgname/cache \
          -DZM_WEBDIR=/srv/$_pkgname/www \
          -DZM_CGIDIR=/srv/$_pkgname/cgi-bin \
          -DZM_WEB_USER=http .
    make -j$(nproc)
}
     
package() {
    cd $_pkgname

    make DESTDIR=$pkgdir install

    # Set Polkit directory permissions in accordance with Arch policy
    chmod 750                           $pkgdir/usr/share/polkit-1/rules.d
    chown root:polkitd                  $pkgdir/usr/share/polkit-1/rules.d

    # Create ZM_LOGDIR
    install -dm775 -o http -g http      $pkgdir/var/log/$_pkgname

    # Create ZM_CONTENTDIR and its subfolders
    install -dm775 -o http -g http      $pkgdir/var/lib/$_pkgname/{cache,events,images}
    
    # Link ZM_CGIDIR and ZM_CACHEDIR inside ZM_WEBDIR and set correct permissions
    ln -sf /srv/$_pkgname/cgi-bin        $pkgdir/srv/$_pkgname/www
    ln -sf /var/lib/$_pkgname/cache      $pkgdir/srv/$_pkgname/www
    chown -Rh http:http                 $pkgdir/srv/$_pkgname

    # Link ZM_WEBDIR/api/app/tmp to ZM_TMPDIR
    ln -sf /var/tmp/$_pkgname            $pkgdir/srv/$_pkgname/www/api/app/tmp
    
    # Temporary fix for hardcoded /zm/ links (credit goes to @Kubax on AUR)
    ln -sf /srv/$_pkgname/www            $pkgdir/srv/$_pkgname/www/zm
    
    # Set correct permissions for ZM_CONFIG_DIR & ZM_CONFIG_SUBDIR
    chmod -R 755                        $pkgdir/etc/$_pkgname
    chmod 644                           $pkgdir/etc/$_pkgname/zm.conf
    chmod 644                           $pkgdir/etc/$_pkgname/conf.d/*

    # Install Nginx conf file
    install -Dm644 $srcdir/$_pkgname-nginx.conf              $pkgdir/etc/nginx/sites-available/$_pkgname.conf

    # Install Apache conf file
    install -Dm644 $srcdir/$_pkgname-httpd.conf              $pkgdir/etc/httpd/conf/extra/$_pkgname.conf

    # Install PHP-FPM ini file
    install -Dm644 $srcdir/$_pkgname-php.ini                 $pkgdir/etc/php/conf.d/$_pkgname.ini

    # Install systemd service
    install -Dm644 $srcdir/$_pkgname.service                 $pkgdir/usr/lib/systemd/system/$_pkgname.service

    # Install systemd tmpfile
    install -Dm644 $srcdir/$_pkgname-tmpfile.conf            $pkgdir/usr/lib/tmpfiles.d/$_pkgname.conf

    # Install fcgiwrap-multiwatch service
    install -Dm644 $srcdir/fcgiwrap-multiwatch.service      $pkgdir/usr/lib/systemd/system/fcgiwrap-multiwatch.service

    # Install logrotate conf file
    install -Dm644 misc/logrotate.conf                      $pkgdir/etc/logrotate.d/$_pkgname

    # Copy default database schemas
    install -Dm644 db/zm*.sql                               $pkgdir/usr/share/$_pkgname/db
}
