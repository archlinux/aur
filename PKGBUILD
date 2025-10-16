# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: A. Benz <hello@benz.dev>

_pkgauthor=abenz1267
_pkgname=walker
pkgname=${_pkgname}-bin
pkgver=2.5.1
pkgrel=1
_pkgvername=v${pkgver}
pkgdesc='wayland application runner'

arch=('x86_64')
_barch=('x86_64')

url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${_pkgvername}"

license=('GPL-3.0')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'gcc-libs' 'glib2' 'gtk4' 'gtk4-layer-shell' 'poppler-glib' 'cairo' 'elephant')
optdepends=('elephant-providerlist: providerlist provider'
            'elephant-desktopapplications: desktopapplications provider'
            'elephant-archlinuxpkgs: archlinuxpkgs provider'
            'elephant-calc: calc provider'
            'elephant-clipboard: clipboard provider'
            'elephant-files: files provider'
            'elephant-menus: menus provider'
            'elephant-runner: runner provider'
            'elephant-symbols: symbols provider'
            'elephant-todo: todo provider'
            'elephant-unicode: unicode provider'
            'elephant-websearch: websearch provider'
            'elephant-bluetooth: bluetooth provider')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}.md::${_urlraw}/README.md"
        "config-${pkgver}.toml::${_urlraw}/resources/config.toml"
        "item-${pkgver}.xml::${_urlraw}/resources/themes/default/item.xml"
        "item_archlinuxpkgs-${pkgver}.xml::${_urlraw}/resources/themes/default/item_archlinuxpkgs.xml"
        "item_calc-${pkgver}.xml::${_urlraw}/resources/themes/default/item_calc.xml"
        "item_clipboard-${pkgver}.xml::${_urlraw}/resources/themes/default/item_clipboard.xml"
        "item_dmenu-${pkgver}.xml::${_urlraw}/resources/themes/default/item_dmenu.xml"
        "item_files-${pkgver}.xml::${_urlraw}/resources/themes/default/item_files.xml"
        "item_providerlist-${pkgver}.xml::${_urlraw}/resources/themes/default/item_providerlist.xml"
        "item_symbols-${pkgver}.xml::${_urlraw}/resources/themes/default/item_symbols.xml"
        "item_todo-${pkgver}.xml::${_urlraw}/resources/themes/default/item_todo.xml"
        "item_unicode-${pkgver}.xml::${_urlraw}/resources/themes/default/item_unicode.xml"
        "layout-${pkgver}.xml::${_urlraw}/resources/themes/default/layout.xml"
        "preview-${pkgver}.xml::${_urlraw}/resources/themes/default/preview.xml"
        "style-${pkgver}.css::${_urlraw}/resources/themes/default/style.css")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '3b03f13bd3377daa0058c9679ed5cf9378d0a8f9523b36414d0898d93ca64686'
            '683da63633d686f44d1492e652acf3bb95e02e354f4630954cd5e702da2cba8e'
            'dcd4e5463db30e4a4c204380087f472b8a338e275bfea8d9b75a17da1437e2ad'
            '4b5a6bd9074ae07f5d05bdebb26f2922f710b2b5d8aaddba6da5c5d06c21d1e5'
            '9da14438e381542cb56aae33ca76e04caa6f39f2b3e577f5f188954819126bff'
            '9a6df71bac60109c06b6667a38cf359f678ac7abae6c4d31cca8ba86c2df47c3'
            '230232b3df8058708e88d614d6f42b247f0c074304fb5b354f702b1843ba74f0'
            '720fc46916fdf1fd916caa3d418e9544413a5b79a9cd717e077d936b2f5cafa2'
            'cac945fa4d4d6894b2bd062a2fbfbedd9c25b774042bfb8cf9b71c32dea49285'
            '0f587b5f21467d1e3f931b661796a77102a19ee3c0b1cd7776e56f935190aad4'
            'c951db2edae2a8c7040dfc6227c00227f86010c45baa348bd9adab231d80a717'
            '0f587b5f21467d1e3f931b661796a77102a19ee3c0b1cd7776e56f935190aad4'
            '5175c88a9bb7db96ea7286eb0226afd89caa2f2aa178a64a00fc2348016db0e3'
            '073a912e3eee95249236af90ce50496a3b94bd840919b2d94e058054dbf3ca25'
            '66961a22014a49b15e840c5a1f764ed1bf9efd759dc4bc8ab74fa122a91e7302')
sha256sums_x86_64=('baff2435d5e36cb87feb1c24911451f65eba97ec5c8ebd8213c84d562b936314')

prepare() {
    cd "${srcdir}" || exit 1

    mkdir -p ./config
    for f in *.toml; do mv ${f} config/${f//-${pkgver}/} ; done

    mkdir -p ./themes
    for f in *.{xml,css}; do mv ${f} themes/${f//-${pkgver}/} ; done
}

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 "${_pkgname}" -t "${pkgdir}/usr/bin"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd "${srcdir}/config" || exit 1
    install -Dm644 config.toml -t "${pkgdir}/etc/xdg/"${_pkgname}""

    cd "${srcdir}/themes" || exit 1
    for theme in ./*; do
        install -Dm644 ${theme} -t "${pkgdir}/etc/xdg/"${_pkgname}"/themes/default"
    done
}
