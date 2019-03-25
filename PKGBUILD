# Maintainer : Daniel Bermond < gmail-com: danielbermond >
# Contributor: Det <nimetonmaili g-mail> 

# check the latest version with:
# $ curl -sL https://dl.google.com/linux/earth/deb/dists/stable/main/binary-amd64/Packages | grep -Pom1 'Version: \K[^-]*'

pkgname=google-earth-pro
pkgver=7.3.2.5776
pkgrel=2
pkgdesc='3D interface to explore the globe, terrain, streets, buildings and other planets (Pro version)'
arch=('x86_64')
url='https://www.google.com/earth/'
license=('custom')
depends=('glu' 'hicolor-icon-theme' 'libsm' 'libxrender' 'libproxy'
         'gst-plugins-base-libs' 'libxi' 'fontconfig' 'alsa-lib' 'libcups'
         'desktop-file-utils')
optdepends=('catalyst-utils: For AMD Catalyst'
            'nvidia-utils: For the NVIDIA driver')
provides=('google-earth')
options=('!strip' '!emptydirs')
install="${pkgname}.install"
#source=("google-earth-pro-stable_${pkgver}_amd64.deb::https://dl.google.com/earth/client/current/google-earth-pro-stable_current_amd64.deb"
source=("https://dl.google.com/linux/earth/deb/pool/main/g/google-earth-pro-stable/google-earth-pro-stable_${pkgver}-r0_amd64.deb"
        'Google-Terms-of-Service.html'::'https://www.google.com/intl/ALL/policies/terms/index.html'
        'Google-Earth-Additional-Terms-of-Service.html'::'https://www.google.com/help/terms_maps.html'
        'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html'::'https://www.google.com/help/legalnotices_maps.html'
        'Google-Privacy-Policy.html'::'https://www.google.com/intl/ALL/policies/privacy/index.html')
noextract=("google-earth-pro-stable_${pkgver}-r0_amd64.deb")
sha256sums=('7084d3c760db472cefa89b06d0627e029d3c50be44b58020fd0ee57500ff4ab5'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

_installdir='/opt/google/earth/pro'

prepare() {
    mkdir "${pkgname}-${pkgver}"
    
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
        install -Dm644 "${pkgdir}/${_installdir}/product_logo_${_res}.png" \
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
}
