# Maintainer: BrLi <brli at chakralinux dot org>

pkgname=zettlr
pkgver=1.7.5
pkgrel=3
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url='https://www.zettlr.com'
license=('GPL' 'custom') # Noted that the icon and name are copyrighted
depends=(electron9 ttf-webhostinghub-glyphs otf-crimson-text)
makedepends=(yarn git gulp)
optdepends=('pandoc: For exporting to various format'
            'texlive-bin: For Latex support'
            'ttf-lato: Display output in a more comfortable way')
_commit=0c4a2c21ca08464127dcc11dedf9117eb57b7bac # v1.7.5^0
source=(git+https://github.com/Zettlr/Zettlr.git#commit="${_commit}")
sha1sums=('SKIP')

prepare() {
    cd "${srcdir}/Zettlr"

    # We don't build electron and friends, and don't depends on postinstall script
    sed '/^\s*\"electron.*$/d;/postinstall/d' -i package.json

    # Add some close-to-complete translations
    sed "s/'fr-FR'/'fr-FR','ja-JP','zh-CN','es-ES','ru-RU'/" -i scripts/refresh-language.js
}

build() {
    cd "${srcdir}/Zettlr"
    local NODE_ENV=''
    yarn install --pure-lockfile \
                 --no-bin-links \
                 --cache-folder "${srcdir}/cache" \
                 --link-folder "${srcdir}/link" \
                 --ignore-scripts
    yarn less
    yarn handlebars
    yarn lang:refresh
    yarn reveal:build
    NODE_ENV=production node node_modules/webpack/bin/webpack.js --progress --colors

    cd "${srcdir}/Zettlr/source"
    yarn install --pure-lockfile --cache-folder "${srcdir}/cache"

    # Aggressively remove binary and useless files in node_modules
    find . -type d -name "fonts" -exec rm -rfv {} +
    find . -iname "CHANGELOG*" -exec rm -rfv {} +
    find . -iname "README*" -exec rm -rfv {} +
    find . -iname "*.md" -exec rm -rfv {} +
    find . -iname "*test*" -exec rm -rfv {} +
    find . -iname "license*" -exec rm -rfv {} +
    find . -iname ".*" -exec rm -rfv {} + || true
    find . -name "yarn.lock" -exec rm -rfv {} +
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

    cd "${srcdir}/Zettlr/source"  
    # Fix pacman warning about reference to $srcdir
    sed "s,${srcdir}/Zettlr/source,${_destdir},g" -i renderer/assets/vue/vue-sidebar.js
    cp -r --no-preserve=ownership --preserve=mode ./* "${pkgdir}/${_destdir}/"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
exec electron9 /${_destdir} "\$@"
END

    # install icons of various sizes to hi-color theme
    for px in 16 24 32 48 64 96 128 256 512; do
        install -Dm644 "${srcdir}/Zettlr/resources/icons/png/${px}x${px}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${px}x${px}/apps/${pkgname}.png"
    done

    # install legal notice
    install -Dm644 "${srcdir}/Zettlr/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/README"
    install -Dm644 "${srcdir}/Zettlr/resources/icons/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/icon/README"

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
}
