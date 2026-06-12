# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=scrcpy-mask-bin
pkgver=0.8.1
pkgrel=1
pkgdesc='Control Android devices via customizable mouse/keyboard mappings using scrcpy protocol'
arch=('x86_64')
url='https://github.com/AkiChase/scrcpy-mask'
# Apache-2.0 was present through v0.6.0; dropped during v0.7.0 rewrite (reported upstream #117)
license=('Apache-2.0')
depends=('android-tools' 'alsa-lib' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
         'libdrm' 'libva' 'libvdpau' 'libx11' 'libxcb' 'libxext' 'libxfixes'
         'systemd-libs')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')

source=("${pkgname}-${pkgver}.zip::${url}/releases/download/v${pkgver}/scrcpy-mask-linux-x64.zip"
        "${pkgname}-${pkgver}-icon.png::https://raw.githubusercontent.com/AkiChase/scrcpy-mask/v${pkgver}/icons/128x128.png")
sha256sums=('846088e65465b5a519fa82ceac3978d74ae2f4c90dda9533dad168335b5d542e'
            'cf45e9c198648bea6eb041e696f468a985b5b6401cc5e1f2706ada5c5993ab03')

latestver() {
    gh api --paginate repos/AkiChase/scrcpy-mask/releases --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "scrcpy-mask-linux-x64.zip")) | .tag_name' |
    head -1 | sed 's/^v//'
}

package() {
    # Binary and assets to /opt (Bevy expects assets/ adjacent to binary)
    install -d "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm755 scrcpy-mask "${pkgdir}/opt/${pkgname%-bin}/scrcpy-mask"
    cp -r assets "${pkgdir}/opt/${pkgname%-bin}/"

    # Wrapper script (Bevy resolves assets/ relative to CWD)
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/scrcpy-mask" <<'WRAPPER'
#!/bin/sh
cd /opt/scrcpy-mask || exit 1
exec ./scrcpy-mask "$@"
WRAPPER

    # Desktop entry
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/scrcpy-mask.desktop" <<'DESKTOP'
[Desktop Entry]
Name=Scrcpy Mask
Comment=Control Android devices via customizable mouse/keyboard mappings
Exec=scrcpy-mask
Icon=scrcpy-mask
Terminal=false
Type=Application
Categories=Utility;
DESKTOP

    # Icon
    install -Dm644 "${pkgname}-${pkgver}-icon.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/scrcpy-mask.png"
}
