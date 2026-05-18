# Maintainer: itlxrd <ilyakm@icloud.com>
pkgname=psysonic-bin
pkgver=1.46.0
pkgrel=1
pkgdesc="Desktop music player for Subsonic API-compatible servers (pre-built binary)"
arch=('x86_64')
url="https://github.com/Psychotoxical/psysonic"
license=('GPL-3.0-only')
provides=('psysonic')
conflicts=('psysonic')
options=('!debug')
depends=(
    'alsa-lib'
    'gtk3'
    'webkit2gtk-4.1'
    'libappindicator-gtk3'
    'nss'
    'at-spi2-core'
    'libxtst'
    'xorg-xwayland'
)
source=("https://github.com/Psychotoxical/psysonic/releases/download/app-v${pkgver}/Psysonic_${pkgver}_amd64.deb")
sha256sums=('6a3609cd24b40b009d3d859717b4e38834d2a211d8ec9a0706a33f1c35414cab')

package() {
    mkdir -p "${srcdir}/data"
    bsdtar -xf data.tar.* -C "${srcdir}/data"
    cp -dr --no-preserve=ownership "${srcdir}/data/usr" "${pkgdir}/"
    mv "${pkgdir}/usr/bin/psysonic" "${pkgdir}/usr/bin/psysonic-bin"
    cat <<EOF > "${pkgdir}/usr/bin/psysonic"
#!/bin/sh
exec /usr/bin/psysonic-bin "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/psysonic"
    local df=$(find "${pkgdir}/usr/share/applications" -name "*.desktop")
    if [ -f "$df" ]; then
        sed -i 's|^Exec=.*|Exec=psysonic %U|' "$df"
        sed -i 's/Terminal=false/Terminal=false/' "$df"
    fi
}
