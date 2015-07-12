# Maintainer:  TEL.RED LLC <ask_at_tel_dt_red>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: stef312 <stef312_at_gmail_dot_com>
# Contributor: Gaspar de Elías <caspercba_at_hotmail_dot_com>
# Contributor: Artem Sheremet <dot_doom_at_gmail_dot_com>

pkgname=sky
pkgver=2.0.361
pkgrel=1
pkgdesc="Lync & Skype for business on Linux"

arch=(
    'x86_64'
#    'i686' 
)
if [[ $CARCH == 'x86_64' ]]; then
    _arch=64
elif [[ $CARCH == 'i686' ]]; then
    _arch=32
fi

url="http://tel.red"

license=('custom: Copyright © 2015 TEL.RED LLC')
options=('!strip')
install="${pkgname}.install"

depends=('openssl' 'nss' 'gstreamer0.10-base' 'libpulse' 'alsa-lib' 'v4l-utils' 
    'libxinerama' 'libxss' 'libxcb' 'gtk2' 'libxmu')
optdepends=('ibus: Intelligent Input Bus (IBus) support')
makedepends=('binutils' 'chrpath')

source_x86_64=("http://tel.red/linux/sky_ubuntu64_v${pkgver}.deb")
source_i686=("http://tel.red/linux/sky_ubuntu32_v${pkgver}.deb")

sha256sums_x86_64=('edbd62fc35145b45c621005feb1cdccfeffcdcb5b23d07ea93950db11694c737')

package() {
    cd "${srcdir}"
    ar x "sky_ubuntu${_arch}_v${pkgver}.deb" >/dev/null
    tar -zxf data.tar.gz

    local icu_libs
    icu_libs="libicudata libicudata libicudata libicule libiculx libicutest 
        libicutu libicuuc libicui18n libicuio"

    # fix broken rpaths of bundled icu libs
    chrpath -d "${srcdir}"/opt/sky_linux/sky
    for lib in libsipw ${icu_libs}; do
        chrpath -d "${srcdir}"/opt/sky_linux/lib/${lib}.so*
    done
    
    cp -rf "${srcdir}/etc" "${pkgdir}/"
    install -Dm 644 "${srcdir}/usr/share/applications/sky.desktop" "${pkgdir}/usr/share/applications/sky.desktop"
    install -Dm 644 "${srcdir}/usr/share/pixmaps/sky.png" "${pkgdir}/usr/share/pixmaps/sky.png"
    mv "${srcdir}/opt" "${pkgdir}/"
    find "${pkgdir}/" -type d -exec chmod 0755 {} \;
    find "${pkgdir}/" -type f -exec chmod go-w {} \;

    mkdir -m 755 "${pkgdir}/usr/bin"
    ln -sr "${pkgdir}/opt/sky_linux/sky.sh" "${pkgdir}/usr/bin/sky"
}

# vim: set ts=2 sw=2 ft=sh noet:
