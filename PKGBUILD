# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: tjbp (archlinux@tjbp.net)

pkgname='openwebrx-plus'
_pkgname='openwebrx'
pkgver='1.2.41'
pkgrel='3'
pkgdesc='Open source, multi-user SDR receiver software with a web interface'
arch=('any')
url='https://luarvique.github.io/ppa/'
license=('AGPL3')
depends=('csdr-luarvique' 'python-csdr-luarvique' 'rtl-sdr' 'js8py' 'owrx_connector-luarvique' 'netcat' 'python-setuptools')
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
    'dsd: Digital Speech Decoder'
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
sha256sums=('4e634e7bef4036ebaa734098fae94c99a2594f0e1e48eecedeb89848557988ac'
            '1a675698545a28c2645a925a8c2bd70775a0a45af44d918499e63e7e21510bfe'
            'c5fd92043b7d380c16a12cdc627b78c4c753ff11a469c2a7692c29851ebfe7c3')
provides=('openwebrx')
conflicts=('openwebrx')

prepare() {
    cd "$srcdir/openwebrx-$pkgver"
    sed -i "2 a import sys\n\nsys.path.insert(1, \"/usr/lib/openwebrx\")\n" openwebrx.py
}

package() {
    install -Dm 0644 ${srcdir}/$pkgname.sysusers ${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf
    install -Dm 0644 ${srcdir}/$pkgname.tmpfiles ${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}.conf

    cd "$srcdir/openwebrx-$pkgver"
    install -Dm 0755 openwebrx.py ${pkgdir}/usr/bin/openwebrx
    PYTHON_VER=$(python --version | grep -E -o '[0-9]+\.[0-9]+')
    find owrx -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/python$PYTHON_VER/{}" \;
    find csdr -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/python$PYTHON_VER/{}" \;
    find htdocs -type f -exec install -Dm 0644 "{}" "${pkgdir}/usr/lib/openwebrx/{}" \;
    #install -Dm 0644 config_webrx.py ${pkgdir}/etc/openwebrx/config_webrx.py
    for config in bands.json bookmarks.json openwebrx.conf; do
        install -Dm 0644 ${config} ${pkgdir}/etc/openwebrx/${config}
    done
    for config in bookmarks.d/*; do
        install -Dm 0644 ${config} ${pkgdir}/etc/openwebrx/${config}
    done

    install -Dm 0644 systemd/openwebrx.service ${pkgdir}/usr/lib/systemd/system/openwebrx.service
}
