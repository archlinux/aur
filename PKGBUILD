# Maintainer: o-murphy <thehelixpg@gmail.com>
pkgname=ebalistyka-bin
_pkgver="0.1.11-dev"
pkgver="${_pkgver//-/.}"
pkgrel=1
pkgdesc="Ballistic trajectory calculator"
arch=('x86_64' 'aarch64')
url="https://github.com/o-murphy/ebalistyka-app"
license=('GPL-3.0-only')
depends=('gtk3' 'glib2')
provides=('ebalistyka')
conflicts=('ebalistyka')
options=('!strip')

_app_id="io.github.o_murphy.ebalistyka"
_tag="v${_pkgver}"
_relurl="https://github.com/o-murphy/ebalistyka-app/releases/download/${_tag}"
_rawurl="https://raw.githubusercontent.com/o-murphy/ebalistyka-app/${_tag}"

noextract=(
    "ebalistyka-x86_64.tar.gz"
    "ebalistyka-aarch64.tar.gz"
)
source=(
    "ebalistyka.desktop::${_rawurl}/flatpak/${_app_id}.desktop"
    "icon.png::${_rawurl}/assets/icon_512x512.png"
    "${_app_id}.metainfo.xml::${_rawurl}/flatpak/${_app_id}.metainfo.xml"
)
source_x86_64=("ebalistyka-x86_64.tar.gz::${_relurl}/ebalistyka_linux_x86_64.tar.gz")
source_aarch64=("ebalistyka-aarch64.tar.gz::${_relurl}/ebalistyka_linux_aarch64.tar.gz")
sha256sums=('1070457b57fde586f987281304289a929c7796586f6755b1da3a0fdd6be11b33' '2089e387fefdce7c89e35629500bcbd3e22ee43a196a782f5771ccf2725f270b' 'a79f358d27055ed4dea446f47a2e74440a64df88c87d9cef24ccc69f17446b1a')
sha256sums_x86_64=('375268995f558563ba23fbe96919df7acde1f2032e50e072ead950ef5f61a2ed')
sha256sums_aarch64=('84a6f6700e8423f386b6b41931bb42fc15ac50ec3d09432289545b51540cade2')

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
