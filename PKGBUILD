# Maintainer: EndlessEden <eden [at] rose.place>
# Previous Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>

pkgname=rtlsdr-airband-git
pkgver=3.2.1.r526.a472673
pkgrel=1
pkgdesc="RTLSDR AM demodulator, support multiple channels per dongle"
arch=('i686' 'x86_64')
url="https://github.com/szpajder/RTLSDR-Airband"
license=('GPL3')
depends=('rtl-sdr' 'fftw' 'libvorbis' 'lame' 'libshout' 'libconfig' 'libmirisdr' 'soapysdr')
makedepends=('git' 'libmirisdr' 'soapysdr')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('rtlsdr-airband::git+https://github.com/szpajder/RTLSDR-Airband.git#branch=unstable'
'rtl_airband.conf.example')
md5sums=('SKIP'
'83c1de3720baca0e2222b6e1abfade1c')
sha256sums=('SKIP'
'SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
   
    echo "$(git describe| sed 's,-,\n,g' | head -1 | sed 's,v,,g')"'.'$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
}

prepare() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p BUILD
}

build() {
    cd "$srcdir/${pkgname%-git}"
    cd BUILD

    cmake .. \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc/rtl_airband \
    -DNFM=ON \
    -DRTLSDR=ON \
    -DSOAPYSDR=ON #\ ## Next line RPI only
    #-DBCM_VC=ON ## RPI Support

    make
}

package() {
    cd "$srcdir"/"${pkgname%-git}"/BUILD
    make install
    install -Dm 0755 "$srcdir"/"${pkgname%-git}"/BUILD/src/rtl_airband "${pkgdir}"/usr/bin/rtl_airband
    install -Dm 0600 "$srcdir"/"${pkgname%-git}"/config/basic_multichannel.conf  "${pkgdir}"/etc/rtl_airband/basic_multichannel.conf
    install -Dm 0600 "$srcdir"/"${pkgname%-git}"/config/basic_scanning.conf "${pkgdir}"/etc/rtl_airband/basic_scanning.conf
    install -Dm 0600 "$srcdir"/"${pkgname%-git}"/config/mixers.conf "${pkgdir}"/etc/rtl_airband/mixers.conf
    install -Dm 0600 "$srcdir"/"${pkgname%-git}"/config/two_dongles_multiple_outputs.conf  "${pkgdir}"/etc/rtl_airband/two_dongles_multiple_outputs.conf
    if [ -e "$srcdir"/"${pkgname%-git}"/config/reference.conf ];then
    	install -Dm 0600 "$srcdir"/"${pkgname%-git}"/config/reference.conf "${pkgdir}"/etc/rtl_airband/rtl_airband.conf
    else
    	install -Dm 0600 "$srcdir"/rtl_airband.conf.example "${pkgdir}"/etc/rtl_airband/rtl_airband.conf
    fi
}
