# Maintainer: BrLi <brli at chakralinux dot org>
# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Decide whether to include pandoc binary into zettlr package
# Default to false, the application will use Arch's pandoc
_bundle_pandoc=false

pkgname=zettlr
pkgver=2.0.3
pkgrel=1
pkgdesc="A markdown editor for writing academic texts and taking notes"
arch=('x86_64')
url='https://www.zettlr.com'
license=('GPL' 'custom') # Noted that the icon and name are copyrighted
depends=(electron 'nodejs>=14.0.0')
makedepends=(git yarn)
optdepends=('pandoc: For exporting to various format'
            'texlive-bin: For Latex support'
            'ttf-lato: Display output in a more comfortable way')
_csl_locale_commit=d5ee85de8e74d4109509014758b6f496a968ff03 # Oct 20, 2021
_csl_style_commit=ccb71844fdafb2b7a48cccb364f4b4c03d3cdce6  # Sep 19, 2021
_pandoc_binary_ver=2.16.1 # check scripts/get-pandoc.sh for update
options=(!strip)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Zettlr/Zettlr/archive/v${pkgver}.tar.gz"
        '0001-Do-not-download-pandoc.patch'
        # citation style
        "locales-${pkgver}-${pkgrel}.zip::https://github.com/citation-style-language/locales/archive/${_csl_locale_commit}.zip"
        "chicago-author-date-${pkgver}-${pkgrel}.csl::https://github.com/citation-style-language/styles/raw/${_csl_style_commit}/chicago-author-date.csl")
sha256sums=('e3c7b3e12b43c3749ec7ad8b33ed453fcabbf03e9741f817ba093e91fd87a1f5'
            'a0fe981dade0ce52be190d8e8a2fd7f6c05c32c7d44d96c63f6f494460d483ef'
            '6e6d0ff9e0d62d25606475752a6db8ee6143f735d5c95400b8f55bff523de182'
            '1455e57b314fd13ba155f4ab93f061e3e6393c13cd0f16380adb9d73614f7930')
if ${_bundle_pandoc} ; then
    # pandoc binary source
    source+=("https://github.com/jgm/pandoc/releases/download/${_pandoc_binary_ver}/pandoc-${_pandoc_binary_ver}-linux-amd64.tar.gz")
    sha256sums+=('3fe3d42179af289d4f5452b9317d2bc9cd139a4f33a37f68d70e128f1d415aa4')
fi

prepare() {
    cd "Zettlr-${pkgver}"
    
    patch -Np1 -i $srcdir/0001-Do-not-download-pandoc.patch

    # csl:refresh from package.json
    find "${srcdir}/locales-$_csl_locale_commit" -name "*.xml" \
        -exec cp {} static/csl-locales/ \;
    cp "${srcdir}/locales-$_csl_locale_commit/locales.json" static/csl-locales/
    cp "${srcdir}/chicago-author-date-${pkgver}-$pkgrel.csl" static/csl-styles/chicago-author-date.csl

if ${_bundle_pandoc} ; then
    # Put pandoc binary in place
    cp "${srcdir}/pandoc-${_pandoc_binary_ver}/bin/pandoc" resources/pandoc-linux-x64
    ln -sf pandoc-linux-x64 resources/pandoc
else
    # Using Arch's pandoc, need to fake a link
    ln -sf /usr/bin/pandoc resources/pandoc-linux-x64
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

    # Remove resources for other OSs and leftovers
    cd "${srcdir}/Zettlr-${pkgver}/resources"
    rm -rfv NSIS
    rm -rfv icons/dmg
    rm -rfv icons/*icns
    rm -rfv icons/*.ico
    rm -rfv screenshots
    rm -r .gitignore

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
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/Zettlr" <<END
#!/bin/sh
exec electron /${_destdir} "\$@"
END

    # install icons of various sizes to hi-color theme
    for px in 16 24 32 48 64 96 128 256 512 1024; do
        install -Dm644 "${srcdir}/Zettlr-${pkgver}/resources/icons/png/${px}x${px}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${px}x${px}/apps/Zettlr.png"
    done

    # generate freedesktop entry files, aligned with description in package.json and forge.config.js
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/Zettlr.desktop" <<END
[Desktop Entry]
Name=Zettlr
Comment=A powerful Markdown Editor with integrated tree view
Exec=Zettlr %U
Terminal=false
Type=Application
Icon=Zettlr
StartupWMClass=Zettlr
MimeType=text/markdown;
Categories=Office;
END

    # generate mimetype configuration file to associate with zettlr
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/mime/packages/Zettlr.xml" <<END
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
