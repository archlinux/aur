# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=nightpdf
pkgver=3.0.0
pkgrel=1
pkgdesc='Dark mode PDF reader'
arch=('x86_64')
url='https://github.com/Lunarequest/NightPDF/'
license=('GPL-2.0-only')
depends=('sh' 'alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'glib2' 'gtk3' 'libcups' 'libdrm'
         'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon'
         'libxrandr' 'mesa' 'nspr' 'nss' 'pango' 'hicolor-icon-theme')
makedepends=('libxcrypt-compat' 'yarn')
source=("https://github.com/Lunarequest/NightPDF/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz"
        'nightpdf.sh'
        'nightpdf.desktop'
        '010-nightpdf-remove-unwanted-targets.patch')
sha256sums=('dd157fe873ed9df51ccdebf04cc23cf810dd0867c079ef7d9c733c3c8952b120'
            '0984811e96d0350fc7c2a0cba279a96c24b671b240d2f9d5370ceece47530334'
            '507f4eac993d1b818e8b44dc138d838a5ba7549e5fa0a2f87536ada0a39ee73a'
            'a88db4d53517ae3405b83fbaa78867b8193fc17fb452d0d9bc39993ece08e154')

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
