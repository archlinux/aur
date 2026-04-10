# Maintainer: itlxrd <ilyakm@icloud.com>
pkgname=psysonic-bin
pkgver=1.34.8
pkgrel=1
pkgdesc="Desktop music player for Subsonic API-compatible servers (pre-built binary)"
arch=('x86_64')
url="https://github.com/Psychotoxical/psysonic"
license=('GPL-3.0-only')
provides=('psysonic')
conflicts=('psysonic')
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
sha256sums=('d292aa4dd8590817b54a13b64652fe90de542d1b690f5338b620a8a8df5252fe')

package() {
    mkdir -p "${srcdir}/data"
    bsdtar -xf data.tar.* -C "${srcdir}/data"
    cp -dr --no-preserve=ownership "${srcdir}/data/usr" "${pkgdir}/"
    mv "${pkgdir}/usr/bin/psysonic" "${pkgdir}/usr/bin/psysonic-bin"
    cat <<EOF > "${pkgdir}/usr/bin/psysonic"
#!/bin/sh
export WEBKIT_DISABLE_COMPOSITING_MODE=1
export GDK_BACKEND=x11
exec /usr/bin/psysonic-bin "\$@"
EOF
    chmod +x "${pkgdir}/usr/bin/psysonic"
    local df=$(find "${pkgdir}/usr/share/applications" -name "*.desktop")
    if [ -f "$df" ]; then
        sed -i 's|^Exec=.*|Exec=psysonic %U|' "$df"
        sed -i 's/Terminal=false/Terminal=false/' "$df"
    fi
}
