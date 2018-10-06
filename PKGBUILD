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



### Important notes for version 1.32.x ###
#
# 1) git-clone for CakePHP and Crud sources was replaced with published precompiled packages, as follows:
# - CakePHP-Enum-Behaviour is pulled from the ZoneMinder repo, because a change is needed that has not yet been merged upstream.
# - Crud is pulled from its official repo, since Pull Request #582 has been merged as required by the ZoneMinder devs.
#
# 2) By default, ZoneMinder now runs at localhost:8095 instead of localhost/zm (this can be changed by editing the provided conf files).
#
# 3) Apache was switched out in favor of Nginx, but remains as an optional dependency.
#
# 4) Nginx and MariaDB are hard-coded as dependencies, but can be easily removed in order to achieve a web server agnostic and/or database-less PKGBUILD.


#######################################################################################################################
#                                                                                                                     #
#  If you're upgrading from v1.30.4 or earlier:                                                                       #
#                                                                                                                     #
#  Due to the many breaking changes in this release (both upstream and in the packaging), it's recommended to backup  #
#  any existing ZoneMinder databases and perform a clean installation. Failure to do so may have very weird results.  #
#                                                                                                                     #
#######################################################################################################################



pkgname=zoneminder
pkgver=1.32.1
pkgrel=3
pkgdesc='A full-featured, open source, state-of-the-art video surveillance software system.'
arch=('x86_64')
url='https://zoneminder.com/'
license=('GPLv2')
depends=('polkit' 'ffmpeg' 'libmp4v2'
         # Remove the following line if you want to install ZoneMinder without a local database server, e.g. as part of a Multi-Server setup
         'mariadb'
         # Remove the following line if you don't need Nginx
         'nginx-mainline' 'fcgiwrap'
         'php-apcu' 'php-fpm' 'php-gd'
         'perl-archive-zip' 'perl-data-dump' 'perl-date-manip' 'perl-dbd-mysql' 'perl-device-serialport' 'perl-file-slurp' 'perl-image-info'
         'perl-json-any' 'perl-libwww' 'perl-mime-lite' 'perl-mime-tools' 'perl-number-bytes-human' 'perl-sys-meminfo' 'perl-sys-mmap'
         # Needed for ONVIF support
         'perl-class-load' 'perl-data-uuid' 'perl-io-socket-multicast' 'perl-soap-wsdl' 'perl-xml-parser'
         # Needed for SSL support
         'perl-lwp-protocol-https'
         # Apparently needed for Telemetry support
         'perl-json-maybexs'
         # Unverified dependencies. So far not installing them hasn't raised any red flags, but I can't be 100% sure whether they're leftovers from previous ZoneMinder incarnations or if they're needed for proper operation during runtime, so for the time being I'm leaving them in.
         'perl-net-sftp-foreign' 'perl-php-serialization' 'perl-sys-cpu' 'perl-uri-encode')
makedepends=('cmake')
optdepends=('apache: alternative web server'
            'vlc: provides libvlc (may achieve better performance with some cameras)'
            'ffmpeg-full: provides libavresample (dropped from the official ffmpeg package)')
conflicts=('zoneminder-git')
backup=("etc/nginx/sites-available/$pkgname.conf"
        "etc/httpd/conf/extra/$pkgname.conf")
install=$pkgname.install
source=("https://github.com/ZoneMinder/ZoneMinder/archive/$pkgver.tar.gz"
        "https://github.com/FriendsOfCake/crud/archive/v3.2.0.tar.gz"
        "https://github.com/ZoneMinder/CakePHP-Enum-Behavior/archive/1.0-zm.tar.gz"
        "zoneminder-nginx.conf"
        "zoneminder-httpd.conf"
        "zoneminder-php.ini"
        "zoneminder.service"
        "zoneminder-tmpfile.conf")
sha256sums=('a10c0c416e2127111b4d72f0046ed3a1f56708e3f4b48680848d755b01811d3c'
            '55be29e1eccb44d4ad0db8b23c37cec50f5341f8e498583d472ed1f0493876e3'
            'dbd231e97b950c698f0f501d6a53c7291c9985e766b09e3afe00cfe69a969f44'
            # zoneminder-nginx.conf
            '7b14652fa05ed07043abb082ab699b36ea76c5bfc0fb6fbc4418cbd66e4e3181'
            # zoneminder-httpd.conf
            '1944e27db3b17edac152209b2b35e914ed9700a2ffe0255b012661197a328178'
            # zoneminder-php.ini
            '7905ceddbb049de0f9bf4f1eb58779dfe310a65c4d2ec44854d592d4f31b6a72'
            # zoneminder.service
            '3e4de227e3154dffa887f2286c339ab3cf456f6d74a400b2786192b7e2b129c0'
            # zoneminder-tmpfile.conf
            'd1341338538f2ac771e6b1eee9aa48e8b0da4a140024c74bc33a9f6b52443bdd')

prepare () {
    cd $pkgname-$pkgver
    
    # Move extra PHP plugins into place
    cp -R $srcdir/crud-3.2.0/*                          web/api/app/Plugin/Crud
    cp -R $srcdir/CakePHP-Enum-Behavior-1.0-zm/*        web/api/app/Plugin/CakePHP-Enum-Behavior
    
    # Fix the launcher
    sed -i 's|localhost/zm|localhost:8095|g' misc/$pkgname.desktop.in
}

build() {
    cd $pkgname-$pkgver
   
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DZM_CONFIG_DIR=/etc/$pkgname \
          -DZM_CONFIG_SUBDIR=/etc/$pkgname/conf.d \
          -DZM_RUNDIR=/run/$pkgname \
          -DZM_SOCKDIR=/run/$pkgname \
          -DZM_LOGDIR=/var/log/$pkgname \
          -DZM_CONTENTDIR=/var/lib/$pkgname \
          -DZM_CACHEDIR=/var/lib/$pkgname/cache \
          -DZM_TMPDIR=/var/lib/$pkgname/temp \
          -DZM_WEBDIR=/srv/$pkgname/www \
          -DZM_CGIDIR=/srv/$pkgname/cgi-bin \
          -DZM_WEB_USER=http .

    make
}
     
package() {
    cd $pkgname-$pkgver

    make DESTDIR=$pkgdir install
    
    # Set Polkit directory permissions in accordance with Arch policy
    chmod 750                           $pkgdir/usr/share/polkit-1/rules.d
    chown root:polkitd                  $pkgdir/usr/share/polkit-1/rules.d
    
    # Create ZM_LOGDIR
    install -dm775 -o http -g http      $pkgdir/var/log/$pkgname
    
    # Create ZM_CONTENTDIR and its subfolders
    install -dm775 -o http -g http      $pkgdir/var/lib/$pkgname/{cache,events,images,temp}
    
    # Run script provided by upstream to create and/or link the needed folders with proper permissions
    ./zmlinkcontent.sh -z $pkgdir/etc/$pkgname/zm.conf -w $pkgdir/srv/$pkgname/www -l $pkgdir/var/log/$pkgname -t $pkgdir/var/lib/$pkgname/temp $pkgdir/var/lib/$pkgname
    
    # Link ZM_CGIDIR and ZM_CACHEDIR inside ZM_WEBDIR and set correct permissions
    ln -s /srv/$pkgname/cgi-bin         $pkgdir/srv/$pkgname/www
    ln -s /var/lib/$pkgname/cache       $pkgdir/srv/$pkgname/www
    chown -Rh http:http                 $pkgdir/srv/$pkgname
    
    # Set correct permissions for ZM_CONFIG_DIR & ZM_CONFIG_SUBDIR
    chmod -R 755                        $pkgdir/etc/$pkgname
    chmod 644                           $pkgdir/etc/$pkgname/zm.conf
    chmod 644                           $pkgdir/etc/$pkgname/conf.d/*

    # Install Nginx conf file
    install -Dm644 $srcdir/$pkgname-nginx.conf       $pkgdir/etc/nginx/sites-available/$pkgname.conf    
    
    # Install Apache conf file
    install -Dm644 $srcdir/$pkgname-httpd.conf       $pkgdir/etc/httpd/conf/extra/$pkgname.conf
    
    # Install PHP-FPM ini file
    install -Dm644 $srcdir/$pkgname-php.ini          $pkgdir/etc/php/conf.d/$pkgname.ini
    
    # Install systemd service
    install -Dm644 $srcdir/$pkgname.service          $pkgdir/usr/lib/systemd/system/$pkgname.service
    
    # Install systemd tmpfile
    install -Dm644 $srcdir/$pkgname-tmpfile.conf     $pkgdir/usr/lib/tmpfiles.d/$pkgname.conf
    
    # Install logrotate conf file
    install -Dm644 misc/logrotate.conf               $pkgdir/etc/logrotate.d/$pkgname

    # Copy license and database schemas
    install -Dm644 COPYING                           $pkgdir/usr/share/licenses/$pkgname/LICENSE
    install -Dm644 db/zm*.sql                        $pkgdir/usr/share/$pkgname/db
}
