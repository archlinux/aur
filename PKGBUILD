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

pkgname=zoneminder
pkgver=1.36.24
pkgrel=1
pkgdesc='A full-featured, open source, state-of-the-art video surveillance software system'
arch=('any')
url='https://www.zoneminder.com/'
license=('GPL2')
depends=('polkit' 'ffmpeg'
         'php-fpm' 'php-gd' 'php-intl'
         'perl-archive-zip' 'perl-data-dump' 'perl-date-manip' 'perl-datetime' 'perl-dbd-mysql' 'perl-device-serialport' 'perl-file-slurp'
         'perl-image-info' 'perl-libwww' 'perl-mime-lite' 'perl-mime-tools' 'perl-net-sftp-foreign' 'perl-number-bytes-human' 'perl-php-serialization'
         'perl-sys-cpu' 'perl-sys-meminfo' 'perl-sys-mmap' 'perl-uri-encode'
         # Needed for ONVIF support
         'perl-data-uuid' 'perl-io-socket-multicast' 'perl-soap-wsdl' 'perl-xml-libxml' 'perl-xml-parser'
         # Needed for SSL support
         'perl-lwp-protocol-https'
         # Needed for Telemetry support
         'perl-json-maybexs'         
         # Needed for encryption
         'perl-crypt-eksblowfish' 'perl-data-entropy'
         )
makedepends=('cmake')
optdepends=('mariadb'
            'apache'
            'nginx'
            'fcgiwrap: required if using nginx'
            'spawn-fcgi: required if using nginx'
            'multiwatch: required if using nginx'
            'pod2man: required for Docker support'
            'zmeventnotification: machine learning powered recognition engine & event notification server'
            'vlc: provides libvlc, which may achieve better performance with some camera models'
            'libvncserver')
conflicts=('zoneminder-git')
backup=("etc/nginx/sites-available/${pkgname}.conf"
        "etc/httpd/conf/extra/${pkgname}.conf"
        "etc/php/conf.d/${pkgname}.ini")
install=${pkgname}.install
source=("https://github.com/ZoneMinder/zoneminder/archive/refs/tags/${pkgver}.tar.gz"
        'https://github.com/ZoneMinder/CakePHP-Enum-Behavior/archive/refs/tags/1.0-zm.tar.gz'
        'https://github.com/FriendsOfCake/crud/archive/refs/tags/v3.2.0.tar.gz'
        'https://github.com/ZoneMinder/RtspServer/archive/refs/heads/master.zip'
        'zoneminder-nginx.conf'
        'zoneminder-httpd.conf'
        'zoneminder-php.ini'
        'fcgiwrap-multiwatch.service')
sha256sums=('dcecc2e4708e7066902edd188c8a5d653ffdee05abbb24f574c04241b9116342'
            'dbd231e97b950c698f0f501d6a53c7291c9985e766b09e3afe00cfe69a969f44'
            '55be29e1eccb44d4ad0db8b23c37cec50f5341f8e498583d472ed1f0493876e3'
            'SKIP'
            'c60e855428a56cc327214aa13d02a70011bf3b63a94a0d845b1c5ea1fab28ad2'
            '1f0d2276861065caf0b6c030ba27a6edb6a2988c7a1ac0fdf4e8fcb856972715'
            '0ed914327b3b1b76086510c67360663bb2182db022787e86318b1cfac2195e8d'
            'e95f9bef77aef647dd633bd9ad75dc099b6d7184684e133f2f20702de83a6260')

prepare () {
    cd ${pkgname}-${pkgver}

    # Fix the launcher
    sed -i 's|localhost/zm|localhost:8095|g' misc/${pkgname}.desktop.in

    # Tweak the systemd service file
    sed -i 's|After=network.target mysqld.service httpd.service|After=network.target mysqld.service httpd.service nginx.service|g' misc/${pkgname}.service.in
    sed -i 's|Requires=mysqld.service httpd.service|Wants=mysqld.service httpd.service nginx.service|g' misc/${pkgname}.service.in

    # Move third-party plugins into place
    mv ../CakePHP-Enum-Behavior-1.0-zm/* web/api/app/Plugin/CakePHP-Enum-Behavior
    mv ../crud-3.2.0/* web/api/app/Plugin/Crud
    mv ../RtspServer-master/* dep/RtspServer

}

build() {
    cd ${pkgname}-${pkgver}

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DZM_CONFIG_DIR=/etc/${pkgname} \
          -DZM_CONFIG_SUBDIR=/etc/${pkgname}/conf.d \
          -DZM_RUNDIR=/run/${pkgname} \
          -DZM_SOCKDIR=/run/${pkgname} \
          -DZM_LOGDIR=/var/log/${pkgname} \
          -DZM_TMPDIR=/var/tmp/${pkgname} \
          -DZM_CONTENTDIR=/var/lib/${pkgname} \
          -DZM_CACHEDIR=/var/lib/${pkgname}/cache \
          -DZM_WEBDIR=/usr/share/webapps/${pkgname}/www \
          -DZM_CGIDIR=/usr/share/webapps/${pkgname}/cgi-bin \
          -DZM_WEB_USER=http .

    make
}

package() {
    cd ${pkgname}-${pkgver}

    make DESTDIR=${pkgdir} install

    # Set Polkit directory permissions in accordance with Arch policy
    chmod 750                                                   ${pkgdir}/usr/share/polkit-1/rules.d
    chown root:polkitd                                          ${pkgdir}/usr/share/polkit-1/rules.d

    # Create ZM_LOGDIR
    install -dm755 -o http -g http                              ${pkgdir}/var/log/${pkgname}

    # Create ZM_CONTENTDIR and its subfolders
    install -dm775 -o http -g http                              ${pkgdir}/var/lib/${pkgname}/{cache,events,images}

    # Link ZM_CGIDIR and ZM_CACHEDIR inside ZM_WEBDIR and set correct permissions
    ln -sf /usr/share/webapps/${pkgname}/cgi-bin                ${pkgdir}/usr/share/webapps/${pkgname}/www
    ln -sf /var/lib/${pkgname}/cache                            ${pkgdir}/usr/share/webapps/${pkgname}/www
    chown -Rh http:http                                         ${pkgdir}/usr/share/webapps/${pkgname}

    # Link ZM_WEBDIR/api/app/tmp to ZM_TMPDIR
    ln -sf /var/tmp/${pkgname}                                  ${pkgdir}/usr/share/webapps/${pkgname}/www/api/app/tmp

    # Temporary fix for hardcoded /zm/ links (credit goes to @Kubax on AUR)
    ln -sf /usr/share/webapps/${pkgname}/www                    ${pkgdir}/usr/share/webapps/${pkgname}/www/zm

    # Set correct permissions for ZM_CONFIG_DIR & ZM_CONFIG_SUBDIR
    chmod -R 755                                                ${pkgdir}/etc/${pkgname}
    chmod 644                                                   ${pkgdir}/etc/${pkgname}/zm.conf
    chmod 644                                                   ${pkgdir}/etc/${pkgname}/conf.d/*

    # Nginx
    install -Dm644 $srcdir/${pkgname}-nginx.conf                ${pkgdir}/etc/nginx/sites-available/${pkgname}.conf

    # Apache
    install -Dm644 $srcdir/${pkgname}-httpd.conf                ${pkgdir}/etc/httpd/conf/extra/${pkgname}.conf

    # php.ini extension
    install -Dm644 $srcdir/${pkgname}-php.ini                   ${pkgdir}/etc/php/conf.d/${pkgname}.ini

    # fcgiwrap-multiwatch service
    install -Dm644 $srcdir/fcgiwrap-multiwatch.service          ${pkgdir}/usr/lib/systemd/system/fcgiwrap-multiwatch.service

    # systemd service
    install -Dm644 misc/${pkgname}.service                      ${pkgdir}/usr/lib/systemd/system/${pkgname}.service

    # systemd tmpfile
    install -Dm644 misc/${pkgname}-tmpfiles.conf                ${pkgdir}/usr/lib/tmpfiles.d/${pkgname}.conf

    # logrotate conf file
    install -Dm644 misc/logrotate.conf                          ${pkgdir}/etc/logrotate.d/${pkgname}

    # database schemas
    install -Dm644 db/zm*.sql                                   ${pkgdir}/usr/share/${pkgname}/db
}
