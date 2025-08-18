# Maintainer: Kimiblock Moe

# Original PKGBUILD from aur/google-earth-pro

# Maintainer:  Iyán Méndez Veiga <me (at) iyanmv (dot) com>
# Contributor: Daniel Bermond <dbermond@archlinux.org>
# Contributor: Det <nimetonmaili g-mail> 

# check the latest version with:
# $ curl -sL https://dl.google.com/linux/earth/deb/dists/stable/main/binary-amd64/Packages | grep -Pom1 'Version: \K[^-]*'

pkgname=google-earth-pro-portable
pkgver=7.3.6.10201
pkgrel=2
pkgdesc="3D interface to explore the globe, terrain, streets, buildings and other planets (Pro version)"
arch=(x86_64)
url="https://www.google.com/earth/"
license=(LicenseRef-Google-custom)
depends=()
provides=(google-earth google-earth-pro)
conflicts=(google-earth google-earth-pro)
options=('!strip' '!emptydirs')
source=(
    "https://dl.google.com/linux/earth/deb/pool/main/g/google-earth-pro-stable/google-earth-pro-stable_${pkgver}-r0_amd64.deb"
    'Google-Terms-of-Service.html'::'https://www.google.com/intl/ALL/policies/terms/index.html'
    'Google-Earth-Additional-Terms-of-Service.html'::'https://www.google.com/help/terms_maps.html'
    'Legal-Notices-for-Google-Earth-and-Google-Earth-APIs.html'::'https://www.google.com/help/legalnotices_maps.html'
    'Google-Privacy-Policy.html'::'https://www.google.com/intl/ALL/policies/privacy/index.html'
    'portable-config'
    'desktop.file'
)
noextract=("google-earth-pro-stable_${pkgver}-r0_amd64.deb")
b2sums=(
    'SKIP'
    'SKIP'
    'SKIP'
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
    depends+=(
    portable
    libcups
    libsm
    libproxy
    libxi
    libxml2-legacy
    libxrender
    sqlite
    alsa-lib
    desktop-file-utils
    fontconfig
    glu
    gst-plugins-base-libs
    hicolor-icon-theme
    )
    bsdtar -xf "${pkgname}-${pkgver}/data.tar.xz" -C "$pkgdir"
    
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
    rm -rf "${pkgdir}/usr/bin"
    rm -rf "${pkgdir}/usr/share/applications"
    rm -rf "${pkgdir}/usr/share/menu"
    install -Dm644 \
        "${srcdir}/desktop.file" \
        "${pkgdir}/usr/share/applications/com.google.EarthPro.desktop"
    install -Dm755 \
        "${srcdir}/portable-config" \
        "${pkgdir}/usr/lib/portable/info/com.google.EarthPro/config"
}

