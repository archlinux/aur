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

_pkgname=zoneminder
pkgname=zoneminder-git
pkgver=1.37.63.r1552.ge0c5ea6
pkgrel=1
pkgdesc='A full-featured, open source, state-of-the-art video surveillance software system (git version)'
arch=('any')
url='https://zoneminder.com/'
license=('GPL-2.0-only')
depends=('ffmpeg' 'libvlc' 'polkit'
         'php-apcu' 'php-fpm' 'php-gd'
         'perl-archive-zip' 'perl-data-dump' 'perl-date-manip' 'perl-datetime' 'perl-dbd-mysql' 'perl-device-serialport' 'perl-file-slurp'
         'perl-image-info' 'perl-libwww' 'perl-mime-lite' 'perl-mime-tools' 'perl-net-sftp-foreign' 'perl-number-bytes-human' 'perl-php-serialization'
         'perl-sys-cpu' 'perl-sys-meminfo' 'perl-sys-mmap' 'perl-uri-encode'
         # ONVIF
         'gsoap' 'libvncserver' 'mosquitto' 'perl-data-uuid' 'perl-io-interface' 'perl-io-socket-multicast' 'perl-soap-wsdl' 'perl-xml-libxml' 'perl-xml-parser'
         # TLS
         'perl-lwp-protocol-https'
         # Telemetry
         'perl-json-maybexs'
         # Encryption
         'perl-crypt-eksblowfish' 'perl-data-entropy'
         # JSON Web Token API
         'nlohmann-json')
makedepends=('cmake' 'git')
optdepends=('mariadb'
            'apache'
            'nginx'
            'fcgiwrap: required if using nginx'
            'spawn-fcgi: required if using nginx'
            'multiwatch: required if using nginx'
            'pod2man: required for Docker support'
            'zmeventnotification: machine learning-powered recognition engine & event notification server')
conflicts=('zoneminder')
backup=("etc/nginx/sites-available/${_pkgname}.conf"
        "etc/httpd/conf/extra/${_pkgname}.conf"
        "etc/php/conf.d/${_pkgname}.ini")
install=${_pkgname}.install
source=("${pkgname}::git+https://github.com/ZoneMinder/zoneminder.git"
        'https://github.com/ZoneMinder/CakePHP-Enum-Behavior/archive/refs/tags/1.0-zm.tar.gz'
        'https://github.com/FriendsOfCake/crud/archive/refs/tags/v3.2.0.tar.gz'
        'https://github.com/ZoneMinder/RtspServer/archive/eab32851421ffe54fec0229c3efc44c642bc8d46.zip'
        'https://github.com/chmike/CxxUrl/archive/eaf46c0207df24853a238d4499e7f4426d9d234c.zip'
        'zoneminder-nginx.conf'
        'zoneminder-httpd.conf'
        'zoneminder-php.ini'
        'fcgiwrap-multiwatch.service')
b2sums=('SKIP'
        '7d5b18e1a7a21c967128745591870cd5bf5b380c55a62f7c465f7cf1fd718961fb392b5bc80c941bf9a9819e7c87829ca6217d19505c655ffdc859e50662659c'
        'a6d2c6960515f5b3402c306eb28710d00abce19d07a38a76a841928b69573cb30608f50e7ad458dd8771bb9267e56df68c1037019abb7b5eec4d990a33f9c234'
        '89f9aeb88d06cad19d1a6d9c223b8291ad486f605bc87d939120d64524a85f2d8a07a0f23c9877833a6fdf03da84b20394e4f2a61c742a6669b6fae03c8af599'
        '5e1078cc7de757a7ae6f24f7cc48998b9e46ec5836c591897f97160d5d916648151b07fdc31c8e453706cd5c882b2ac3eeee8d3c1626fc25ddceab6f998d152e'
        '3886117b5471ab62a291a6d068f2bc168c1467da512a68b049a02046ab15ced1078cd96e342222ff8393858ce206ed03fe102b09db4534b97bd3b95d76c3e8cd'
        '9ce42fe44f2c3c1a1b205d36e08e0703519d3bf955c14538171f4b9eabfeae8847fda37b53bfded8e371e6765ef9ecc6a59d3a719ddc1b0acf4f486a925ed6ba'
        'd29126e6bb733a9655573e5e2f1934d248f47d301361dbf4a4b1db67bea1c244d3a902f3d4d3aecca7de64c39eeca88803bde72740bc805163c790a6dbd13a54'
        '80354a9fc9de49f87183f2a0d7141b227bdd1eac421cfd5760e08d81e8e93a3c8ef6d9ec64c1c73cf0816a882da12527f9f0e2fce917991f1244900e3d973aef')

pkgver() {
    cd ${pkgname}

    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare () {
    cd ${pkgname}

    # Fix the launcher
    sed -i 's|localhost/zm|localhost:8095|g' misc/${_pkgname}.desktop.in

    # Tweak the systemd service file
    sed -i 's|After=network.target mysqld.service httpd.service|After=network.target mysqld.service httpd.service nginx.service|g' misc/${_pkgname}.service.in
    sed -i 's|Requires=mysqld.service httpd.service|Wants=mysqld.service httpd.service nginx.service|g' misc/${_pkgname}.service.in

    # Move third-party plugins into place
    mv ../CakePHP-Enum-Behavior-1.0-zm/* web/api/app/Plugin/CakePHP-Enum-Behavior
    mv ../crud-3.2.0/* web/api/app/Plugin/Crud
    mv ../RtspServer-eab32851421ffe54fec0229c3efc44c642bc8d46/* dep/RtspServer
    mv ../CxxUrl-eaf46c0207df24853a238d4499e7f4426d9d234c/* dep/CxxUrl
}

build() {
    cd ${pkgname}

    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DENABLE_INSTALL=OFF \
          -DZM_CONFIG_DIR=/etc/${_pkgname} \
          -DZM_CONFIG_SUBDIR=/etc/${_pkgname}/conf.d \
          -DZM_RUNDIR=/run/${_pkgname} \
          -DZM_SOCKDIR=/run/${_pkgname} \
          -DZM_LOGDIR=/var/log/${_pkgname} \
          -DZM_TMPDIR=/var/tmp/${_pkgname} \
          -DZM_CONTENTDIR=/var/lib/${_pkgname} \
          -DZM_CACHEDIR=/var/lib/${_pkgname}/cache \
          -DZM_WEBDIR=/usr/share/webapps/${_pkgname}/www \
          -DZM_CGIDIR=/usr/share/webapps/${_pkgname}/cgi-bin \
          -DZM_WEB_USER=http .

    cmake --build .
}

package() {
    cd ${pkgname}

    make DESTDIR=${pkgdir} install

    # Remove static cruft
    rm -r ${pkgdir}/usr/cmake
    rm -r ${pkgdir}/usr/include

    # Create ZM_LOGDIR
    install -dm755 -o http -g http                              ${pkgdir}/var/log/${_pkgname}

    # Create ZM_CONTENTDIR and its subfolders
    install -dm775 -o http -g http                              ${pkgdir}/var/lib/${_pkgname}/{cache,events,images}

    # Link ZM_CGIDIR and ZM_CACHEDIR inside ZM_WEBDIR and set correct permissions
    ln -sf /usr/share/webapps/${_pkgname}/cgi-bin               ${pkgdir}/usr/share/webapps/${_pkgname}/www
    ln -sf /var/lib/${_pkgname}/cache                           ${pkgdir}/usr/share/webapps/${_pkgname}/www
    chown -Rh http:http                                         ${pkgdir}/usr/share/webapps/${_pkgname}

    # Link ZM_WEBDIR/api/app/tmp to ZM_TMPDIR
    ln -sf /var/tmp/${_pkgname}                                 ${pkgdir}/usr/share/webapps/${_pkgname}/www/api/app/tmp

    # Fix for hardcoded /zm/ links (credit goes to @Kubax on AUR)
    ln -sf /usr/share/webapps/${_pkgname}/www                   ${pkgdir}/usr/share/webapps/${_pkgname}/www/zm

    # Set correct permissions for ZM_CONFIG_DIR & ZM_CONFIG_SUBDIR
    chmod -R 755                                                ${pkgdir}/etc/${_pkgname}
    chmod 644                                                   ${pkgdir}/etc/${_pkgname}/zm.conf
    chmod 644                                                   ${pkgdir}/etc/${_pkgname}/conf.d/*

    # Nginx
    install -Dm644 $srcdir/${_pkgname}-nginx.conf               ${pkgdir}/etc/nginx/sites-available/${_pkgname}.conf

    # Apache
    install -Dm644 $srcdir/${_pkgname}-httpd.conf               ${pkgdir}/etc/httpd/conf/extra/${_pkgname}.conf

    # php.ini extension
    install -Dm644 $srcdir/${_pkgname}-php.ini                  ${pkgdir}/etc/php/conf.d/${_pkgname}.ini

    # fcgiwrap-multiwatch service
    install -Dm644 $srcdir/fcgiwrap-multiwatch.service          ${pkgdir}/usr/lib/systemd/system/fcgiwrap-multiwatch.service

    # systemd service
    install -Dm644 misc/${_pkgname}.service                     ${pkgdir}/usr/lib/systemd/system/${_pkgname}.service

    # systemd tmpfile
    install -Dm644 misc/${_pkgname}-tmpfiles.conf               ${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf

    # logrotate conf file
    install -Dm644 misc/logrotate.conf                          ${pkgdir}/etc/logrotate.d/${_pkgname}

    # database schemas
    install -Dm644 db/zm*.sql                                   ${pkgdir}/usr/share/${_pkgname}/db
}
