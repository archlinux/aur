# Maintainer: BrLi <brli at chakralinux dot org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Decide whether to install pandoc binary
# Default to false, the application will use Arch's pandoc
_bundle_pandoc=false

pkgname=zettlr
pkgver=2.0.0
pkgrel=4
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url='https://www.zettlr.com'
license=('GPL' 'custom') # Noted that the icon and name are copyrighted
depends=(electron)
makedepends=(git yarn)
optdepends=('pandoc: For exporting to various format'
            'texlive-bin: For Latex support'
            'ttf-lato: Display output in a more comfortable way')
_csl_locale_commit=0cc3885f6100e26ac6c6d103efa6f3d7195fd21b # Oct 17, 2021
_csl_style_commit=3a6a0a7bc1410075c606e51cab45877cc76f1f69
_pandoc_binary_ver=2.14.2 # check scripts/get-pandoc.sh for update
options=(!strip)
install=install
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Zettlr/Zettlr/archive/v${pkgver}.tar.gz"
        '0001-Do-not-download-pandoc.patch'
        # citation style
        "locales-${pkgver}-${pkgrel}.zip::https://github.com/citation-style-language/locales/archive/${_csl_locale_commit}.zip"
        "chicago-author-date-${pkgver}-${pkgrel}.csl::https://github.com/citation-style-language/styles/raw/${_csl_style_commit}/chicago-author-date.csl")
sha256sums=('b23d3a7e802ff4be31dd4dfb43fb54272a3935aec665e09b79c4b369da80ae8f'
            '97d1e620226324a1b7e5571ca800286a62f17e3729b08383918be81b64530287'
            '9b3e987aefb10da8b2baadd06e751e978ea23dc7b6297802cbda0ec6806744e2'
            '1455e57b314fd13ba155f4ab93f061e3e6393c13cd0f16380adb9d73614f7930')
if ${_bundle_pandoc} ; then
    # pandoc binary
    source+=("https://github.com/jgm/pandoc/releases/download/${_pandoc_binary_ver}/pandoc-${_pandoc_binary_ver}-linux-amd64.tar.gz")
    sha256sums+=('1a0548b15255b1c11722f3d4e12fc7a652edf8c9a329a8458f1e765517aec1be')
fi

prepare() {
    cd "Zettlr-${pkgver}"

    # csl:refresh from package.json
    find "${srcdir}/locales-$_csl_locale_commit" -name "*.xml" \
        -exec cp {} static/csl-locales/ \;
    cp "${srcdir}/locales-$_csl_locale_commit/locales.json" static/csl-locales/
    cp "${srcdir}/chicago-author-date-${pkgver}-$pkgrel.csl" static/csl-styles/chicago-author-date.csl

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

    # Remove references to $srcdir
    find renderer -type f -name 'index.js.map' -exec sed -i "s,${srcdir}/Zettlr,/usr/lib/${pkgname},g" {} +

    # Remove resources for other OSs
    cd "${srcdir}/Zettlr-${pkgver}/resources"
    rm -rfv NSIS
    rm -rfv icons/dmg
    rm -rfv icons/*icns
    rm -rfv icons/*.ico

    # Remove fonts
    cd "${srcdir}/Zettlr-${pkgver}/static"
    rm -rf fonts
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
    cp -r --no-preserve=ownership --preserve=mode ./static "${pkgdir}/${_destdir}/"
    cp -r --no-preserve=ownership --preserve=mode ./package.json "${pkgdir}/${_destdir}/"

    # Install start script to /usr/bin
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/${pkgname}" <<END
#!/bin/sh
exec electron /${_destdir} "\$@"
END

    # install icons of various sizes to hi-color theme
    for px in 16 24 32 48 64 96 128 256 512 1024; do
        install -Dm644 "${srcdir}/Zettlr-${pkgver}/resources/icons/png/${px}x${px}.png" \
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
