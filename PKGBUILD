# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: A. Benz <hello@benz.dev>

_pkgauthor=abenz1267
_pkgname=walker

pkgname=${_pkgname}-bin

pkgver=2.10.0
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
optdepends=('elephant-all: elephant + all official elephant providers')

backup=("etc/xdg/${_pkgname}/config.toml")

options=(!strip)

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
        "keybind-${pkgver}.xml::${_urlraw}/resources/themes/default/keybind.xml"
        "layout-${pkgver}.xml::${_urlraw}/resources/themes/default/layout.xml"
        "preview-${pkgver}.xml::${_urlraw}/resources/themes/default/preview.xml"
        "style-${pkgver}.css::${_urlraw}/resources/themes/default/style.css")
source_x86_64=("${_pkgname}-${arch[0]}-${pkgver}.tar.gz::${url}/releases/download/${_pkgvername}/${_pkgname}-${_pkgvername}-${_barch[0]}-unknown-linux-gnu.tar.gz")

sha256sums=('3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '08387c89b86a82db9d206fd960735f6ae859f62acc8a21dfe99b7558f1d689b4'
            'd4db1676cad8bef599827d671eff401b3ccba880ec1359c61802634d40b101a8'
            'd6dac24c66c6e851e4a0f702154ccd92a1b0f64990beeff393b530ccd1089721'
            'e9613245a50e92f6da1e6f09bc84473fae716ee4c30b2536a4f0b285a1536c94'
            '1c08b011b1c28ca332c96888e4b8fc02f36ec1e057986acfca568dfa4cccf73f'
            'b3597b72d3b51ecb9cec4aacd0d4a0629938e62e504fa60fdc6261fd092fea51'
            '4fe8af0457cdf1631ff3b6ac4ead13111e9044ab8071bcfe4dcbf48d0af0ff98'
            '8ded6a2cc65c1c8cb2390e272b27a2a6b33d265d8a1981acab09990400b0b3ae'
            '4de69a8744729c5a6521d062b541831046c6f06887ac30e22465c1f753764c00'
            '2fae16af71969dca54b04ba9e5356cf727ec7c383ddfdfafd6f502bf4b43705f'
            '8e812699db2aa167663ccfdaf865e88a833623593f252fab97d820f7d0d7e718'
            '34ef99fced5e26a34a834e3edb2e4162823cafea1002f7c753522a05d59ef1fd'
            '8113e9f81aaa28bba9c4526c9bbbeb940600d842d9d5cec144fcc86e975184a9'
            '0a13000aa81a10b4550a7551943b3698a7982b98bbd33ebec6492a89662cbaf0'
            '073a912e3eee95249236af90ce50496a3b94bd840919b2d94e058054dbf3ca25'
            'e54b6d66acbd21ceab235364ad7470fcf95b3259af6302f0d20520156b6b4e80')
sha256sums_x86_64=('51c2dd3fbc1ef0d48a86f0bd480278fa6a8fd12bd99e5a78022573d5b70336f3')

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
    install -Dm644 config.toml -t "${pkgdir}/etc/xdg/${_pkgname}"

    cd "${srcdir}/themes" || exit 1
    for theme in ./*; do
        install -Dm644 ${theme} -t "${pkgdir}/etc/xdg/${_pkgname}/themes/default"
    done
}
