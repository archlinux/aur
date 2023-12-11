# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: tjbp (archlinux@tjbp.net)

pkgname='openwebrx-plus'
_pkgname='openwebrx'
pkgver='1.2.42'
pkgrel='1'
pkgdesc='Open source, multi-user SDR receiver software with a web interface'
arch=('any')
url='https://luarvique.github.io/ppa/'
license=('AGPL3')
depends=('csdr-luarvique' 'python-csdr-luarvique' 'rtl-sdr' 'js8py' 'owrx_connector-luarvique' 'python-setuptools')
optdepends=(
    # decoding
    'python-digiham: use digital voice modes'
    'codecserver: decode audio data from digital voice modes using the AMBE codec'
    'codec2: demodulate FreeDV digital transmissions'
    'm17-cxx-demod: demodulate M17 digital voice signals'
    'wsjtx: decode FT8, FST4, FST4, Q65 digital modes'
    'msk144decoder: decode the MSK144 digimode'
    'direwolf: decode Packet Radio and optionally report data back to APRS-IS'
    'js8call: decode JS8'
    'dream-nox: decode DRM broadcasts'
    'dump1090: decode Mode-S and ADS-B traffic'
    'rtl_433: decode various signals in the ISM bands'
    'dumphfdl: decoding HFDL airplane communications'
    'dumpvdl2-git: decoding VDL Mode 2 airplane communications'
    'acarsdec: decode ACARS traffic'
    'multimon-ng: decode FLEX, POCSAG, and several other digital modes'
    'mbelib: Voice codecs for P25, ProVoice, Half Rate'
    'redsea: decode RDS information from FM broadcasts'
    # tools
    'imagemagick: automatically convert received images to the PNG format'
    'sox: sound processing tools'
    # device support
    'soapyremote: allows the usage of remote SDR devices using the SoapySDRServer'
    'soapyrtlsdr: provides additional support for rtl-sdr devices, such as the direct sampling mod'
    'soapysdrplay: interfacing with SDRPlay devices'
    'soapyhackrf: interfacing with HackRF devices'
    'soapyairspy: interfacing with Airspy devices (Airspy R2, Airspy Mini)'
    'soapyairspyhf: interfacing with Airspy HF devices (Airspy HF+, Airspy HF discovery)'
    'limesuite: interfacing with LimeSDR device series'
    'soapyplutosdr: interfacing with PlutoSDR devices'
    'soapyuhd: interfacing with UHD / USRP devices'
    'soapyfcdpp-git: interfacing with the Funcube Dongle Pro+'
    'soapybladerf: interfacing with Blade RF devices'
)
source=("$pkgname-$pkgver".tar.gz::"https://github.com/luarvique/openwebrx/archive/$pkgver.tar.gz"
        'openwebrx-plus.sysusers' 'openwebrx-plus.tmpfiles')
sha256sums=('273be8a4fbc941111efde712148f2b5863937336f3c1711a413fd63906845c55'
            '1a675698545a28c2645a925a8c2bd70775a0a45af44d918499e63e7e21510bfe'
            'eea488bd3f4c76b46bffbf3c88691818f93ad73db98c18659856d1690b0deade')
provides=('openwebrx')
conflicts=('openwebrx')

build() {
    cd "$srcdir/openwebrx-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/openwebrx-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize=1

    for config in bands.json bookmarks.json openwebrx.conf; do
        install -Dm 0644 ${config} ${pkgdir}/etc/openwebrx/${config}
    done
    for config in bookmarks.d/*; do
        install -Dm 0644 ${config} ${pkgdir}/etc/openwebrx/${config}
    done

    install -Dm 0644 ${srcdir}/$pkgname.sysusers ${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf
    install -Dm 0644 ${srcdir}/$pkgname.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf
    install -Dm 0644 systemd/openwebrx.service ${pkgdir}/usr/lib/systemd/system/openwebrx.service
}
