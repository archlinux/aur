# Maintainer: Thors Snorresson <archlinux.jmve3 at passmail dot net>
pkgname=ascendara-bin
_pkgname=ascendara
pkgver=10.3.0
pkgrel=1
pkgdesc="Game launcher that downloads, installs, and manages games automatically"
arch=('x86_64')
url="https://github.com/Ascendara/ascendara"
license=('MIT')
depends=('nss' 'gtk3' 'alsa-lib' 'hicolor-icon-theme')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=(!strip !debug)
source=(
    "${_pkgname}-${pkgver}.AppImage::https://github.com/Ascendara/ascendara/releases/download/${pkgver}/Ascendara-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Ascendara/ascendara/${pkgver}/LICENSE"
)
sha256sums=(
    'ae93e6628bf480a3acfe174f695ac2480c4abd3a823b103fa3252b442b3cefde'
    'd77e5497eec76e92aa08602f8540d2259a59406cb8a42db90519a67cd6a6c5d7'
)
noextract=("${_pkgname}-${pkgver}.AppImage")

prepare() {
    cd "$srcdir"
    chmod +x "${_pkgname}-${pkgver}.AppImage"
    ./"${_pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null
}

package() {
    cd "$srcdir"

    install -dm755 "$pkgdir/opt/$_pkgname"
    cp -a squashfs-root/. "$pkgdir/opt/$_pkgname/"
    chmod -R u=rwX,go=rX "$pkgdir/opt/$_pkgname"

    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$_pkgname" <<EOF
#!/bin/sh
exec /opt/$_pkgname/AppRun --no-sandbox "\$@"
EOF
    chmod 755 "$pkgdir/usr/bin/$_pkgname"

    install -Dm644 "squashfs-root/${_pkgname}.desktop" \
        "$pkgdir/usr/share/applications/${_pkgname}.desktop"
    sed -i "s|^Exec=.*|Exec=/usr/bin/${_pkgname} %U|" \
        "$pkgdir/usr/share/applications/${_pkgname}.desktop"

    install -Dm644 "squashfs-root/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/${_pkgname}.png"

    install -Dm644 "LICENSE-${pkgver}" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
