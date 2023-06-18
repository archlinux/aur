# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nightpdf
pkgver=2.0.3
pkgrel=1
pkgdesc='Dark mode PDF reader'
arch=('x86_64')
url='https://github.com/Lunarequest/NightPDF/'
license=('GPL2')
depends=('sh' 'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'gtk3' 'libcups' 'libdrm'
         'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'hicolor-icon-theme')
makedepends=('libxcrypt-compat' 'yarn')
source=("https://github.com/Lunarequest/NightPDF/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'nightpdf.sh'
        'nightpdf.desktop'
        '010-nightpdf-remove-unwanted-targets.patch')
sha256sums=('728fbfdca180c424c3764168f6b4e6177ceda37214a72e930eaf454c264d3fb3'
            '0984811e96d0350fc7c2a0cba279a96c24b671b240d2f9d5370ceece47530334'
            '1eb70aff787a3a18fb2d5f8f3efabefd4ee0f9a8ec0fdac02c2c25decc5c31b3'
            '4cf7cd9a7b19bd218cddf936ddf11b44560a177e5dc715fa107d9fe4bb736e62')

prepare() {
    patch -d "NightPDF-${pkgver}" -Np1 -i "${srcdir}/010-nightpdf-remove-unwanted-targets.patch"
}

build() {
    cd "NightPDF-${pkgver}"
    HOME="${srcdir}/.electron-gyp" yarn
    HOME="${srcdir}/.electron-gyp" yarn dist
}

package() {
    install -d -m755 "${pkgdir}/opt"
    install -D -m755 nightpdf.sh "${pkgdir}/usr/bin/nightpdf"
    install -D -m644 nightpdf.desktop -t "${pkgdir}/usr/share/applications"
    cp -dr --no-preserve='ownership' "NightPDF-${pkgver}/dist/linux-unpacked" "${pkgdir}/opt/nightpdf"
    
    local _file
    local _res
    while read -r -d '' _file
    do
        _res="$(file -S "$_file" | grep -o '[0-9]*[[:space:]]x[[:space:]][0-9]*,' | awk '{ print $1 }')"

        # skip duplicated icons
        [ -d "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}" ] && continue

        install -d -m755 "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps"
        install -D -m644 "$_file" "${pkgdir}/usr/share/icons/hicolor/${_res}x${_res}/apps/nightpdf.png"
    done < <(find "NightPDF-${pkgver}/build/icon.iconset" -type f -name '*.png' -print0)
}
