# Maintainer: Your Name <ryexander@gmail.com>
pkgname=airtime
pkgver=2.5.2.1
pkgrel=4
pkgdesc="Open broadcast software for scheduling and station management."
arch=('i686' 'x86_64')
url="http://www.sourcefabric.org/en/airtime"
license=('GPL3')
groups=()
depends=('php' 'php-gd' 'php-pear' 'zendframework' 'php-pgsql' 'php-apcu' 'php-apcu-bc'
         'python2' 'python2-virtualenv' 'python2-pip'
         'python2-configobj' 'python2-anyjson' 'python2-amqplib'
         'python2-argparse' 'python2-configobj' 'python2-docopt'
         'python2-kombu' 'python2-mutagen' 'python2-poster'
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
provides=("airtime")
conflicts=()
replaces=()
backup=('etc/airtime/airtime.conf'
        'etc/airtime/airtime.ini'
        'etc/airtime/apache.vhost.tpl'
        'etc/airtime/apache24.vhost.tpl'
        'etc/logrotate.d/airtime-liquidsoap'
        'etc/logrotate.d/airtime-php')
options=()
install=airtime.install
source=("https://github.com/sourcefabric/airtime/archive/airtime-${pkgver}.tar.gz"
        'airtime-media-monitor.service'
        'airtime-liquidsoap.service'
        'airtime-playout.service'
        'airtime.tmpfiles.conf')
_pkgsrc_name="airtime-airtime-${pkgver}"
noextract=()
sha256sums=('ba3ed67f1a60032e1624a021fffa4bb11d9055ddc4c3773b40f334854adf6930'
            '8257cca5eef976ab9f42f0c6210b24c417b961ca4a05316da48a8ee306e2bf9a'
            'e13f3a4e25d9ff732a1936d8e6c2301186096405bec0594f1590fc273b47e25d'
            '349dd02f50d5bb283004954c1566055dc81f4972679861264b6fe88819208511'
            'a95e7236ab741140cafdd987cf485395de6b997ad1241411c8e7fa731dfaa137')

prepare() {
	cd "$srcdir/${_pkgsrc_name}"
    grep -rl '/usr/bin/python' 'python_apps' 'utils' | xargs  sed -i "s%/usr/bin/python%/usr/bin/python2%g"
    grep -rl 'www-data' . | xargs  sed -i "s%www-data%http%g"
}
#
# build() {
# 	cd "$srcdir/${pkgname%-git}"
# }
#
#
# check() {
# 	cd "$srcdir/${pkgname%-git}"
# 	make -k check
# }

package() {
  	cd "$srcdir/"

    web_user=http

    # web frontend
    install -d -m755 "${pkgdir}/usr/share/airtime"
    cp -r "${_pkgsrc_name}/airtime_mvc" "${pkgdir}/usr/share/airtime"
    cp -r "${_pkgsrc_name}/python_apps" "${pkgdir}/usr/share/airtime"
    cp -r "${_pkgsrc_name}/utils" "${pkgdir}/usr/share/airtime"
    chmod -R 755 "${pkgdir}/usr/share/airtime"

    install -d -m644 "${pkgdir}/usr/share/doc/airtime/examples/"
    cp -r "${_pkgsrc_name}/widgets" "${pkgdir}/usr/share/doc/airtime/examples/"
    chmod -R 755 "${pkgdir}/usr/share/doc/airtime/examples/"
    install -D -m644 "${_pkgsrc_name}/CREDITS" "${pkgdir}/usr/share/doc/airtime/CREDITS"
    install -D -m644 "${_pkgsrc_name}/README" "${pkgdir}/usr/share/doc/airtime/README"
    install -D -m644 "${_pkgsrc_name}/changelog" "${pkgdir}/usr/share/doc/airtime/changelog"

    install -D -m644 "${_pkgsrc_name}/LICENSE" "${pkgdir}/usr/share/doc/airtime/LICENSE"
    install -D -m644 "${_pkgsrc_name}/LICENSE_3RD_PARTY" "${pkgdir}/usr/share/licenses/airtime/LICENSE_3RD_PARTY"

    install -D -m644 "airtime.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/airtime.conf"
    install -D -m644 "${_pkgsrc_name}/airtime_mvc/build/airtime-php.logrotate" "${pkgdir}/etc/logrotate.d/airtime-php"
    install -D -m644 "${_pkgsrc_name}/python_apps/pypo/liquidsoap/airtime-liquidsoap.logrotate" "${pkgdir}/etc/logrotate.d/airtime-liquidsoap"

    install -d -m777 "${pkgdir}/var/tmp/airtime/show-recorder/"

    install -d -m755 "${pkgdir}/var/log/airtime"

    install -d -m777 "${pkgdir}/var/tmp/airtime"

    install -d -m655 "${pkgdir}/etc/airtime"
    install -d -m655 "${pkgdir}/etc/airtime/php"
    install -d -m655 "${pkgdir}/etc/airtime/apache"
    install -d -m655 "${pkgdir}/etc/airtime/nginx"

    install -D -m 755 "${_pkgsrc_name}/installer/php/airtime.ini" "${pkgdir}/etc/airtime/php/airtime.ini"
    install -D -m 755 "${_pkgsrc_name}/installer/apache/airtime-vhost" "${pkgdir}/etc/airtime/apache/apache.vhost.tpl"
    install -D -m 755 "${_pkgsrc_name}/installer/apache/airtime-vhost-2.4" "${pkgdir}/etc/airtime/apache/apache24.vhost.tpl"

    install -D -m 755 airtime-media-monitor.service "${pkgdir}/usr/lib/systemd/system/airtime-media-monitor.service"
    install -D -m 755 airtime-liquidsoap.service "${pkgdir}/usr/lib/systemd/system/airtime-liquidsoap.service"
    install -D -m 755 airtime-playout.service "${pkgdir}/usr/lib/systemd/system/airtime-playout.service"

    # python apps
    python2 "${_pkgsrc_name}/python_apps/std_err_override/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
    python2 "${_pkgsrc_name}/python_apps/api_clients/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
    python2 "${_pkgsrc_name}/python_apps/media-monitor/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
    python2 "${_pkgsrc_name}/python_apps/pypo/setup.py" install \
        --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin

    chmod -R 777 "${pkgdir}/var/tmp/airtime"
    chmod -R 755 "${pkgdir}/var/log/airtime"

    chown -R ${web_user}:${web_user} "${pkgdir}/var/tmp/airtime"
    chown -R ${web_user}:${web_user} "${pkgdir}/var/log/airtime"
    chown -R ${web_user}:${web_user} "${pkgdir}/etc/airtime"


}
