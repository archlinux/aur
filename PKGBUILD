# Maintainer: o-murphy <thehelixpg@gmail.com>
pkgname=ebalistyka-bin
_pkgver="0.1.18"
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="Ballistic trajectory calculator"
arch=('x86_64' 'aarch64')
url="https://github.com/o-murphy/ebalistyka"
license=('GPL-3.0-only')
depends=('gtk3' 'glib2')
provides=('ebalistyka')
conflicts=('ebalistyka')
options=('!strip')

_app_id="io.github.o_murphy.ebalistyka"
_tag="v${_pkgver}"
_relurl="https://github.com/o-murphy/ebalistyka/releases/download/${_tag}"
_rawurl="https://raw.githubusercontent.com/o-murphy/ebalistyka/${_tag}"

noextract=(
    "ebalistyka-x86_64.tar.gz"
    "ebalistyka-aarch64.tar.gz"
)
source=(
    "ebalistyka.desktop::${_rawurl}/app/share/applications/${_app_id}.desktop"
    "icon.png::${_rawurl}/app/share/icons/hicolor/512x512/apps/${_app_id}.png"
    "${_app_id}.metainfo.xml::${_rawurl}/app/share/metainfo/${_app_id}.metainfo.xml"
)
source_x86_64=("ebalistyka-x86_64.tar.gz::${_relurl}/ebalistyka_linux_x86_64.tar.gz")
source_aarch64=("ebalistyka-aarch64.tar.gz::${_relurl}/ebalistyka_linux_aarch64.tar.gz")
sha256sums=('28e47f4778b3de7890c4049b17c1a5c0db466248f88c51f817c1c5661bf35614' 'abc08e6334f666a5ab4ae6709d1a2b54b776430016bae670badb49d201ee539b' 'e2ef1f722475aaf6aa097d3fba53af2567454a78b154a6c71da86447bcad1055')
sha256sums_x86_64=('15532846601ed680d22863ea62d16e887034c5704ed38f2fa9603516f2a527f4')
sha256sums_aarch64=('f4d10322f037ba1b705530bc6d834365477bbb23695b9e24f1666a3274f843f0')

prepare() {
    mkdir -p bundle
    if [ "$CARCH" = "x86_64" ]; then
        bsdtar -xf "ebalistyka-x86_64.tar.gz" -C bundle/
    else
        bsdtar -xf "ebalistyka-aarch64.tar.gz" -C bundle/
    fi
}

package() {
    install -d "${pkgdir}/opt/ebalistyka"
    cp -a "${srcdir}/bundle/." "${pkgdir}/opt/ebalistyka/"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/ebalistyka" <<'EOF'
#!/bin/sh
APP=/opt/ebalistyka
export LD_LIBRARY_PATH="$APP/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
export EBALISTYKA_INSTALLER=aur
exec "$APP/ebalistyka" "$@"
EOF

    install -Dm644 "${srcdir}/icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_app_id}.png"

    install -Dm644 "${srcdir}/ebalistyka.desktop" \
        "${pkgdir}/usr/share/applications/${_app_id}.desktop"

    install -Dm644 "${srcdir}/${_app_id}.metainfo.xml" \
        "${pkgdir}/usr/share/metainfo/${_app_id}.metainfo.xml"
}
