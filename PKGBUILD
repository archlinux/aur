# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: A. Benz <hello@benz.dev>

_pkgauthor=abenz1267
_pkgname=walker
pkgname=${_pkgname}-bin
pkgver=2.0.0
_pkgvername=v${pkgver}
pkgrel=1
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
            '698c67d7d14aea729f3ade888f1b26e3da8ab7412a8635efd0cdd4ec4744468b'
            '556098e7a04a06f148cc8e2d02a731014289344faccb8eb004a3c73bc5e220f8'
            '84a0cb659db1db2dff55117cb00b3681cafb56248da48e5c2ddb66ca3ae999ec'
            '4b5a6bd9074ae07f5d05bdebb26f2922f710b2b5d8aaddba6da5c5d06c21d1e5'
            '9da14438e381542cb56aae33ca76e04caa6f39f2b3e577f5f188954819126bff'
            '9a6df71bac60109c06b6667a38cf359f678ac7abae6c4d31cca8ba86c2df47c3'
            '230232b3df8058708e88d614d6f42b247f0c074304fb5b354f702b1843ba74f0'
            '720fc46916fdf1fd916caa3d418e9544413a5b79a9cd717e077d936b2f5cafa2'
            'e784b7f98d25e815ab26b95c379536fedf900684f0edcc812d913905bf4bea4b'
            '0f587b5f21467d1e3f931b661796a77102a19ee3c0b1cd7776e56f935190aad4'
            'e9df9bde7c1f291bdb034537830428071f15035913ad78e9cd7093406020a561'
            '0f587b5f21467d1e3f931b661796a77102a19ee3c0b1cd7776e56f935190aad4'
            '409ee3fe13e391fd36ba3fa97f34e2cf1a42d82124e13b53c1df4cfb6e252333'
            '073a912e3eee95249236af90ce50496a3b94bd840919b2d94e058054dbf3ca25'
            'fac6b8fe030250c51a9b4860d5d43d2e64457afa7c3ba4fc2600a80ec766e455')
sha256sums_x86_64=('6270c91423ad4aef32182801ff3b0b6ceec1407c9d58a9eed0ebcb338c759e05')

prepare() {
    cd "${srcdir}" || exit 1

    mkdir -p ./config
    for f in *.toml; do mv ${f} config/${f//-${pkgver}/} ; done

    mkdir -p ./themes
    for f in *.{xml,css}; do mv ${f} themes/${f//-${pkgver}/} ; done
}

package() {
    cd "${srcdir}" || exit 1

    install -Dm755 walker -t "${pkgdir}/usr/bin"

    install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    cd "${srcdir}/config" || exit 1
    install -Dm644 config.toml -t "${pkgdir}/etc/xdg/walker"

    cd "${srcdir}/themes" || exit 1
    for theme in ./*; do
        install -Dm644 ${theme} -t "${pkgdir}/etc/xdg/walker/themes/default"
    done
}
