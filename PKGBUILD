# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nightpdf
pkgver=0.2.1
pkgrel=1
pkgdesc='Dark mode PDF reader'
arch=('any')
url='https://github.com/joeloya/NightPDF/'
#license=('custom:WTFPL') # license will change on next release
license=('ISC')
depends=('sh' 'electron' 'hicolor-icon-theme')
source=("https://github.com/joeloya/NightPDF/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'nightpdf.sh'
        'nightpdf.desktop')
sha256sums=('e95e2d50e389e9447c4339bd99d76451a355f02ee4da9e2d3db586b6586acd20'
            'cef2a1e472a922bc7a93a5ad9b380821a7588ed1b89d89c3a8e8544d675eb63d'
            '1eb70aff787a3a18fb2d5f8f3efabefd4ee0f9a8ec0fdac02c2c25decc5c31b3')

package() {
    install -D -m755 nightpdf.sh "${pkgdir}/usr/bin/nightpdf"
    install -D -m644 nightpdf.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 "NightPDF-${pkgver}/readme.license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "NightPDF-${pkgver}"/{app.js,package.json} -t "${pkgdir}/usr/share/${pkgname}"
    cp -a "NightPDF-${pkgver}/app" "${pkgdir}/usr/share/${pkgname}"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(file -S "$_file" | grep -o '[0-9]*[[:space:]]x[[:space:]][0-9]*,' | awk '{ print $1 }')"
        
        # skip duplicated icons
        [ -d "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}" ] && continue
            
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/nightpdf.png"
    done < <(find "NightPDF-${pkgver}/icon.iconset" -type f -name '*.png' -print0)
}
