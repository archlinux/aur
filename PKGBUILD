# Maintainer: M0Rf30

pkgname=airtime-git
pkgver=12396.4940c73
pkgrel=1
pkgdesc="Open broadcast software for scheduling and station management."
arch=('i686' 'x86_64')
url="http://www.sourcefabric.org/en/airtime"
license=('GPL3')
phpver=56
depends=("php$phpver" "php$phpver-gd" "php$phpver-pear" 'zendframework' "php$phpver-pgsql"
         'python2' 'python2-virtualenv' 'python2-pip'
         'python2-configobj' 'python2-anyjson' 'python2-amqplib'
         'python2-argparse' 'python2-configobj' 'python2-docopt'
         'python2-kombu' 'mutagen' 'python2-poster'
         'python2-pydispatcher' 'python2-pyinotify' 'python2-pytz'
         'python2-wsgiref'
         'ocaml-soundtouch' 'ocaml-taglib' 'ocaml-ao' 'ocaml-mad' 'ocaml-camomile'
         'ecasound' 'portaudio' 'libsamplerate' 'vo-aacenc'
         'patch'
         'mpg123' 'vorbisgain' 'pwgen' 'vorbis-tools' 'silan' 'lsof'
         'libpulse' 'alsa-utils'
         'liquidsoap'
         'coreutils' 'sudo'
         'curl'
         'opus' 'flac' 'lame'
         'multitail'
         'perl'
         'tar>=1.22' 'unzip' 'gzip>=1.3.12')
optdepends=('rabbitmq: localy hosted rabbitmq server'
            'postgresql: localy hosted Database server'
            'apache: Apache webserver (webserver needed)'
            'nginx: Nginx webserver (webserver needed)')
makedepends=('git' 'python2' 'python2-setuptools')
provides=('airtime')
replaces=('airtime')
backup=('etc/airtime/airtime.conf'
        'etc/logrotate.d/airtime-liquidsoap'
        'etc/logrotate.d/airtime-php')
install=airtime.install
source=("airtime::git+https://github.com/sourcefabric/airtime"
        'airtime-media-monitor.service'
        'airtime-liquidsoap.service'
        'airtime-playout.service'
        'airtime.tmpfiles.conf'
	'httpd-airtime.conf'
	'php-errors.patch')
branch=2.5.x

prepare() {
    cd "$srcdir/airtime"
#    grep -rl '/usr/bin/python' 'python_apps' 'utils' | xargs  sed -i "s%/usr/bin/python%/usr/bin/python2%g"
    grep -rl 'www-data' . | xargs  sed -i "s%www-data%http%g"
    patch -Np0 -i ../php-errors.patch
}

package() {
    cd "$srcdir/airtime"

    web_user=http

    # web frontend
    install -d -m755 "${pkgdir}/usr/share/airtime"
    cp -r "airtime_mvc" "${pkgdir}/usr/share/airtime"
    cp -r "python_apps" "${pkgdir}/usr/share/airtime"
    cp -r "utils" "${pkgdir}/usr/share/airtime"
    chmod -R 755 "${pkgdir}/usr/share/airtime"

    install -d -m644 "${pkgdir}/usr/share/doc/airtime/examples/"
    cp -r "widgets" "${pkgdir}/usr/share/doc/airtime/examples/"
    chmod -R 755 "${pkgdir}/usr/share/doc/airtime/examples/"
    install -D -m644 "CREDITS" "${pkgdir}/usr/share/doc/airtime/CREDITS"
    install -D -m644 "README" "${pkgdir}/usr/share/doc/airtime/README"
    install -D -m644 "changelog" "${pkgdir}/usr/share/doc/airtime/changelog"

    install -D -m644 "LICENSE" "${pkgdir}/usr/share/doc/airtime/LICENSE"
    install -D -m644 "LICENSE_3RD_PARTY" "${pkgdir}/usr/share/licenses/airtime/LICENSE_3RD_PARTY"

    install -D -m644 "airtime_mvc/build/airtime.example.conf" "${pkgdir}/etc/airtime/airtime.example.conf"

msg2 "Replace deprecated # with ; for php comment"
    find "${pkgdir}/etc/airtime/airtime.example.conf" -name "*.conf" -exec sed -i -re 's/^(\s*)#(.*)/\1;\2/g' {} \;

    install -D -m644 ../airtime.tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/airtime.conf"
    install -D -m644 "airtime_mvc/build/airtime-php.logrotate" "${pkgdir}/etc/logrotate.d/airtime-php"
    install -D -m644 "python_apps/pypo/liquidsoap/airtime-liquidsoap.logrotate" "${pkgdir}/etc/logrotate.d/airtime-liquidsoap"

    install -d -m1777 "${pkgdir}/var/tmp/"
    install -d -m755 "${pkgdir}/var/tmp/airtime"
    install -d -m755 "${pkgdir}/var/tmp/airtime/show-recorder/"

    install -d -m755 "${pkgdir}/var/log/airtime"

    install -d -m655 "${pkgdir}/etc/airtime"
    install -d -m755 "${pkgdir}/usr/share/php/"

msg2 "Symlinking Zend Framework"
    ln -sr /usr/share/zendframework/library/ "${pkgdir}/usr/share/php/Zend"
    ln -sr /usr/share/zendframework/library "${pkgdir}/usr/share/php/libzend-framework-php"
 
    install -D -m644 "installer/php/airtime.ini" "${pkgdir}/etc/php$phpver/conf.d/airtime.ini"

    install -D -m644 ../httpd-airtime.conf "${pkgdir}/etc/httpd/conf/extra/httpd-airtime.conf"

    install -D -m644 ../airtime-media-monitor.service "${pkgdir}/usr/lib/systemd/system/airtime-media-monitor.service"
    install -D -m644 ../airtime-liquidsoap.service "${pkgdir}/usr/lib/systemd/system/airtime-liquidsoap.service"
    install -D -m644 ../airtime-playout.service "${pkgdir}/usr/lib/systemd/system/airtime-playout.service"

    # python apps
    python2 "python_apps/std_err_override/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
    python2 "python_apps/api_clients/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
    python2 "python_apps/media-monitor/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
    python2 "python_apps/pypo/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin

    chown -R ${web_user}:${web_user} "${pkgdir}/var/tmp/airtime"
    chown -R ${web_user}:${web_user} "${pkgdir}/var/log/airtime"
    
msg2 "Cleaning..."
    rm -r "${pkgdir}/etc/init"
    rm -r "${pkgdir}/etc/init.d"
}

pkgver() {
  cd airtime
  echo $(git rev-list --count $branch).$(git rev-parse --short $branch)
}

md5sums=('SKIP'
         'f42b444b6b06268a8c8695173b55391c'
         'fc4a319d43a96f0003f348c7ddd8aca2'
         '93f750480f7c49d72cdcdb10cd97c089'
         'd9c15aaa7b1da14acc99e047f58aac66'
         'dc67439d083d7e1caa7bb04308a3fcf5'
         'f0d4f2b5a52b130475dfe571f0186dc6')
