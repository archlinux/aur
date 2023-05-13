# Maintainer: gbr <gbr@protonmail.com>
# Contributor: Karmenzind
pkgname=otf-nerd-fonts-monacob-mono
_commit=b77db4b6fc2e9df074f8db59cead862d7068e3d7
pkgver=3.0.1
pkgrel=2
pkgdesc='MonacoB fonts patched with nerd-fonts'
arch=('any')
url='https://github.com/vjpr/monaco-bold'
license=('custom:Apple')
makedepends=('fontforge')
source=('COPYRIGHT'
        'monacob-font-patcher.py'
        "monaco-bold-${_commit}.zip::https://github.com/vjpr/monaco-bold/archive/${_commit}.zip"
        "FontPatcher-${pkgver}.zip::https://github.com/ryanoasis/nerd-fonts/releases/download/v${pkgver}/FontPatcher.zip")
sha256sums=('4a9d48f5368ca3b5699f61c505412a8d734a57c5da00ac0ac5ea70881f615ef3'
            '153b3fcf2d418582d5293a50d8bf3e17f9f500db5633b7927a1921d4527b158d'
            '61c60ab9a43d3c807a377da6bb26fad2b15c0d5da9ba0d87295f4c436751886e'
            '654009e17265be3b698ad6b8d675dbc8410e36a5975fd774fb0b2d416d617c9a')

build() {
    # fix some small issues with monacoB
    mkdir -p "${srcdir}/monacob-patched"

    find "${srcdir}/monaco-bold-"* -type f -name '*.otf' |
        xargs python3 "${srcdir}/monacob-font-patcher.py" \
        --output-dir "${srcdir}/monacob-patched" 2> /dev/null

    # patch monacoB with Nerd Fonts patcher
    mkdir -p "${srcdir}/nerd-patched"
    find "${srcdir}/monacob-patched" -type f -name '*.otf' \
        -exec fontforge -script "${srcdir}/font-patcher" {} \
        --mono --careful --complete --progressbars --outputdir "${srcdir}/nerd-patched" \;
}

package() {
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d "${pkgdir}/usr/share/fonts/monacob"
    install -Dm644 "${srcdir}/nerd-patched/"*.otf "${pkgdir}/usr/share/fonts/monacob"
    install -Dm644 "${srcdir}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}"
}
