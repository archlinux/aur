# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail> 

# check the latest version with:
# $ curl -sL https://dl.google.com/linux/earth/deb/dists/stable/main/binary-amd64/Packages | grep -Pom1 'Version: \K[^-]*'

pkgname=google-earth-pro
pkgver=7.3.4.8642
pkgrel=1
pkgdesc='3D interface to explore the globe, terrain, streets, buildings and other planets (Pro version)'
arch=('x86_64')
url='https://www.google.com/earth/'
license=('custom')
depends=(
    'alsa-lib'
    'curl'
    'desktop-file-utils'
    'fontconfig'
    'glu'
    'gst-plugins-base-libs'
    'hicolor-icon-theme'
    'libcups'
    'libsm'
    'libproxy'
    'libxi'
    'libxrender'
)
provides=('google-earth')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=("https://dl.google.com/linux/earth/deb/pool/main/g/google-earth-pro-stable/google-earth-pro-stable_${pkgver}-r0_amd64.deb"
        'Google-Terms-of-Service.html'::'https://www.google.com/intl/ALL/policies/terms/index.html'
        'Google-Earth-Additional-Terms-of-Service.html'::'https://www.google.com/help/terms_maps.html'
        'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html'::'https://www.google.com/help/legalnotices_maps.html'
        'Google-Privacy-Policy.html'::'https://www.google.com/intl/ALL/policies/privacy/index.html')
noextract=("google-earth-pro-stable_${pkgver}-r0_amd64.deb")
sha256sums=('f1db3df1c5c10e337f5e8ef89edf18dad787ee550a1299269ecd5e7f8ecb8af7'
            '173a2b3d3cfea51be7290af998e3bb00fbd20124e1a9d55a5f3061528f02debd'
            '0fdf422e7d7074a0b463576e8e899cb060405eadc7bf8e647a8721aaabbf86cb'
            '43026109d341f8356bf806a394fccc796a6f17117323cf7a83284fbe0857d7ba'
            'bcae23abbf1d10bde77221d001547c050df45ea5f7dbf756437303a2ecd53153')

_installdir='/opt/google/earth/pro'

prepare() {
    mkdir -p "${pkgname}-${pkgver}"
    bsdtar -xf "google-earth-pro-stable_${pkgver}-r0_amd64.deb" -C "${pkgname}-${pkgver}"
}

package() {
    bsdtar -xf "${pkgname}-${pkgver}/data.tar.xz" -C "$pkgdir"
    
    # desktop file
    mv "${pkgdir}/${_installdir}/google-earth-pro.desktop" "${pkgdir}/usr/share/applications"
    
    # icons
    local _res
    for _res in 16 22 24 32 48 64 128 256
    do
        install -D -m644 "${pkgdir}/${_installdir}/product_logo_${_res}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/google-earth-pro.png"
    done
    
    # remove the debian-intended cron job and duplicated images
    rm -r "${pkgdir}/etc/cron.daily" "${pkgdir}/${_installdir}"/product_logo_*.png
    
    # fix search
    sed -i '/googleearth-bin/s/^/LC_NUMERIC=en_US.UTF-8 /' "${pkgdir}/${_installdir}/googleearth"

    # licenses
    local _file
    for _file in 'Google-Terms-of-Service.html' \
                 'Google-Earth-Additional-Terms-of-Service.html' \
                 'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html' \
                 'Google-Privacy-Policy.html'
    do
        install -D -m644 "$_file" "${pkgdir}/usr/share/licenses/${pkgname}/${_file}"
    done

    # Remove SGID
    chmod -R 'a-s' "${pkgdir}"
}
