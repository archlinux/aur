# Maintainer: Fabio Manganiello <fabio@manganiello.tech>

pkgname=platypush-git
_pkgname=platypush
pkgver=1.3.6.r46.gc5226c8b
pkgrel=1
pkgdesc="A general-purpose, event-driven, plugin-based platform for automation-as-code"
arch=('any')
license=('MIT')
backup=(
  'etc/platypush/config.yaml'
)
url="https://platypush.tech"
_repourl="https://git.platypush.tech/${_pkgname}/${_pkgname}.git"
makedepends=('git')
depends=(
    'python'
    'python-alembic'
    'python-croniter'
    'python-dateutil'
    'python-docutils'
    'python-flask'
    'python-magic'
    'python-marshmallow'
    'python-pip'
    'python-psutil'
    'python-pygments'
    'python-pyotp'
    'python-qrcode'
    'python-redis'
    'python-requests'
    'python-rsa'
    'python-setuptools'
    'python-sqlalchemy'
    'python-tornado'
    'python-watchdog'
    'python-websocket-client'
    'python-websockets'
    'python-yaml'
    'python-zeroconf'
    'zbar'
)

optdepends=(
    'ffmpeg: Audio, streaming and several camera integrations'
	'libtorrent: Support for torrent download'
	'opencv: Support for cameras and image processing over the OpenCV integration'
    'py-trello: Trello integration'
	'python-aiohttp: SmartThings support'
	'python-aioxmpp: XMPP support'
	'python-bleak: Bluetooth low-energy devices support'
	'python-bme280: Support for the BME280 digital sensor over I2C interface'
	'python-deepspeech: Mozilla Deepspeech integration'
	'python-defusedxml: RSS and DBus integration support'
	'python-dropbox: Dropbox integration'
	'python-feedparser: RSS integration support'
	'python-google-api-python-client: Support for several Google integrations'
    'python-google-cloud-texttospeech: Support for Google Cloud text-to-speech integration'
    'python-google-cloud-translate: Support for the Google Translate integration'
    'python-gpsd-git: Support for the GPS integration and several GPS devices'
    'python-graphyte: Graphite integration'
	'python-icalendar: Support for calendar integrations'
	'python-imapclient: Mail integrations'
	'python-irc: IRC integration'
	'python-inotify: Support for filesystem monitoring integrations'
	'python-kafka: Kafka integration support'
	'python-keras: Tensorflow integration'
	'python-kodi-json: Support for the Kodi integration'
    'python-linode_api4: Linode cloud integration'
	'python-matrix-nio: Matrix integration'
	'python-mpd2: MPD/Mopidy integration support'
	'python-mpv: mpv integration'
	'python-ndeflib: NFC tags integration'
	'python-nfcpy: NFC tags integration'
	'python-nmap: nmap integration'
	'python-numpy: Strongly advised for any camera, sound, voice or ML-based integration'
	'python-oauth2client: Support for several Google integrations'
    'python-paho-mqtt: MQTT integrations support'
	'python-pandas: Tensorflow integration'
	'python-paramiko: SSH support'
	'python-phue: Philips Hue (and compatible) devices support'
	'python-pillow: Support for several camera integrations and QR codes'
	'python-plexapi: Support for the Plex integration'
	'python-py-cpuinfo: System information plugin'
	'python-pybluez: Bluetooth support'
	'python-pychromecast: Chromecast support'
	'python-pyclip: Clipboard integration'
	'python-pycups: Printers integration'
	'python-pydbus: DBus and Bluetooth integration'
	'python-pylast: Last.fm scrobbling support'
	'python-pyscard: Support for the smart card integration'
	'python-pyserial: Arduino/serial device support'
	'python-rpi-gpio: Support for GPIO integrations for Raspberry Pi (and compatible) devices'
	'python-rtmidi: MIDI integration'
	'python-snowboy: Snowboy integration'
	'python-sounddevice: Sound integration'
	'python-telegram-bot: Telegram integration'
	'python-tensorflow: Tensorflow integration'
    'python-todoist-python: Todoist integration'
	'python-twilio: Twilio integration'
	'python-vlc: VLC integration'
    'python-weasyprint: PDF generation support'
    'yt-dlp: Support for downloading/streaming YouTube videos, as well as other video platforms'
)

conflicts=('platypush')
provides=('platypush')
options=(!strip)
source=("${_pkgname}::git+${_repourl}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_pkgname}"
    PYTHONDONTWRITEBYTECODE=1 python3 setup.py install --root="${pkgdir}/" --prefix=/usr --optimize=1

    install -m750 -d "${pkgdir}/var/lib/platypush"
    install -m755 -d "${pkgdir}/usr/lib/systemd/system"
    install -m755 -d "${pkgdir}/usr/lib/systemd/user"
    install -m750 -d "${pkgdir}/etc/platypush/scripts"
    install -m755 -d "${pkgdir}/usr/lib/sysusers.d"
    install -m755 -d "${pkgdir}/usr/lib/tmpfiles.d"

    install -m644 "${srcdir}/platypush/platypush/config/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/user/platypush.service"
    install -m644 "${srcdir}/platypush/platypush/config/systemd/platypush.service" "${pkgdir}/usr/lib/systemd/system/platypush.service"
    sed -i "${pkgdir}/usr/lib/systemd/system/platypush.service" -r \
        -e 's/^#\s*Requires=(.*)/Requires=\1/' \
        -e 's/^\[Service\]$/\[Service\]\
User=platypush\
Group=platypush\
WorkingDirectory=\/var\/lib\/platypush\
Environment="PLATYPUSH_CONFIG=\/etc\/platypush\/config.yaml"\
Environment="PLATYPUSH_WORKDIR=\/var\/lib\/platypush"/'
    install -m644 "${srcdir}/platypush/platypush/config/config.yaml" "${pkgdir}/etc/platypush/config.yaml"
    install -Dm644 "${srcdir}/platypush/platypush/config/systemd/platypush-sysusers.conf" "${pkgdir}/usr/lib/sysusers.d/platypush.conf"
    install -Dm644 "${srcdir}/platypush/platypush/config/systemd/platypush-tmpfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/platypush.conf"

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
