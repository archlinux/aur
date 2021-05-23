# Maintainer: BrLi <brli at chakralinux dot org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

_bundle_pandoc=true

pkgname=zettlr
pkgver=1.8.9
pkgrel=1
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url='https://www.zettlr.com'
license=('GPL' 'custom') # Noted that the icon and name are copyrighted
depends=(electron)
makedepends=(git yarn)
optdepends=('pandoc: For exporting to various format'
            'texlive-bin: For Latex support'
            'ttf-lato: Display output in a more comfortable way')
_csl_locale_commit=bd8d2dbc85713b192d426fb02749475df30f0d2c # April 21, 2021
_csl_style_commit=1e63dfef3bb8fa695d5a8786ec979a71e7cc118a
_pandoc_binary_ver=2.11.3.2 # check scripts/get-pandoc.sh for update
options=(!strip)
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Zettlr/Zettlr/archive/v${pkgver}.tar.gz"
        # citation style
        "locales-${pkgver}-${pkgrel}.zip::https://github.com/citation-style-language/locales/archive/${_csl_locale_commit}.zip"
        "chicago-author-date-${pkgver}-${pkgrel}.csl::https://github.com/citation-style-language/styles/raw/${_csl_style_commit}/chicago-author-date.csl")
sha256sums=('351b579c2c42f2f1836e9882a27e0497c862857a826231b5067c1204d9b846b4'
            '8ebd67f265760cdcd450237ff109ee7334abaaf61eb26a2dfe917a5bd1f3c59d'
            '2b7cd6c1c9be4add8c660fb9c6ca54f1b6c3c4f49d6ed9fa39c9f9b10fcca6f4')
if ${_bundle_pandoc} ; then
    # pandoc binary
    source+=("https://github.com/jgm/pandoc/releases/download/${_pandoc_binary_ver}/pandoc-${_pandoc_binary_ver}-linux-amd64.tar.gz")
    sha256sums+=('422c1f38b4731edfafcc0f8011a8dc46ce3a84e61b896ef15e3a23e0a9b453d6')
fi

prepare() {
    cd "Zettlr-${pkgver}"

    # csl:refresh from package.json
    find "${srcdir}/locales-$_csl_locale_commit" -name "*.xml" \
        -exec cp {} source/app/service-providers/assets/csl-locales/ \;
    cp "${srcdir}/locales-$_csl_locale_commit/locales.json" source/app/service-providers/assets/csl-locales/
    cp "${srcdir}/chicago-author-date-${pkgver}-$pkgrel.csl" source/app/service-providers/assets/csl-styles/chicago-author-date.csl

if ${_bundle_pandoc} ; then
    # Put pandoc binary in place
    cp "${srcdir}/pandoc-${_pandoc_binary_ver}/bin/pandoc" resources/pandoc
else
    # Fake pandoc
    ln -sf /usr/bin/pandoc resources/pandoc
fi
}

build() {
    cd "Zettlr-${pkgver}"
    local NODE_ENV=''
    yarn install --cache-folder "${srcdir}/cache" \
                 --link-folder "${srcdir}/link"
    yarn reveal:build

    node node_modules/.bin/electron-forge package

    # Remove fonts
    cd "${srcdir}/Zettlr-${pkgver}/.webpack"
    find . -type d -name "fonts" -exec rm -rf {} +

    # Remove resources for other OSs
    cd "${srcdir}/Zettlr-${pkgver}/resources"
    rm -rfv NSIS
    rm -rfv icons/dmg
    rm -rfv icons/*icns
    rm -rfv icons/*.ico
}

# check() {
#     cd "${srcdir}/Zettlr-${pkgver}"
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

    cd "${srcdir}/Zettlr-${pkgver}"

    # Copy the generated electron project
    cp -r --no-preserve=ownership --preserve=mode ./.webpack "${pkgdir}/${_destdir}/"
    cp -r --no-preserve=ownership --preserve=mode ./resources "${pkgdir}/${_destdir}/"
    cp -r --no-preserve=ownership --preserve=mode ./package.json "${pkgdir}/${_destdir}/"

    # Install start script to /usr/bin
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
exec electron /${_destdir} "\$@"
END

    # install icons of various sizes to hi-color theme
    for px in 16 24 32 48 64 96 128 256 512; do
        install -Dm644 "${srcdir}/Zettlr-${pkgver}/resources/icons/png/${px}x${px}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${px}x${px}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/Zettlr-${pkgver}/resources/icons/1024x1024.png" \
        "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/${pkgname}.png"


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

    # generate mimetype configuration file to associate with zettlr
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/mime/packages/${pkgname}.xml" <<END
<?xml version="1.0" encoding="utf-8"?>
<mime-info xmlns="http://www.freedesktop.org/standards/shared-mime-info">
    <mime-type type="text/markdown">
        <glob pattern="*.md"/>
            <comment>Markdown document</comment>
        <icon name="x-office-document" />
    </mime-type>
    <mime-type type="text/markdown">
        <glob pattern="*.markdown"/>
            <comment>Markdown document</comment>
        <icon name="x-office-document" />
    </mime-type>
    <mime-type type="text/markdown">
        <glob pattern="*.rmd"/>
            <comment>RMarkdown document</comment>
        <icon name="x-office-document" />
    </mime-type>
</mime-info>
END

    # license
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" "${srcdir}/Zettlr-${pkgver}/LICENSE"
}
