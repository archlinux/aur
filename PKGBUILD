# Maintainer: gbr <gbr@protonmail.com>
# Contributor: Karmenzind
pkgname=otf-nerd-fonts-monacob-mono
pkgver=3.0.0
pkgrel=1
pkgdesc='MonacoB fonts patched with nerd-fonts'
arch=('any')
url='https://github.com/vjpr/monaco-bold'
license=('custom:Apple')
depends=()
makedepends=('fontforge' 'subversion')
source=('COPYRIGHT'
        'monacob-font-patcher.py'
        'monaco-bold::git+https://github.com/vjpr/monaco-bold.git#commit=b77db4b6fc2e9df074f8db59cead862d7068e3d7'
        "nerd-fonts-glyphs-${pkgver}::svn+https://github.com/ryanoasis/nerd-fonts/tags/v${pkgver}/src/glyphs"
        "FontnameParser-${pkgver}.py::https://github.com/ryanoasis/nerd-fonts/raw/v${pkgver}/bin/scripts/name_parser/FontnameParser.py"
        "FontnameTools-${pkgver}.py::https://github.com/ryanoasis/nerd-fonts/raw/v${pkgver}/bin/scripts/name_parser/FontnameTools.py"
        "font-patcher-${pkgver}.py::https://github.com/ryanoasis/nerd-fonts/raw/v${pkgver}/font-patcher")
sha256sums=('4a9d48f5368ca3b5699f61c505412a8d734a57c5da00ac0ac5ea70881f615ef3'
            '153b3fcf2d418582d5293a50d8bf3e17f9f500db5633b7927a1921d4527b158d'
            'SKIP'
            'SKIP'
            '9032624043bd7738b4f8ef2538c9b0ca2058f3d44fae7f5386adbd46959b31a6'
            '9d1403fd270ae0a6d729e2f7acb5877dd4912756dc2af9665edcd366ecb37f31'
            '68958b6d6ab1acf73196d3f1fa8ae3e8c49f970ba565ff47add4323628455a52')

prepare() {
    mkdir -p "${srcdir}/monaco-patched"
    find "${srcdir}/monaco-bold" -type f -name '*.otf' |
        xargs python3 "${srcdir}/monacob-font-patcher.py" \
        --output-dir "${srcdir}/monaco-patched" 2> /dev/null

    # set up nerd fonts' font-patcher script and its dependencies
    mkdir -p "${srcdir}/nerd-fonts-${pkgver}/bin/scripts/name_parser"
    ln -sf "${srcdir}/FontnameParser-${pkgver}.py" "${srcdir}/nerd-fonts-${pkgver}/bin/scripts/name_parser/FontnameParser.py"
    ln -sf "${srcdir}/FontnameTools-${pkgver}.py" "${srcdir}/nerd-fonts-${pkgver}/bin/scripts/name_parser/FontnameTools.py"
    ln -sf "${srcdir}/font-patcher-${pkgver}.py" "${srcdir}/nerd-fonts-${pkgver}/font-patcher.py"

    # set up glyphs
    mkdir -p "${srcdir}/nerd-fonts-${pkgver}/src"
    ln -sf "${srcdir}/nerd-fonts-glyphs-${pkgver}" "${srcdir}/nerd-fonts-${pkgver}/src/glyphs"
}

build() {
    mkdir -p "${srcdir}/nerd-patched"
    find "${srcdir}/monaco-patched" -type f -name '*.otf' \
        -exec fontforge -script "${srcdir}/nerd-fonts-${pkgver}/font-patcher.py" {} \
        --mono --careful --complete --progressbars --outputdir "${srcdir}/nerd-patched" \;
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d "${pkgdir}/usr/share/fonts/monacob"
    install -Dm644 "${srcdir}/nerd-patched/"*.otf "${pkgdir}/usr/share/fonts/monacob"
    install -Dm644 "${srcdir}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}"
}
