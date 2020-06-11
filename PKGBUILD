# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail> 

# check the latest version with:
# $ curl -sL https://dl.google.com/linux/earth/deb/dists/stable/main/binary-amd64/Packages | grep -Pom1 'Version: \K[^-]*'

pkgname=google-earth-pro
pkgver=7.3.3.7721
pkgrel=1
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
source=("https://dl.google.com/linux/earth/deb/pool/main/g/google-earth-pro-stable/google-earth-pro-stable_${pkgver}-r0_amd64.deb"
        'Google-Terms-of-Service.html'::'https://www.google.com/intl/ALL/policies/terms/index.html'
        'Google-Earth-Additional-Terms-of-Service.html'::'https://www.google.com/help/terms_maps.html'
        'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html'::'https://www.google.com/help/legalnotices_maps.html'
        'Google-Privacy-Policy.html'::'https://www.google.com/intl/ALL/policies/privacy/index.html')
noextract=("google-earth-pro-stable_${pkgver}-r0_amd64.deb")
sha256sums=('db3f4b224426789ffb8d76a5f64126f8a2822bc42d30da162ac05d039047a152'
            '039d02e31f5d8c7b0e055629339083ef933d69bb2124ec7179cc83b12248e598'
            '0951a7fb0ee303479d4e27f52ca6c37dd709fb490bf4eea6e5a977c71b622d11'
            '024e0c690c1f26313c7b7a1fe532cc75e2431321673917d12396eafa94031e16'
            '25a29c2d686b6d45a285341bdd486ecf8233b153f1f9f62fadf30cc7774a4494')

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
}
