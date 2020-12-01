# Maintainer: BrLi <brli at chakralinux dot org>

pkgname=zettlr
pkgver=1.8.0
pkgrel=4
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
        # Fix language files search path
        fix-lang-search-path.patch::https://github.com/Zettlr/Zettlr/pull/1466.patch
        # citation style
        https://github.com/citation-style-language/locales/archive/master.zip
        https://raw.githubusercontent.com/citation-style-language/styles/master/chicago-author-date.csl
        # Chinese(Taiwan) translation
        https://github.com/Brli/zetter-zh-TW/raw/master/zh-TW.json)
        # translations
sha256sums=('SKIP'
            '906041fbf93b1533dc14733ce5214df306f161519e55e79881ce237835b865bf'
            '4a3b89033d6bbb669a7d046d23224dc3eaaa2840cc8a5dd2c5d6201a61e3f1a1'
            '2b7cd6c1c9be4add8c660fb9c6ca54f1b6c3c4f49d6ed9fa39c9f9b10fcca6f4'
            '81730193afc64908f820020a19bfeda4475c67ada92e8567a39c9313a3d65ff0')
for _l in ${_lang[@]}; do
    source+=(https://translate.zettlr.com/download/${_l}.json)
    sha256sums+=('SKIP')
done

prepare() {
    cd "${srcdir}/Zettlr"

    # regression introduced in e5d807a36dd9fd952449afe1aa19ad9bfec4b690
    patch -Np1 -i ${srcdir}/fix-lang-search-path.patch

    # pandoc citeproc argument deprecation
    sed 's,--filter pandoc-citeproc,--citeproc,' -i source/main/modules/export/run-pandoc.js
    
    # LaTeX Error: Environment CSLReferences undefined.
    sed 's,cslreferences,CSLReferences,' -i source/main/assets/export.tex

    # We don't build electron and friends, and don't depends on postinstall script
    sed '/^\s*\"electron-notarize.*$/d;/^\s*\"electron-builder.*$/d;/postinstall/d' -i package.json

    # npm/yarn failed with the ^head...
    sed 's/\^10.1.5/10.1.5/' -i package.json

    # lang:refresh from package.json
    for _l in ${_lang[@]}; do
        cp "${srcdir}/${_l}.json" source/common/lang/
    done

    # manually add community translation
    cp "${srcdir}/zh-TW.json" source/common/lang/

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
    # failed without deb or rpm anyway, we just want the outcome
    node node_modules/.bin/electron-forge package || true
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

    cd "${srcdir}/Zettlr/out/Zettlr-linux-x64/"

    # copy the generated electron project
    cp -r --no-preserve=ownership --preserve=mode ./* "${pkgdir}/${_destdir}/"
    
    # symlink to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/${_destdir}/Zettlr" "${pkgdir}/usr/bin/zettlr"

#    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
#exec electron /${_destdir} "\$@"
#END

    # install icons of various sizes to hi-color theme
    for px in 16 24 32 48 64 96 128 256 512; do
        install -Dm644 "${srcdir}/Zettlr/resources/icons/png/${px}x${px}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${px}x${px}/apps/${pkgname}.png"
    done

    # generate freedesktop entry files, aligned with description in package.json and forge.config.js
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
