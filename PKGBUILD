# Maintainer: Your Name <ryexander@gmail.com>
pkgname=airtime
pkgver=2.5.2.1
pkgrel=1
pkgdesc="Open broadcast software for scheduling and station management."
arch=('i686' 'x86_64')
url="http://www.sourcefabric.org/en/airtime"
license=('GPL3')
groups=()
depends=('php' 'php-gd' 'php-pear' 'zendframework' 'php-pgsql' 'php-apcu' 'php-apcu-bc'
         'python' 'python-virtualenv' 'python-pip'
         'ocaml-soundtouch' 'ocaml-taglib' 'ocaml-ao' 'ocaml-mad' 'ocaml-camomile'
         'ecasound' 'portaudio' 'libsamplerate' 'vo-aacenc'
         'patch'
         'mpg123' 'vorbisgain' 'pwgen' 'vorbis-tools' 'silan-git' 'lsof'
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
makedepends=('git' 'python-setuptools')
provides=("${pkgname}")
conflicts=("${pkgname}")
replaces=()
backup=('etc/airtime/airtime.conf'
        'etc/airtime/airtime.ini'
        'etc/airtime/apache.vhost.tpl'
        'etc/airtime/apache24.vhost.tpl'
        'etc/logrotate.d/airtime-liquidsoap'
        'etc/logrotate.d/airtime-php')
options=()
install=airtime.install
source=("${pkgname}.tar.gz::https://github.com/sourcefabric/airtime/archive/airtime-${pkgver}.tar.gz"
        'airtime-media-monitor.service'
        'airtime-liquidsoap.service'
        'airtime-playout.service'
        'airtime.tmpfiles.conf')
noextract=()
sha256sums=('ba3ed67f1a60032e1624a021fffa4bb11d9055ddc4c3773b40f334854adf6930'
            '8257cca5eef976ab9f42f0c6210b24c417b961ca4a05316da48a8ee306e2bf9a'
            'e13f3a4e25d9ff732a1936d8e6c2301186096405bec0594f1590fc273b47e25d'
            '349dd02f50d5bb283004954c1566055dc81f4972679861264b6fe88819208511'
            'a95e7236ab741140cafdd987cf485395de6b997ad1241411c8e7fa731dfaa137')

prepare() {
	cd "$srcdir/${pkgname}/python_apps"
  2to3 -w api_clients
  2to3 -w media-monitor
  2to3 -w pypo
  2to3 -w std_err_override
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
  mkdir -p "${pkgdir}/usr/share/airtime"
  cp -r "${pkgname}/airtime_mvc" "${pkgdir}/usr/share/airtime"
  cp -r "${pkgname}/python_apps" "${pkgdir}/usr/share/airtime"
  cp -r "${pkgname}/utils" "${pkgdir}/usr/share/airtime"
  chmod -R 755 "${pkgdir}/usr/share/airtime"

  mkdir -p "${pkgdir}/usr/share/doc/airtime/examples/"
  cp -r "${pkgname}/widgets" "${pkgdir}/usr/share/doc/${pkgname}/examples/"
  chmod -R 755 "${pkgdir}/usr/share/doc/${pkgname}/examples/"
  install -D -m644 "${pkgname}/CREDITS" "${pkgdir}/usr/share/doc/${pkgname}/CREDITS"
  install -D -m644 "${pkgname}/README" "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -D -m644 "${pkgname}/changelog" "${pkgdir}/usr/share/doc/${pkgname}/changelog"

  install -D -m644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
  install -D -m644 "${pkgname}/LICENSE_3RD_PARTY" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_3RD_PARTY"

  install -D -m644 "airtime.tmpfiles.conf" "${pkgdir}/usr/lib/tmpfiles.d/airtime.conf"

  mkdir -p "${pkgdir}/var/tmp/airtime/show-recorder/"

  install -D -m644 "${pkgname}/airtime_mvc/build/airtime-php.logrotate" "${pkgdir}/etc/logrotate.d/airtime-php"
  install -D -m644 "${pkgname}/python_apps/pypo/liquidsoap/airtime-liquidsoap.logrotate" "${pkgdir}/etc/logrotate.d/airtime-liquidsoap"

  mkdir -p "${pkgdir}/var/log/airtime"
  chmod -R a+x "${pkgdir}/var/log/airtime"
  chown -R ${web_user}:${web_user} "${pkgdir}/var/log/airtime"

  mkdir -p "${pkgdir}/var/tmp/airtime"
  chmod -R a+x "${pkgdir}/var/tmp/airtime"
  chown -R ${web_user}:${web_user} "${pkgdir}/var/tmp/airtime"

  mkdir -p "${pkgdir}/etc/airtime"

  install -D -m 755 "${pkgname}/installer/php/airtime.ini" "${pkgdir}/etc/airtime"
  install -D -m 755 "${pkgname}/installer/apache/airtime-vhost" "${pkgdir}/etc/airtime/apache.vhost.tpl"
  install -D -m 755 "${pkgname}/installer/apache/airtime-vhost-2.4" "${pkgdir}/etc/airtime/apache24.vhost.tpl"
  install -D -m 755 "${pkgname}/airtime_mvc/build/airtime.example.conf" "${pkgdir}/etc/airtime/airtime.conf"

  chown -R ${web_user}:${web_user} "${pkgdir}/etc/airtime"

  install -D -m 755 airtime-media-monitor.service "${pkgdir}/usr/lib/systemd/system"
  install -D -m 755 airtime-liquidsoap.service "${pkgdir}/usr/lib/systemd/system"
  install -D -m 755 airtime-playout.service "${pkgdir}/usr/lib/systemd/system"

  # python apps
  python2 "${pkgname}/python_apps/std_err_override/setup.py" install \
      --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
  python2 "${pkgname}/python_apps/api_clients/setup.py" install \
      --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
  python2 "${pkgname}/python_apps/media-monitor/setup.py" install \
      --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin
  python2 "${pkgname}/python_apps/pypo/setup.py" install \
      --root="${pkgdir}/" --optimize=1 --install-scripts=/usr/bin


}
