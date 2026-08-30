# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: tjbp (archlinux@tjbp.net)

pkgname='openwebrx-plus-git'
_pkgname='openwebrx'
pkgver=1.2.122.r13.g9f29d356
pkgrel=1
pkgdesc='Open source, multi-user SDR receiver software with a web interface'
arch=('any')
url='https://luarvique.github.io/ppa/'
license=('AGPL-3.0-only')
depends=('python-csdr-luarvique>=0.18.38' 'rtl-sdr' 'owrx_connector-luarvique' 'python-importlib-metadata' 'python-protobuf' 'python-setuptools')
install=openwebrx-plus.install
optdepends=(
    # decoding
    'python-digiham>=0.6.11: use digital voice modes'
    'codecserver: decode audio data from digital voice modes using the AMBE codec, leagally trustworthy'
    'codecserver-softmbe: use LEGALLY DUBIOUS codecs to decode digital voice modes using the AMBE codec'
    'codecserver-mbelib-module: use LEGALLY DUBIOUS codecs to decode digital voice modes using the AMBE codec'
    'codec2: demodulate classic FreeDV digital transmissions'
    'radae-decoder-git: demodulate FreeDV RADEv1 digital voice transmissions'
    'm17-cxx-demod: demodulate M17 digital voice signals'
    'wsjtx: decode FT8, FST4, FST4, Q65 digital modes'
    'msk144decoder: decode the MSK144 digimode'
    'direwolf: decode Packet Radio and optionally report data back to APRS-IS'
    'js8py: decode JS8'
    'js8call: decode JS8'
    'dream-nox: decode DRM broadcasts'
    'dump1090: decode Mode-S and ADS-B traffic'
    'dump978: decoding UAT airplane communications'
    'rtl_433: decode various signals in the ISM bands'
    'dumphfdl: decoding HFDL airplane communications'
    'dumpvdl2-git: decoding VDL Mode 2 airplane communications'
    'acarsdec: decode ACARS traffic'
    'multimon-ng: decode FLEX, POCSAG, and several other digital modes'
    'mbelib: Voice codecs for P25, ProVoice, Half Rate'
    'redsea: decode RDS information from FM broadcasts'
    'python-csdr-eti: decode DAB broadcast signals'
    'dablin: decode DAB broadcast signals'
    'satdump: receive weather satellite transmissions'
    'nrsc5: decode HDRadio broadcasts'
    'csdr-skimmer: decode multiple CW signals at once'
    'radiosonde_auto_rx: decode radiosonde data'
    'python-meshtastic: decode Meshtastic messages'
    # lorarx (dxlAPRS): decode LoRa data, manual build required, no AUR package yet
    # tools
    'imagemagick: automatically convert received images to the PNG format'
    'sox: sound processing tools'
    'python-paho-mqtt: send decoded signal data to an MQTT broker for further processing by third-party applications'
    'python-pycryptodome: cryptography support for Meshtastic decoding'
    'hamlib: synchronize frequency and modulation with external transceivers'
    'lame: to compress recorded audio into MP3 format'
    'aprs-symbols: display APRS symbols'

    # device support
    'soapyrtlsdr: provides additional support for rtl-sdr devices, such as the direct sampling mod'
    'soapysdrplay: interfacing with SDRPlay devices'
    'soapymiri-git: interfacing with Mirics-based hardware (MSi001 + MSi2500)'
    'soapy-malahit-rr: interfacing with Malahit devices'
    'soapyhackrf: interfacing with HackRF devices'
    'libperseus-sdr: use the Microtelecom Perseus HF receiver'
    'soapyairspy: interfacing with Airspy devices (Airspy R2, Airspy Mini)'
    'soapyairspyhf: interfacing with Airspy HF devices (Airspy HF+, Airspy HF discovery)'
    # soapyafedri, no aur package yet
    'limesuite: interfacing with LimeSDR device series'
    # fifi_sdr, no aur package yet
    'soapyplutosdr: interfacing with PlutoSDR devices'
    'soapyremote: allows the usage of remote SDR devices using the SoapySDRServer'
    'soapyuhd: interfacing with UHD / USRP devices'
    # radioberry, no aur package yet
    'soapyfcdpp-git: interfacing with the Funcube Dongle Pro+'
    'soapybladerf: interfacing with Blade RF devices'
    # sddc, no aur package yet
    'soapysddc: interfacing with SDDC SDR devices such as the RX666, RX888, HF103, etc'
    # hpsdr, no aur package yet
    # runds, no aur package yet
)
makedepends=('git' 'python-distutils-extra')
source=(
    "$_pkgname"::"git+https://github.com/luarvique/openwebrx.git"
    'openwebrx-plus.sysusers'
    'openwebrx-plus.tmpfiles'
)
sha256sums=('SKIP'
            '4f618a2fd96bca7359a6d52a0ae996d08ab30d94d9d2717f1e353f2296ee0fd7'
            'eea488bd3f4c76b46bffbf3c88691818f93ad73db98c18659856d1690b0deade')
provides=('openwebrx' 'openwebrx-plus')
conflicts=('openwebrx' 'openwebrx-plus')

pkgver() {
    cd "$srcdir/$_pkgname"
    # use git tag or fall back to number of revisions
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1

    for config in bands.json bands-*.json openwebrx.conf bookmarks.json bookmarks.txt; do
        [ -f "${config}" ] && install -Dm 0644 ${config} ${pkgdir}/etc/openwebrx/${config}
    done
    if [ -d bookmarks.d ]; then
        cp -rv bookmarks.d "${pkgdir}"/etc/openwebrx/
        find "${pkgdir}"/etc/openwebrx/bookmarks.d -type f -exec chmod 0644 {} +
        find "${pkgdir}"/etc/openwebrx/bookmarks.d -type d -exec chmod 0755 {} +
    fi

    install -Dm 0644 ${srcdir}/openwebrx-plus.sysusers ${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf
    install -Dm 0644 ${srcdir}/openwebrx-plus.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf
    sed -i '/^Environment="HOME=/a Environment="PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/opt/radiosonde_auto_rx/auto_rx/"' systemd/openwebrx.service
    install -Dm 0644 systemd/openwebrx.service ${pkgdir}/usr/lib/systemd/system/openwebrx.service
}
