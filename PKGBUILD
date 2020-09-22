# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nightpdf-git
pkgver=0.2.1.r10.g9ab6f45
pkgrel=1
pkgdesc='Dark mode PDF reader (git version)'
arch=('any')
url='https://github.com/joeloya/NightPDF/'
license=('custom:WTFPL')
depends=('sh' 'electron' 'hicolor-icon-theme')
makedepends=('git')
provides=('nightpdf')
conflicts=('nightpdf')
source=('git+https://github.com/joeloya/NightPDF.git'
        'nightpdf.sh'
        'nightpdf.desktop')
sha256sums=('SKIP'
            'cef2a1e472a922bc7a93a5ad9b380821a7588ed1b89d89c3a8e8544d675eb63d'
            '1eb70aff787a3a18fb2d5f8f3efabefd4ee0f9a8ec0fdac02c2c25decc5c31b3')

pkgver() {
    git -C NightPDF describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

package() {
    install -D -m755 nightpdf.sh "${pkgdir}/usr/bin/nightpdf"
    install -D -m644 nightpdf.desktop -t "${pkgdir}/usr/share/applications"
    install -D -m644 NightPDF/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 NightPDF/{app.js,package.json} -t "${pkgdir}/usr/share/nightpdf"
    cp -a NightPDF/app "${pkgdir}/usr/share/nightpdf"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(file -S "$_file" | grep -o '[0-9]*[[:space:]]x[[:space:]][0-9]*,' | awk '{ print $1 }')"
        
        # skip duplicated icons
        [ -d "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}" ] && continue
            
        mkdir -p "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/nightpdf.png"
    done < <(find NightPDF/build/icon.iconset -type f -name '*.png' -print0)
}
