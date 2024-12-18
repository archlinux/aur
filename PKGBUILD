# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail> 

# check the latest version with:
# $ curl -sL https://dl.google.com/linux/earth/deb/dists/stable/main/binary-amd64/Packages | grep -Pom1 'Version: \K[^-]*'

pkgname=google-earth-pro
pkgver=7.3.6.10155
pkgrel=1
pkgdesc='3D interface to explore the globe, terrain, streets, buildings and other planets (Pro version)'
arch=('x86_64')
url='https://www.google.com/earth/'
license=('custom')
depends=(
    'alsa-lib'
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
    'sqlite'
)
provides=('google-earth')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
source=(
    "https://dl.google.com/linux/earth/deb/pool/main/g/google-earth-pro-stable/google-earth-pro-stable_${pkgver}-r0_amd64.deb"
    'Google-Terms-of-Service.html'::'https://www.google.com/intl/ALL/policies/terms/index.html'
    'Google-Earth-Additional-Terms-of-Service.html'::'https://www.google.com/help/terms_maps.html'
    'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html'::'https://www.google.com/help/legalnotices_maps.html'
    'Google-Privacy-Policy.html'::'https://www.google.com/intl/ALL/policies/privacy/index.html'
)
noextract=("google-earth-pro-stable_${pkgver}-r0_amd64.deb")
b2sums=(
    '137f9f62b27b99403e16eb66c58878d07743d882c081195c146772e7647c74f853bc62da99209e3c5d25280ea59a95044cab9beffc344bee95287e13378408df'
    'SKIP'
    'SKIP'
    'SKIP'
    'SKIP')

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
