# Maintainer: Nocifer <apmichalopoulos at gmail dot com>
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

pkgname=zoneminder
pkgver=1.36.35
pkgrel=1
pkgdesc='A full-featured, open source, state-of-the-art video surveillance software system'
arch=('any')
url='https://zoneminder.com/'
license=('GPL-2.0-only')
depends=('polkit' 'ffmpeg'
         'php-apcu' 'php-fpm' 'php-gd'
         'perl-archive-zip' 'perl-data-dump' 'perl-date-manip' 'perl-datetime' 'perl-dbd-mysql' 'perl-device-serialport' 'perl-file-slurp'
         'perl-image-info' 'perl-libwww' 'perl-mime-lite' 'perl-mime-tools' 'perl-net-sftp-foreign' 'perl-number-bytes-human' 'perl-php-serialization'
         'perl-sys-cpu' 'perl-sys-meminfo' 'perl-sys-mmap' 'perl-uri-encode'
         # ONVIF
         'perl-data-uuid' 'perl-io-interface' 'perl-io-socket-multicast' 'perl-soap-wsdl' 'perl-xml-libxml' 'perl-xml-parser'
         # TLS
         'perl-lwp-protocol-https'
         # Telemetry
         'perl-json-maybexs'
         # Encryption
         'perl-crypt-eksblowfish' 'perl-data-entropy'
         # JSON Web Token API
         'libjwt')
makedepends=('cmake')
optdepends=('mariadb'
            'apache'
            'nginx'
            'fcgiwrap: required if using nginx'
            'spawn-fcgi: required if using nginx'
            'multiwatch: required if using nginx'
            'pod2man: required for Docker support'
            'zmeventnotification: machine learning-powered recognition engine & event notification server'
            'vlc: may achieve better performance than FFmpeg with some camera models'
            'libvncserver: allows for CCTV-like monitoring of remote desktop sessions')
backup=("etc/nginx/sites-available/${pkgname}.conf"
        "etc/httpd/conf/extra/${pkgname}.conf"
        "etc/php/conf.d/${pkgname}.ini")
install=${pkgname}.install
source=("https://github.com/ZoneMinder/zoneminder/archive/refs/tags/${pkgver}.tar.gz"
        'https://github.com/ZoneMinder/CakePHP-Enum-Behavior/archive/refs/tags/1.0-zm.tar.gz'
        'https://github.com/FriendsOfCake/crud/archive/refs/tags/v3.2.0.tar.gz'
        'https://github.com/ZoneMinder/RtspServer/archive/055d81fe1293429e496b19104a9ed3360755a440.zip'
        'zoneminder-nginx.conf'
        'zoneminder-httpd.conf'
        'zoneminder-php.ini'
        'fcgiwrap-multiwatch.service')
sha256sums=('c3636ded4e0e5c5c62535c55153371212a379dbb1aed8c911bd6287721c3d49a'
            'dbd231e97b950c698f0f501d6a53c7291c9985e766b09e3afe00cfe69a969f44'
            '55be29e1eccb44d4ad0db8b23c37cec50f5341f8e498583d472ed1f0493876e3'
            'fad0f1646f65f1518dfde3390e6c907319bc67b61f2e04f5d5ac4144ab61131d'
            '92803838896f045612cdb88807763ff446f38f8bb136712429daeb2e3848fa0f'
            '62a3a907f48441cc40743d5b6957c727e90a34b310c6cad4b5344c91a8971e67'
            '8e1131dd6bf3796f5bcc9422c96ef77388d7ab0d8e8fc17f6b8dd1e8acc2442a'
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
    mv ../RtspServer-055d81fe1293429e496b19104a9ed3360755a440/* dep/RtspServer
}

build() {
    cd ${pkgname}-${pkgver}

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DLIBJWT_LIBRARY=/usr/lib/libjwt.so \
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

    cmake --build .
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

    # Fix for hardcoded /zm/ links (credit goes to @Kubax on AUR)
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
