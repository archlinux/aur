# Maintainer: BrLi <brli at chakralinux dot org>

pkgname=zettlr
pkgver=1.8.0
pkgrel=2
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url='https://www.zettlr.com'
license=('GPL' 'custom') # Noted that the icon and name are copyrighted
depends=(electron ttf-webhostinghub-glyphs otf-crimson-text)
makedepends=(yarn git gulp)
optdepends=('pandoc: For exporting to various format'
            'texlive-bin: For Latex support'
            'ttf-lato: Display output in a more comfortable way')
options=('!strip')
_commit=b7165b4c3e69cec8c62b7203df41fcbeb91d178d # 1.8.0^0
_lang=('de-DE' 'en-GB' 'en-US' 'fr-FR' 'ja-JP' 'zh-CN' 'es-ES' 'ru-RU')
source=(git+https://github.com/Zettlr/Zettlr.git#commit="${_commit}"
        # citation style
        https://github.com/citation-style-language/locales/archive/master.zip
        https://raw.githubusercontent.com/citation-style-language/styles/master/chicago-author-date.csl)
        # translations
for _l in ${_lang[@]}; do
    source+=(https://translate.zettlr.com/download/${_l}.json)
done
sha256sums=('SKIP'
            '4a3b89033d6bbb669a7d046d23224dc3eaaa2840cc8a5dd2c5d6201a61e3f1a1'
            '2b7cd6c1c9be4add8c660fb9c6ca54f1b6c3c4f49d6ed9fa39c9f9b10fcca6f4'
            '192b9db172cbc2f1e9e1c5f7aee4757f1ef960c851561c001fe877b92bf2fff2'
            '71bd0c5462dc7dbcc38e7d6f31eb7d0cfe7cfcb1291ce3d670da43195c98a460'
            'b7583049214837ae023495dc1264089f8f43c22d788b66ef2c31fadfcf911b19'
            'ccfd645e08d8cb25acd867209773305dd29a224e0496b5c4f1412651e1406406'
            '8c9a649286d4b7cb90c9481408de10ae6a1ae103340b46d1c10e7bfa4defd188'
            '1e6f2fa86679f1bbdb669acbc079b5b468a355ba1827f4ff8e81cba6148dc114'
            '8729104501d29682171c91cf8f095fa52967ef061dbaf7390fd57be88bd507bd'
            'c03aee051a159c32ad44ac6ead384343a0850112ba95663da2b390fd115806a4')

prepare() {
    cd "${srcdir}/Zettlr"

    # We don't build electron and friends, and don't depends on postinstall script
    sed '/^\s*\"electron-notarize.*$/d;/^\s*\"electron-builder.*$/d;/postinstall/d' -i package.json
    sed 's/\^10.1.5/10.1.5/' -i package.json

    # lang:refresh from package.json
    for _l in ${_lang[@]}; do
        cp "${srcdir}/${_l}.json" source/common/lang/
    done

    # csl:refresh from package.json
    cp $(find "${srcdir}/locales-master/" -name "*.xml") source/app/service-providers/assets/csl-locales/
    cp "${srcdir}/locales-master/locales.json" source/app/service-providers/assets/csl-locales/
    cp "${srcdir}/chicago-author-date.csl" source/app/service-providers/assets/csl-styles/

}

build() {
    cd "${srcdir}/Zettlr"
    local NODE_ENV=''
    yarn install --pure-lockfile \
                 --cache-folder "${srcdir}/cache" \
                 --link-folder "${srcdir}/link" \
                 --ignore-scripts
    yarn reveal:build

    cd "${srcdir}/Zettlr/source"
    yarn install --pure-lockfile --cache-folder "${srcdir}/cache"

    cd "${srcdir}/Zettlr"
    node node_modules/.bin/electron-forge make || true # always failed anyway, we just want the outcome .webpack directory

    cd "${srcdir}/Zettlr/.webpack"

    # remove fonts
    find . -type d -name "fonts" -exec rm -rfv {} +
}

# check() {
#     cd "${srcdir}/Zettlr"
#     # Require electron module to test
#     yarn add --cache-folder "${srcdir}/cache" --link-folder "${srcdir}/link" electron
#     # The "test" function in package.json
#     node node_modules/mocha/bin/mocha
#     # The "test-gui" function in package.json, not useful in our case
#     node scripts/test-gui.js
#     # Clean up
#     yarn remove electron
#     rm yarn.lock
#     rm node_modules/.bin -rf
# }

package() {
    local _destdir=usr/lib/"${pkgname}"
    install -dm755 "${pkgdir}/${_destdir}"

    cd "${srcdir}/Zettlr"

    # only copy the critical parts
    cp -r --no-preserve=ownership --preserve=mode ./package.json "${pkgdir}/${_destdir}/"
    cp -r --no-preserve=ownership --preserve=mode ./.webpack "${pkgdir}/${_destdir}/"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
exec electron /${_destdir} "\$@"
END

    # install icons of various sizes to hi-color theme
    for px in 16 24 32 48 64 96 128 256 512; do
        install -Dm644 "${srcdir}/Zettlr/resources/icons/png/${px}x${px}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${px}x${px}/apps/${pkgname}.png"
    done

    # generate freedesktop entry files
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<END
[Desktop Entry]
Name=Zettlr
Comment=A powerful Markdown Editor with integrated tree view
Exec=${pkgname} %U
Terminal=false
Type=Application
Icon=${pkgname}
StartupWMClass=Zettlr
MimeType=text/markdown;
Categories=Office;
END

    # license
    install -Dm644 "${srcdir}/Zettlr/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
