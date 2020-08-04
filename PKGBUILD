# Maintainer: BrLi <brli at chakralinux dot org>

pkgname=zettlr
pkgver=1.7.4
pkgrel=1
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url='https://www.zettlr.com'
license=('GPL' 'custom')
depends=(electron ttf-webhostinghub-glyphs otf-crimson-text)
makedepends=(yarn git gulp)
optdepends=('pandoc: For exporting to various format'
            'texlive-bin: For Latex support'
            'ttf-lato: Display output in a more comfortable way')
_commit=8b08c0249bf7946ccd2809d81b8c827470f4ee86 # v1.7.4^0
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
    yarn install --pure-lockfile --no-bin-links --cache-folder "${srcdir}/cache" --link-folder "${srcdir}/link"
    yarn less
    yarn handlebars
    yarn lang:refresh
    yarn reveal:build
    NODE_ENV=production node node_modules/webpack/bin/webpack.js --progress --colors

    cd "${srcdir}/Zettlr/source"
    yarn install --pure-lockfile --cache-folder "${srcdir}/cache"

    # Aggressively remove binary and addins in node_modules
    find . -type d -name "fonts" -exec rm -rfv {} +
    find . -name "\.bin" -exec rm -rfv {} +
    find . -name "\.gitignore" -exec rm -rfv {} +
    find . -name "\.eslintrc*" -exec rm -rfv {} +
    find . -name "\.npmignore" -exec rm -rfv {} +
    find . -name "\.yarn*" -exec rm -rfv {} +
    find . -name "\.travis.yml" -exec rm -rfv {} +
    find . -name "\.tonic_example.js" -exec rm -rfv {} +
    find . -name "\.prettierrc.js" -exec rm -rfv {} +
    find . -name "\.coveralls.yml" -exec rm -rfv {} +
    find . -name "\.jscs.json" -exec rm -rfv {} +
    find . -name "\.babelrc.js" -exec rm -rfv {} +
    find . -name "\.vscode" -exec rm -rfv {} +
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
    sed "s,${srcdir}/Zettlr/source,${_destdir},g" -i renderer/assets/vue/vue-sidebar.js
    cp -r --no-preserve=ownership --preserve=mode ./* "${pkgdir}/${_destdir}/"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
exec electron /${_destdir} "\$@"
END

    # install icons of vary sizes to hi-color theme
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
