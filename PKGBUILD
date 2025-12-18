# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: tjbp (archlinux@tjbp.net)

pkgname='openwebrx-plus'
_pkgname='openwebrx'
pkgver='1.2.102'
pkgrel='1'
pkgdesc='Open source, multi-user SDR receiver software with a web interface'
arch=('any')
url='https://luarvique.github.io/ppa/'
license=('AGPL3')
depends=('python-csdr-luarvique>=0.18.36' 'rtl-sdr' 'owrx_connector-luarvique' 'python-setuptools' 'python-distutils-extra')
install="${pkgname}".install
optdepends=(
    # decoding
    'python-digiham: use digital voice modes'
    'codecserver: decode audio data from digital voice modes using the AMBE codec, leagally trustworthy'
    'codecserver-softmbe: use LEGALLY DUBIOUS codecs to decode digital voice modes using the AMBE codec'
    'codecserver-mbelib-module: use LEGALLY DUBIOUS codecs to decode digital voice modes using the AMBE codec'
    'codec2: demodulate FreeDV digital transmissions'
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
    # tools
    'imagemagick: automatically convert received images to the PNG format'
    'sox: sound processing tools'
    'python-paho-mqtt: send decoded signal data to an MQTT broker for further processing by third-party applications'
    'hamlib: synchronize frequency and modulation with external transceivers'
    'lame: to compress recorded audio into MP3 format'
    'aprs-symbols: display APRS symbols'

    # device support
    'soapyrtlsdr: provides additional support for rtl-sdr devices, such as the direct sampling mod'
    'soapysdrplay: interfacing with SDRPlay devices'
    'soapymiri-git: interfacing with Mirics-based hardware (MSi001 + MSi2500)'
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
source=(
    "$pkgname-$pkgver".tar.gz::"https://github.com/luarvique/openwebrx/archive/$pkgver.tar.gz"
    'openwebrx-plus.sysusers'
    'openwebrx-plus.tmpfiles'
)
sha256sums=(
    '4e94a80ab718d12933bb35b55aa08334266394a0e582b4c4aed01d43a18b0e98'
    '4ec6dec1df40a1f3db62a2add760f97cf870d65a2c1d5b63cd9b22704754f997'
    'eea488bd3f4c76b46bffbf3c88691818f93ad73db98c18659856d1690b0deade'
)
provides=('openwebrx')
conflicts=('openwebrx')

build() {
    cd "$srcdir/openwebrx-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/openwebrx-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1

    for config in bands.json bands-*.json openwebrx.conf; do
        install -Dm 0644 ${config} ${pkgdir}/etc/openwebrx/${config}
    done

    cp -rv bookmarks.d "${pkgdir}"/etc/openwebrx/

    install -Dm 0644 ${srcdir}/$pkgname.sysusers ${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf
    install -Dm 0644 ${srcdir}/$pkgname.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm 0644 systemd/openwebrx.service ${pkgdir}/usr/lib/systemd/system/openwebrx.service
}
